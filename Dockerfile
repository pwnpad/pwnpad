FROM platypew/gdb-multiarch as gdb


FROM lopsided/archlinux:devel as build

ENV USER pwnbox

ARG ZONE=Asia \
    SUBZONE=Singapore

RUN sed -i 's/#ParallelDownloads = 5/ParallelDownloads = 16/g' /etc/pacman.conf && \
    pacman -Syyu --noconfirm && pacman -S --noconfirm systemd-sysvcompat zsh && \
    sed -i 's/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/g' /etc/sudoers && \
    curl -fsSL https://blackarch.org/strap.sh | sh && \
    useradd -m -g users -G wheel -s /usr/bin/zsh $USER && touch /home/$USER/.zshrc && \
    cat /usr/share/zoneinfo/$ZONE/$SUBZONE > /etc/localtime && \
    if [ ! -d "/lib64" ]; then \
        mkdir /tmp/glibc && \
        curl -fsSL https://archlinux.org/packages/core/x86_64/glibc/download | bsdtar -C /tmp/glibc -xvf - && \
        mv /tmp/glibc/usr/lib /lib64; \
    fi && \
    curl -fsSL https://archlinux.org/packages/core/x86_64/lib32-glibc/download | bsdtar -C / -xvf -

USER $USER
WORKDIR /home/$USER
COPY --chown=$USER:users ./config/neovim /home/$USER/.config/nvim
COPY --chown=$USER:users ./config/zsh /home/$USER
COPY --chown=$USER:users ./config/tmux /home/$USER
COPY --from=gdb /gdb-multiarch.tgz /tmp

RUN sudo pacman -S --noconfirm neovim exa wget bat fzf ripgrep tmux strace net-tools npm \
    iputils wget ltrace mlocate ufw python-pip python-virtualenv unzip unrar pigz p7zip nodejs \
    yarn openssh openvpn afl rz-ghidra ropper binwalk foremost gnu-netcat \
    python-gmpy2 xortool gobuster exploitdb hexedit pwndbg sqlmap z3 jadx nmap \
    perl-image-exiftool python-pwntools python-pycryptodome yay && \
    sudo pacman -Rdd --noconfirm gdb && \
    sudo tar -xzf /tmp/gdb-multiarch.tgz -C / && \
    wget -O /tmp/yafu.tgz https://github.com/PlatyPew/yafu-docker/releases/download/v2.09/yafu.tgz && \
    sudo tar -xzf /tmp/yafu.tgz -C / && \
    MAKEFLAGS="-j$(nproc)" yay -S --noconfirm metasploit-git autojump && \
    git clone --depth=1 https://github.com/niklasb/libc-database.git /home/$USER/.local/share/libc-database && \
    git clone --depth=1 https://github.com/Ganapati/RsaCtfTool.git /home/$USER/.local/share/rsactftool && \
    virtualenv --system-site-packages /home/$USER/.local/share/venv && \
    /home/$USER/.local/share/venv/bin/pip install --upgrade pwncat-cs && \
    pip install --upgrade --user git+https://github.com/Tib3rius/AutoRecon.git && \
    sudo npm install -g ngrok && \
    echo "source /usr/share/pwndbg/gdbinit.py" >> /home/$USER/.gdbinit && \
    mkdir -p /home/$USER/.local/bin && ln -sf /usr/bin/yafu /home/$USER/.local/share/rsactftool/attacks/single_key/yafu && \
    ln -s /home/$USER/.local/share/rsactftool/RsaCtfTool.py /home/$USER/.local/bin/rsactftool && \
    ln -sf /home/$USER/.local/share/venv/bin/pwncat-cs /home/$USER/.local/bin/pwncat-cs && \
    ln -s /usr/bin/vendor_perl/exiftool /home/$USER/.local/bin && \
    sudo setcap cap_net_raw,cap_net_admin,cap_net_bind_service+eip /usr/sbin/nmap && \
    sudo mkdir -p /mnt/shared && ln -s /mnt/shared /home/$USER/shared && \
    pip install neovim && nvim --headless -c "autocmd User PackerComplete quitall" -c "PackerSync" && \
    cd /home/$USER/.local/share/nvim/site/pack/packer/start/coq_nvim && mkdir ./tmp && \
    TMPDIR=./tmp python3 -m coq deps && rm -rf ./tmp && \
    nvim --headless -c "TSInstallSync c cpp java javascript python" -c "qall" && \
    git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom" && \
    touch /home/$USER/.hushlogin && \
    zsh -c "source /home/$USER/.zshrc && /home/$USER/.zgenom/sources/romkatv/powerlevel10k/___/gitstatus/install" && \
    sudo pacman -S --noconfirm qemu-user && cp /usr/sbin/qemu-i386 /usr/sbin/qemu-x86_64 /tmp && \
    sudo pacman -Rsc --noconfirm qemu-user && sudo pacman -S --noconfirm liburing && sudo mv /tmp/qemu-i386 /tmp/qemu-x86_64 /usr/sbin && \
    yay -Scc --noconfirm && yay -Rsc --noconfirm npm && yay -Rsc --noconfirm $(yay -Qtdq | grep -v gdb-common) || true && \
    sudo rm -rf /home/$USER/.zshrc.pre-oh-my-zsh /home/$USER/.zsh_history /home/$USER/.bash_profile \
    /home/$USER/.bash_logout /home/$USER/.bundle /tmp/* /var/cache /home/$USER/.cache/pip /home/$USER/.cache/yay && \
    sudo updatedb

USER root
COPY ./config/docker-entrypoint.sh /


FROM scratch

ENV USER pwnbox
COPY --from=build / /
WORKDIR /home/$USER

ENTRYPOINT [ "/docker-entrypoint.sh" ]
