FROM archlinux/base:latest

ENV USER pwnbox

# Installing yay
RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf && \
    pacman -Syyu --noconfirm && \
    pacman -S base-devel lib32-glibc git zsh --noconfirm
RUN sed -i 's/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g' /etc/sudoers && \
    useradd -m -g users -G wheel -s /usr/bin/zsh $USER && \
    touch /home/$USER/.zshrc
USER $USER
WORKDIR /home/$USER
RUN git clone https://aur.archlinux.org/yay.git && \
    cd yay && \
    makepkg -si --noconfirm

# Installing oh my zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /home/$USER/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
COPY ./zshrc /home/$USER/.zshrc
COPY ./agnoster-dracula.zsh-theme /home/$USER/.oh-my-zsh/custom/themes/agnoster-dracula.zsh-theme
COPY ./tmux.conf /home/$USER/.tmux.conf

# Installing QoL stuff
RUN yay -S neovim exa wget bat fzf ripgrep tmux autojump strace net-tools iputils wget ltrace mlocate python2-pip \
    python-pip python-virtualenv pypy3 unzip unrar pigz p7zip nodejs yarn ruby rubygems openssh ngrok reflector --noconfirm && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs\
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    mkdir -p /home/$USER/.config/nvim
COPY ./init.vim /home/$USER/.config/nvim
RUN sed '/call plug#end/q' /home/$USER/.config/nvim/init.vim > /home/$USER/.config/nvim/temp.vim && \
    nvim -u /home/$USER/.config/nvim/temp.vim -c ':PlugInstall' -c ':qall' && \
    rm -f /home/$USER/.config/nvim/temp.vim

# Change permissions
RUN sudo chown $USER:users /home/$USER/.zshrc \
    /home/$USER/.oh-my-zsh/custom/themes/agnoster-dracula.zsh-theme \
    /home/$USER/.config/nvim/init.vim \
    /home/$USER/.tmux.conf

RUN yay -S afl checksec radare2 ropper shellnoob wcc binwalk foremost gnu-netcat \
    python-gmpy2 hashpump msieve pkcrack xortool dirsearch mitmproxy john gdb exploitdb \
    sqlmap z3 jad hashcat patator metasploit nmap termshark-git perl-image-exiftool --noconfirm && \
    pip install --user --upgrade pycrypto factordb-pycli flake8 sagemath && \
    pip2 install --user --upgrade pwntools featherduster && \
    gem install zsteg one_gadget && \
    mkdir -p /home/$USER/.local/bin /home/$USER/.local/share && \
    ln -s /usr/bin/vendor_perl/exiftool /home/$USER/.local/bin && \
    r2pm init && r2pm install r2dec && \
    git clone https://github.com/niklasb/libc-database.git /home/$USER/.local/share/libc-database && \
    git clone https://github.com/Ganapati/RsaCtfTool.git /home/$USER/.local/share/RsaCtfTool && cd /home/$USER/.local/share/RsaCtfTool && \
    pip install -r requirements.txt --user && cd -

# Create shared directories
RUN sudo mkdir -p /mnt/shared && ln -s /mnt/shared /home/$USER/shared

# Cleanup
RUN yay -Scc --noconfirm && \
    rm -rvf /home/$USER/yay /home/$USER/.zshrc.pre-oh-my-zsh \
    /home/$USER/.zsh_history /home/$USER/.bash_profile \
    /home/$USER/.bash_logout /home/$USER/.cache /home/$USER/bin && \
    yay -R $(yay -Qtdq) --noconfirm && \
    sudo updatedb

# Start in zsh
ENTRYPOINT ["/usr/bin/zsh"]
