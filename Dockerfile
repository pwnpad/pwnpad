FROM lopsided/archlinux:devel as build

# Define user
ENV USER pwnpad

# Setup base pacman repositories
RUN sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 16/g' /etc/pacman.conf && \
    pacman -Syyu --noconfirm && pacman -S --noconfirm systemd-sysvcompat zsh && \
    sed -i 's/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers && \
    curl -fsSL https://blackarch.org/strap.sh | sh && \
    printf '\n%s\n%s\n%s\n\n%s\n%s\n%s\n' \
           '[pwnpad]' 'SigLevel = Optional TrustedOnly' \
           'Server = https://raw.githubusercontent.com/pwnpad/pwnpad-repo/master/$arch' \
           '[pwnpad-large]' \
           'SigLevel = Optional TrustedOnly' \
           'Server = https://github.com/pwnpad/pwnpad-repo/releases/download/$arch' \
            >> /etc/pacman.conf && \
\
# Setup better sources for x86
    if [ "$(uname -m)" == "x86_64" ]; then \
        sed -i 'N;s/#\[multilib\]\n#/\[multilib\]\n/' /etc/pacman.conf && \
        printf '%s\n%s\n%s\n%s\n' \
               'Server = http://mirror.rackspace.com/archlinux/$repo/os/$arch' \
               'Server = http://mirrors.acm.wpi.edu/archlinux/$repo/os/$arch' \
               'Server = http://archlinux.uk.mirror.allworldit.com/archlinux/$repo/os/$arch' \
               'Server = http://mirror.0x.sg/archlinux/$repo/os/$arch' \
                > /etc/pacman.d/mirrorlist ; \
    fi && \
    sudo pacman -Sy && \
\
# Setup users
    useradd -m -g users -G wheel -s /usr/bin/zsh $USER && \
    touch /home/$USER/.zshrc && \
\
# Download i386 and x86_64 glibc
    if [ ! -d "/lib64" ]; then \
        mkdir /tmp/glibc && \
        curl -fsSL https://archlinux.org/packages/core/x86_64/glibc/download | \
            bsdtar -C /tmp/glibc -xf - && \
        mv /tmp/glibc/usr/lib /lib64 ; \
        curl -fsSL https://archlinux.org/packages/core/x86_64/lib32-glibc/download \
            | bsdtar -C / -xf - ; \
    else \
        sudo pacman -S --noconfirm lib32-gcc-libs ; \
    fi

COPY ./config/chroot/pacman64.conf /etc/pacman64.conf
COPY --chown=$USER:users ./config/chroot/pacman64 /home/$USER/.local/bin/pacman64

USER $USER
WORKDIR /home/$USER

# Copy configuration files
COPY --chown=$USER:users ./config/zsh /home/$USER
COPY --chown=$USER:users ./config/tmux /home/$USER
COPY --chown=$USER:users ./config/i3 /home/$USER/.config/i3

# Download tools (Remove vanilla gdb)
RUN mkdir -p /home/$USER/.local/bin && \
    sudo pacman -S --noconfirm bat exa fzf iproute2 iputils less mlocate neovim net-tools nodejs \
         npm openssh openvpn p7zip pigz procps-ng python-pip python-virtualenv ripgrep rlwrap tmux \
         unrar unzip wget yay && \
    mkdir /home/$USER/.ssh && touch /home/$USER/.ssh/authorized_keys && \
    chmod 600 /home/$USER/.ssh/authorized_keys && \
    sudo pacman -S --noconfirm aflplusplus binwalk foremost exploitdb gdb-multiarch gnu-netcat \
         gobuster hexedit jadx ltrace metasploit nmap perl-image-exiftool blackarch/pwndbg \
         python-gmpy2 python-pwntools ropper rsactftool strace xortool z3 && \
    echo "source /usr/share/pwndbg/gdbinit.py" >> /home/$USER/.gdbinit && \
    ln -s /usr/bin/vendor_perl/exiftool /home/$USER/.local/bin && \
    sudo setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip /usr/sbin/nmap && \
    sudo ln -s /usr/bin/yafu /usr/share/rsactftool/attacks/single_key/yafu && \
\
# Install rizin ghidra
    if [ "$(uname -m)" == "aarch64" ]; then \
        sudo pacman -S --noconfirm pwnpad/rz-ghidra ; \
    else \
        sudo pacman -S --noconfirm rz-ghidra ; \
    fi && \
    sudo ln -s /usr/bin/rizin /usr/bin/radare2 && \
    sudo ln -s /usr/bin/rizin /usr/bin/r2 && \
