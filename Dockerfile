FROM lopsided/archlinux:devel as build

# Define user
ENV USER pwnbox

# Setup base pacman repositories
RUN sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 16/g' /etc/pacman.conf && \
    pacman -Syyu --noconfirm && pacman -S --noconfirm systemd-sysvcompat zsh && \
    sed -i 's/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers && \
    printf "[pwnbox]\nSigLevel = Optional TrustedOnly\nServer = https://raw.githubusercontent.com/platypew/pwnbox2-repo/master/\$arch\n" >> /etc/pacman.conf && \
    curl -fsSL https://blackarch.org/strap.sh | sh

# Setup users
RUN useradd -m -g users -G wheel -s /usr/bin/zsh $USER && \
    touch /home/$USER/.zshrc

# Download i386 and x86_64 glibc
RUN if [ ! -d "/lib64" ]; then \
        mkdir /tmp/glibc && \
        curl -fsSL https://archlinux.org/packages/core/x86_64/glibc/download | bsdtar -C /tmp/glibc -xvf - && \
        mv /tmp/glibc/usr/lib /lib64; \
    fi && \
    curl -fsSL https://archlinux.org/packages/core/x86_64/lib32-glibc/download | bsdtar -C / -xvf -

USER $USER
WORKDIR /home/$USER

# Copy configuration files
COPY --chown=$USER:users ./config/neovim /home/$USER/.config/nvim
COPY --chown=$USER:users ./config/zsh /home/$USER
COPY --chown=$USER:users ./config/tmux /home/$USER

# Download tools (Remove vanilla gdb)
RUN mkdir -p /home/$USER/.local/bin && \
    sudo pacman -S --noconfirm bat exa fzf iputils mlocate neovim net-tools nodejs npm openssh \
         openvpn p7zip pigz procps-ng python-pip python-virtualenv ripgrep tmux unrar unzip \
         wget yay && \
    sudo pacman -S --noconfirm strace ltrace rz-ghidra ropper binwalk foremost gnu-netcat \
         python-gmpy2 xortool gobuster exploitdb hexedit pwndbg sqlmap z3 jadx nmap \
         perl-image-exiftool python-pwntools python-pycryptodome metasploit gdb-multiarch \
         aflplusplus && \
    sudo pacman -Rdd --noconfirm gdb && \
    sudo npm install -g ngrok && \
    echo "source /usr/share/pwndbg/gdbinit.py" >> /home/$USER/.gdbinit && \
    ln -s /usr/bin/vendor_perl/exiftool /home/$USER/.local/bin && \
    sudo setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip /usr/sbin/nmap

# Install qemu user and binutils for x86 if on arm
RUN if [ "$(uname -m)" == "aarch64" ]; then \
        sudo pacman -S --noconfirm qemu-user && cp /usr/sbin/qemu-i386 /usr/sbin/qemu-x86_64 /tmp && \
        sudo pacman -Rsc --noconfirm qemu-user && sudo pacman -S --noconfirm liburing && sudo mv /tmp/qemu-i386 /tmp/qemu-x86_64 /usr/sbin && \
        sudo pacman -S --noconfirm x86_64-elf-binutils ; \
    fi

# Setup yafu
RUN wget -O /tmp/yafu.tgz https://github.com/PlatyPew/yafu-docker/releases/download/v2.09/yafu.tgz && \
    sudo tar -xzf /tmp/yafu.tgz -C / && \
    sudo sed -i 's/ecm_path=\.\.\\gmp-ecm\\bin\\x64\\Release\\ecm.exe/ecm_path=\/usr\/sbin\/ecm/g' /etc/yafu/yafu.ini && \
    sudo pacman -S --noconfirm gmp-ecm --overwrite \*

# Download libc db and rsactftool
RUN git clone --depth=1 https://github.com/niklasb/libc-database.git /home/$USER/.local/share/libc-database && \
    git clone --depth=1 https://github.com/Ganapati/RsaCtfTool.git /home/$USER/.local/share/rsactftool && \
    ln -sf /usr/bin/yafu /home/$USER/.local/share/rsactftool/attacks/single_key/yafu && \
    ln -s /home/$USER/.local/share/rsactftool/RsaCtfTool.py /home/$USER/.local/bin/rsactftool

# Download autorecon and pwncat-cs
RUN virtualenv --system-site-packages /home/$USER/.local/share/venv && \
    /home/$USER/.local/share/venv/bin/pip install --upgrade pwncat-cs && \
    pip install --upgrade --user git+https://github.com/Tib3rius/AutoRecon.git && \
    ln -sf /home/$USER/.local/share/venv/bin/pwncat-cs /home/$USER/.local/bin/pwncat

# Setup Qol tools
RUN yay -S --noconfirm autojump && \
    sudo mkdir -p /mnt/shared && ln -s /mnt/shared /home/$USER/shared

# Setup Neovim
RUN pip install neovim && nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync" && \
    cd /home/$USER/.local/share/nvim/site/pack/packer/start/coq_nvim && mkdir ./tmp && \
    TMPDIR=./tmp python3 -m coq deps && rm -rf ./tmp && \
    nvim --headless -c "TSInstallSync c cpp java javascript python" -c "qall"

# Setup zgenom
RUN git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom" && \
    touch /home/$USER/.hushlogin && \
    zsh -c "source /home/$USER/.zshrc && /home/$USER/.zgenom/sources/romkatv/powerlevel10k/___/gitstatus/install"

# Clean system
RUN yay -Scc --noconfirm && yay -Rsc --noconfirm $(yay -Qtdq) || true && \
    sudo rm -rf /home/$USER/.zshrc.pre-oh-my-zsh /home/$USER/.zsh_history /home/$USER/.bash_profile /home/$USER/.wget-hsts \
         /home/$USER/.bash_logout /home/$USER/.bundle /tmp/* /var/cache /home/$USER/.cache/pip /home/$USER/.cache/yay && \
    sudo updatedb

# Setup for systemd
USER root
COPY ./config/docker-entrypoint.sh /


# Copy all files to new image to squash it
FROM scratch

ENV USER pwnbox
COPY --from=build / /
WORKDIR /home/$USER

ENTRYPOINT [ "/docker-entrypoint.sh" ]
