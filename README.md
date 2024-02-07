<div align="center">
    <img src="images/logo.png" style="width: 25%; height: auto;"/>
    <br/>
    <br/>
    <a href="https://github.com/pwnpad/pwnpad/blob/master/LICENSE"><img src="https://img.shields.io/github/license/pwnpad/pwnpad"></a>
    <a href="https://hub.docker.com/_/docker"><img src="https://img.shields.io/badge/docker-24.0.7-blue.svg"></a>
    <img src="https://img.shields.io/badge/Coded%20By%20Humans-100%25-brightgreen" />
    <a href="https://github.com/pwnpad/pwnpad/actions"><img src="https://img.shields.io/github/actions/workflow/status/pwnpad/pwnpad/docker-image.yml?label=docker%20build"></a>
    <br/>
    <a href="https://hub.docker.com/r/platypew/pwnpad/tags"><img src="https://img.shields.io/docker/image-size/platypew/pwnpad/lite?arch=amd64&label=lite-amd64"></a>
    <a href="https://hub.docker.com/r/platypew/pwnpad/tags"><img src="https://img.shields.io/docker/image-size/platypew/pwnpad/lite?arch=arm64&label=lite-arm64"></a>
    <br/>
    <a href="https://hub.docker.com/r/platypew/pwnpad/tags"><img src="https://img.shields.io/docker/image-size/platypew/pwnpad/latest?arch=amd64&label=latest-amd64"></a>
    <a href="https://hub.docker.com/r/platypew/pwnpad/tags"><img src="https://img.shields.io/docker/image-size/platypew/pwnpad/latest?arch=arm64&label=latest-arm64"></a>
    <br/>
    <a href="https://hub.docker.com/r/platypew/pwnpad/tags"><img src="https://img.shields.io/docker/image-size/platypew/pwnpad/bare?arch=amd64&label=bare-amd64"></a>
    <a href="https://hub.docker.com/r/platypew/pwnpad/tags"><img src="https://img.shields.io/docker/image-size/platypew/pwnpad/bare?arch=arm64&label=bare-arm64"></a>
    <br/>
    <h1>PwnPad</h1>
    <p>Perfect for doing Capture-The-Flag challenges and Pentesting on any platform, without needing a clunky, fat, resource hungry virtual machine. PwnPad provides a wide array of tools at your very own fingertips, powered by Arch Linux!</p>
    <br/>
    <img src="images/moneyshot.png" style="width: 100%; height: auto;"/>
    <i>Got OSCP with this btw 👍🏼</i>
</div>

## Contents