# Install sqlmap
    pip install --break-system-packages sqlmap && \
# Install ngrok
    if [ "$(uname -m)" == "aarch64" ]; then \
        yay -S --noconfirm aur/ngrok ; \
    else \
        sudo pacman -S --noconfirm ngrok ; \
    fi && \
\
# Install qemu user and binutils for x86 if on arm
    if [ "$(uname -m)" == "aarch64" ]; then \
        sudo pacman -S --noconfirm qemu-user && cp /usr/sbin/qemu-i386 /usr/sbin/qemu-x86_64 /tmp && \
        sudo pacman -Rsc --noconfirm qemu-user && sudo pacman -S --noconfirm liburing && \
        sudo mv /tmp/qemu-i386 /tmp/qemu-x86_64 /usr/sbin && \
        sudo pacman -S --noconfirm x86_64-elf-binutils numactl ; \
    fi && \
\
# Setup yafu
    wget -O /tmp/yafu.tgz https://github.com/PlatyPew/yafu-docker/releases/download/v2.09/yafu.tgz && \
    sudo tar -xzf /tmp/yafu.tgz -C / && \
    sudo sed -i 's/ecm_path=\.\.\\gmp-ecm\\bin\\x64\\Release\\ecm.exe/ecm_path=\/usr\/sbin\/ecm/g' \
         /etc/yafu/yafu.ini && \
    sudo pacman -S --noconfirm gmp-ecm --overwrite '*' && \
\
# Install Villain
    git clone --depth=1 https://github.com/pwnpad/Villain.git /home/$USER/.local/share/villain && \
    sudo pip install --break-system-packages -r /home/$USER/.local/share/villain/requirements.txt && \
    printf "%s\n%s\n%s\n" '#!/bin/sh' "cd /home/$USER/.local/share/villain" 'python3 Villain.py -qs $@' \
           > /home/$USER/.local/bin/villain && \
    chmod +x /home/$USER/.local/bin/villain && \
\
# Setup Qol tools
    yay -S --noconfirm autojump && \
    sudo mkdir -p /mnt/shared && ln -s /mnt/shared /home/$USER/shared && \
\
# Setup tmux
\
    git clone --depth=1 https://github.com/tmux-plugins/tpm /home/$USER/.tmux/plugins/tpm && \
    /home/$USER/.tmux/plugins/tpm/scripts/install_plugins.sh && \
# Setup Neovim
    git clone --depth=1 https://github.com/PlatyPew/neovim-init.lua.git /home/$USER/.config/nvim && \
    nvim -c "lua require('lazy').restore({wait = true})" +qa && \
\
# Setup zgenom
    git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom" && \
    touch /home/$USER/.hushlogin && \
    zsh -c "source /home/$USER/.zshrc && /home/$USER/.zgenom/sources/romkatv/powerlevel10k/___/gitstatus/install" && \
    mkdir -p /home/$USER/.config/bat/themes /home/$USER/.config/f-sy-h && \
    wget https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-mocha.tmTheme -O \
         /home/$USER/.config/bat/themes/Catppuccin-mocha.tmTheme && \
    bat cache --build && \
    wget https://raw.githubusercontent.com/catppuccin/zsh-fsh/main/themes/catppuccin-mocha.ini -O \
         /home/$USER/.config/f-sy-h/catppuccin-mocha.ini && \
    zsh -c "source /home/$USER/.zshrc && fast-theme CONFIG:catppuccin-mocha" && \
\
# Clean system
    yay -Scc --noconfirm && yay -Rsc --noconfirm $(yay -Qtdq) ; \
    sudo mv /usr/share/locale/locale.alias /usr/share/locale/en_US /tmp ; \
    sudo rm -rf /usr/share/locale/* ; sudo mv /tmp/locale.alias /tmp/en_US /usr/share/locale ; \
    sudo rm -rf /home/$USER/.zshrc.pre-oh-my-zsh /home/$USER/.zsh_history /home/$USER/.bash_profile \
         /home/$USER/.wget-hsts /home/$USER/.bash_logout /home/$USER/.bundle /tmp/* /var/cache \
         /home/$USER/.cache/pip /home/$USER/.cache/yay /home/$USER/.npm /var/log/* \
         /home/$USER/.zcompdump-buildkitsandbox* ; \
\
    sudo updatedb

# Setup for systemd
USER root
COPY ./config/docker-entrypoint.sh /


# Copy all files to new image to squash it
FROM scratch

ENV USER pwnpad
COPY --from=build / /
WORKDIR /home/$USER

ENTRYPOINT [ "/docker-entrypoint.sh" ]
