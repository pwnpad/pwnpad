FROM archlinux/base:latest

ENV USER pwn

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
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
COPY ./zshrc ~/.zshrc
COPY ./agnoster-dracula.zsh-theme ~/.oh-my-zsh/custom/themes/agnoster-dracula.zsh-theme

# Installing QoL stuff
RUN yay -S neovim exa wget bat fzf ripgrep tmux autojump strace net-tools iputils wget ltrace mlocate python2-pip \
    python-pip python-virtualenv pypy3 unzip unrar pigz p7zip nodejs yarn ruby rubygems openssh ngrok --noconfirm && \
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs\
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    mkdir -p ~/.config/nvim
COPY ./init.vim ~/.config/nvim/init.vim
RUN sed '/call plug#end/q' ~/.config/nvim/init.vim > ~/.config/nvim/temp.vim && \
    nvim -u ~/.config/nvim/temp.vim -c ':PlugInstall' -c ':qall' && \
    rm -f ~/.config/nvim/temp.vim

# Change permissions
RUN sudo chown $USER:users ~/.zshrc \
    ~/.oh-my-zsh/custom/themes/agnoster-dracula.zsh-theme \
    ~/.config/nvim/init.vim

RUN yay -S afl checksec radare2 ropper shellnoob wcc binwalk foremost gnu-netcat \
    python-gmpy2 hashpump msieve pkcrack xortool dirsearch mitmproxy john gdb \
    sqlmap z3 jad hashcat patator metasploit nmap wireshark-cli perl-image-exiftool --noconfirm && \
    pip install --user --upgrade pycrypto factordb-pycli sagemath flake8 && \
    pip2 install --user --upgrade pwntools featherduster && \
    gem install zsteg one_gadget && \
    mkdir -p ~/.local/bin ~/.local/share && \
    ln -s /usr/bin/vendor_perl/exiftool ~/.local/bin && \
    r2pm init && r2pm install r2dec && \
    git clone https://github.com/niklasb/libc-database.git ~/.local/share/libc-database && \
    git clone https://github.com/Ganapati/RsaCtfTool.git ~/.local/share/RsaCtfTool && cd ~/.local/share/RsaCtfTool && \
    pip install -r requirements.txt && cd ~

# Cleanup
RUN yay -Scc --noconfirm && \
    rm -rvf ~/yay ~/.zshrc.pre-oh-my-zsh \
    ~/.zsh_history ~/.bash_profile \
    ~/.bash_logout ~/.cache && \
    sudo updatedb

# Start in zsh
ENTRYPOINT ["/usr/bin/zsh"]