1. [Download](#download)
2. [Usage](#usage)
3. [Features](#features)
4. [Tools](#tools)
5. [License](#license)

<div align="center">
    <h1>Download</h1>
    <p>How to Download and Install PwnPad</p>
</div>

#### Requirements

-   Docker installed (Docker Desktop for Windows & Mac)
-   Nerd Fonts installed

#### Homebrew (macOS)

```
brew install pwnpad/tap/pwnpad
```

#### Git

PwnPad can also be downloaded directly from GitHub

```
git clone https://github.com/pwnpad/pwnpad.git
```

#### Getting Images

```bash
# Build image locally (Only works if you installed through cloning)
p2 build            # Basic image
p2 build -i lite    # Lite image
p2 build -i bare    # Bare image (Extra image without the user interface)

# Or pull from Docker Hub
docker pull platypew/pwnpad:lite   # Lite image
docker pull platypew/pwnpad:latest # Basic image
docker pull platypew/pwnpad:bare   # Bare image (Extra image without the user interface)
```

<br/>
<div align="center">
    <h1>Usage</h1>
    <p>How to operate PwnPad</p>
</div>

### Quick Start

```bash
# Using Base Image
p2 attach ctf

# Using Lite Image
p2 attach -i lite ctf

# Using Bare Image
# Using the privileged flag is not recommended, however, it solves a lot of manual adding of capabilities
docker run --privileged -it platypew/pwnpad:bare <tool name>
```

### General

You might want to alias `p2` in your bashrc/zshrc

```
$ p2
USAGE:
  p2 <SUBCOMMAND>

SUBCOMMAND:
  build     Build Docker image
  attach    Attach into container
  rm        Remove container and its volumes
  kill      Stop container from running
  volume    Enter into container's volume
  ls        List pwnpad instances
  update    Update image to the latest build

HELP:
  p2 build -h
  p2 attach -h
  p2 rm -h
```

<br/>
<div align="center">
    <h1>Features</h1>
    <p>Why PwnPad over other Docker-based environments?</p>
</div>
<br/>

1. It's powered by Arch, giving you access to the AUR and Blackarch (with systemd enabled)
2. It runs on Windows (WSL2), MacOS and Linux
3. It's built for both amd64 and arm64
4. It's super lightweight taking over 3GB of space
5. You can spawn as many independent instances as you want and remove them just as quick
6. Supports X11 forwarding
7. Supports VNC and noVNC with i3
8. Customised Neovim and Zsh so you look _super_ cool using it

### Integrated Features

#### SSH

You can ssh into PwnPad by doing these steps.

<details>

1. `sudo systemctl start sshd`
2. Insert your public key into `~/.ssh/authorized_keys`
3. Use `p2 ls` to the port bound to port 22
4. Do `ssh -p <port> pwnpad@localhost`

</details>

#### Proxy

You can proxy your traffic through PwnPad by doing these steps.

<details>

1. Use `p2 ls` to the port bound to port 22
2. `sshuttle -vHNr pwnpad@localhost:<port>`

</details>

#### Publish Port to Public

You can use ngrok to publish a port to the public.

<details>

-   Start: `publish start` (Insert api key if prompted)
-   Stop: `publish stop`
-   Status: `publish status`
-   Set a port to tunnel: `publish set <port>`
-   Delete a tunnelling port: `publish del <port>`

</details>

#### Toggle ASLR

You can turn ASLR on and off.

<details>

-   On: `aslr on`
-   Off: `aslr off`

</details>

#### Enable noVNC (not available in lite image)

<details>

Enabling VNC (you may need to run your system through a proxy to access the noVNC server).

-   Start: `gui start`
-   Stop: `gui stop`

</details>

#### Create intel environment (only in arm64 image)

Creates a chroot environment to run purely intel binaries.
You can still run intel binaries that uses only glibc within the regular context.

<details>

-   Use pacman: `intel-pacman`
-   Run command: `intel-run`

</details>

### Included Infosec Tools

| Tools            | Description                                                                                     |
| ---------------- | ----------------------------------------------------------------------------------------------- |
| aflplusplus   | American Fuzzing Lop fuzzer with community patches and additional features                       |
| arp-scan         | A tool that uses ARP to discover and fingerprint IP hosts on the local network                  |
| autorecon        | A multi-threaded network reconnaissance tool which performs automated enumeration of services   |
| binwalk       | Tool for searching a given binary image for embedded files                                       |
| commix           | Automated All-in-One OS Command Injection and Exploitation Tool                                 |
| creddump         | A python tool to extract various credentials and secrets from Windows registry hives            |
| crunch           | A wordlist generator for all combinations/permutations of a given character set                 |
| dnsenum          | Script that enumerates DNS information from a domain                                            |
| dnsrecon         | Python script for enumeration of hosts, subdomains and emails from a given domain using google. |
| enum4linux-ng    | A tool for enumerating information from Windows and Samba systems                               |
| evil-winrm       | The ultimate WinRM shell for hacking/pentesting                                                 |
| exiftool      | Meta information reader/writer                                                                   |
| exploitdb     | The official Exploit Database repository                                                         |
| foremost      | A console program to recover files based on their headers, footers, and internal data structures |
| fping            | Utility to ping multiple hosts at once                                                          |
| gdb-multiarch | The GNU Debugger for all gdb supported architectures (i386/arm/mips...)                          |
| gobuster      | URI and DNS subdomain bruteforcer                                                                |
| hashcat-utils    | Set of small utilities that are useful in advanced password cracking                            |
| hexedit       | Terminal-based hex editor                                                                        |
| hping            | A command-line oriented TCP/IP packet assembler/analyzer                                        |
| impacket         | Collection of classes for working with network protocols                                        |
| jadx          | Java decompiler                                                                                  |
| john             | John the Ripper password cracker                                                                |
| lbd              | Load Balancing detector                                                                         |
| ldapenum         | Enumerate domain controllers using LDAP                                                         |
| ligolo-ng        | An advanced, yet simple, tunneling tool that uses a TUN interface                               |
| metasploit    | Platform for developing, testing, and executing exploits                                         |
| nbtscan          | Scan networks searching for NetBIOS information                                                 |
| ncrack           | High-speed network authentication cracking tool                                                 |
| netcat        | Network piping application                                                                       |
| netexec          | A swiss army knife for pentesting Windows/Active Directory environments                         |
| ngrok         | Secure introspectable tunnels to localhost webhook development tool and debugging tool           |
| nikto            | A web server scanner which performs comprehensive tests against web servers                     |
| nmap          | Utility for network discovery and security auditing                                              |
| onesixtyone      | An SNMP scanner that sends multiple SNMP requests to multiple IP addresses                      |
| pwndbg        | Makes debugging with GDB suck less                                                               |
| pwntools      | Useful CTF utilities.                                                                            |
| revshellgen      | Simple script to generate commands to achieve reverse shells                                    |
| rizin         | Open-source tools to disasm, debug, analyze and manipulate binary files (With Ghidra Decompiler) |
| ropper        | Gadget finder.                                                                                   |
| rsactftool    | RSA attack tool (mainly for CTFs)                                                                |
| rustscan         | A modern port scanner                                                                           |
| scalpel          | A frugal, high performance file carver                                                          |
| sleuthkit        | File system and media management forensic analysis tools                                        |
| smbmap           | A handy SMB enumeration tool                                                                    |
| snmpcheck        | A free open source utility to get information via SNMP protocols                                |
| sqlmap        | Automatic SQL injection and database takeover tool                                               |
| swaks            | Swiss Army Knife SMTP; Command line SMTP testing, including TLS and AUTH                        |
| wafw00f          | Identify and fingerprint Web Application Firewall (WAF) products protecting a website           |
| wce              | A security tool to list logon sessions and add, change, list and delete associated credentials  |
| whatweb          | Next generation web scanner that identifies what websites are running                           |
| whois            | Intelligent WHOIS client                                                                        |
| windows-binaries | A collection of pentesting Windows binaries                                                     |
| xortool       | XOR analysis tool.                                                                               |
| yafu          | Yafu factor input integers in a completely automated way.                                        |
| z3            | Theorem prover from Microsoft Research.                                                          |

<details>
    <summary>Tools available in lite image</summary>

| Tools         | Description                                                                                      |
| ------------- | ------------------------------------------------------------------------------------------------ |
| aflplusplus   | American Fuzzing Lop fuzzer with community patches and additional features                       |
| binwalk       | Tool for searching a given binary image for embedded files                                       |
| exiftool      | Meta information reader/writer                                                                   |
| exploitdb     | The official Exploit Database repository                                                         |
| foremost      | A console program to recover files based on their headers, footers, and internal data structures |
| gdb-multiarch | The GNU Debugger for all gdb supported architectures (i386/arm/mips...)                          |
| gobuster      | URI and DNS subdomain bruteforcer                                                                |
| hexedit       | Terminal-based hex editor                                                                        |
| jadx          | Java decompiler                                                                                  |
| metasploit    | Platform for developing, testing, and executing exploits                                         |
| netcat        | Network piping application                                                                       |
| ngrok         | Secure introspectable tunnels to localhost webhook development tool and debugging tool           |
| nmap          | Utility for network discovery and security auditing                                              |
| pwndbg        | Makes debugging with GDB suck less                                                               |
| pwntools      | Useful CTF utilities.                                                                            |
| rizin         | Open-source tools to disasm, debug, analyze and manipulate binary files (With Ghidra Decompiler) |
| ropper        | Gadget finder.                                                                                   |
| rsactftool    | RSA attack tool (mainly for CTFs)                                                                |
| sqlmap        | Automatic SQL injection and database takeover tool                                               |
| xortool       | XOR analysis tool.                                                                               |
| yafu          | Yafu factor input integers in a completely automated way.                                        |
| z3            | Theorem prover from Microsoft Research.                                                          |

</details>

### Included QoL Tools

| Software     | Description                                                                        |
| ------------ | ---------------------------------------------------------------------------------- |
| autojump     | A cd command that learns                                                           |
| bat          | Cat clone with syntax highlighting and git integration                             |
| exa          | ls replacement                                                                     |
| fzf          | A fuzzy finder                                                                     |
| neovim       | A fully-fledged personal development environment                                   |
| openvpn      | An easy-to-use, robust and highly configurable VPN                                 |
| powerlevel0k | Beautiful zsh shell using powerlevel10k theme                                      |
| qemu-user    | Allows emulation of i386 and x86_64 binaries (Only for arm64 builds)               |
| ripgrep      | Grep but fasstttt                                                                  |
| tmux         | Allows multiple terminal sessions to be accessed simultaneously in a single window |
| zsh          | A modern shell with a bunch a plugins powered by zgenom                            |

<div align="center">
    <h3>And many more!</h1>
</div>
<br/>

<div align="center">
    <h1>License</h1>
    <p>This project is released under the <a href="https://github.com/pwnpad/pwnpad/blob/master/LICENSE">MIT License</a></p>
</div>
