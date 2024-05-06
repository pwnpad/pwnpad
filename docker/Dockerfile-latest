# vim: ft=dockerfile
FROM platypew/pwnpad:lite

ENV USER pwnpad
USER $USER

# Temporarily uninstall gnu netcat
RUN sudo pacman -R --noconfirm gnu-netcat && \
\
# Install extra software
    sudo pacman -Syu --noconfirm --overwrite='*' arp-scan autorecon commix creddump pwnpad/netexec \
         crunch dnsenum dnsrecon enum4linux-ng evil-winrm fping hashcat-utils hping pwnpad/john lbd \
         pwnpad/ligolo-ng ldapenum mimikatz nbtscan ncrack netsed netsniff-ng net-snmp ngrep nikto \
         onesixtyone proxychains-ng rustscan scalpel seclists sleuthkit smbmap snmpcheck socat swaks \
         tcpreplay traceroute wafw00f wce whatweb whois windows-binaries && \
\
# Fix smbclient
    sudo mkdir /etc/samba && \
    sudo wget -O /etc/samba/smb.conf \
         "https://raw.githubusercontent.com/samba-team/samba/master/examples/smb.conf.default" && \
\
# Fix ldconfig complaining about libwkhtmltox.so not being a symlink
    if [ "$(uname -m)" == "aarch64" ]; then \
        sudo ln -sf libwkhtmltox.so /usr/local/lib/libwkhtmltox.so.0 && \
        sudo ln -sf libwkhtmltox.so /usr/local/lib/libwkhtmltox.so.0.12 && \
        sudo ln -sf libwkhtmltox.so /usr/local/lib/libwkhtmltox.so.0.12.6 ; \
    fi && \
# Reinstall gnu netcat
    yes | sudo pacman -Sdd gnu-netcat && \
\
# Install responder
    sudo pacman -Sdd --noconfirm responder && \
\
# Uninstall old version of impacket
    sudo pacman -Rdd --noconfirm impacket && \
\
# Install reverse shell generator
    git clone --depth=1 https://github.com/pwnpad/revshellgen.git ~/.local/share/revshellgen && \
    ln -s ~/.local/share/revshellgen/revshellgen ~/.local/bin/revshellgen && \
\
# Install gui stuff
    sudo pacman -S --noconfirm xorg-server-xvfb x11vnc novnc xdotool gnu-free-fonts i3-wm i3status && \
\
# Clean up
    yay -Scc --noconfirm && yay -Rsc --noconfirm $(yay -Qtdq) ; \
    sudo rm -rf /home/$USER/.zshrc.pre-oh-my-zsh /home/$USER/.zsh_history /home/$USER/.bash_profile \
         /home/$USER/.wget-hsts /home/$USER/.bash_logout /home/$USER/.bundle /tmp/* /var/cache \
         /home/$USER/.cache/pip /home/$USER/.cache/yay /home/$USER/.npm /var/log/* \
         /home/$USER/.zcompdump-buildkitsandbox* ; \
\
    sudo updatedb

USER root
