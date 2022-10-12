<div align="center">
    <img src="images/logo-rectangle.png" style="width: 75%; height: auto;"/>
    <br/>
    <br/>
    <a href="https://github.com/PlatyPew/PwnBox2/actions"><img src="https://github.com/PlatyPew/PwnBox2/actions/workflows/docker-image.yml/badge.svg"></a>
    <br/>
    <a href="https://github.com/PlatyPew/PwnBox2/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-green.svg"></a>
    <a href="https://hub.docker.com/_/docker"><img src="https://img.shields.io/badge/docker-20.10.17-blue.svg"></a>
    <br/>
    <h1>PwnBox2</h1>
    <p>Perfect for doing Capture-The-Flag challenges and Pentesting on any platform, without needing a clunky, fat, resource hungry virtual machine. PwnBox2 provides a wide array of tools at your very own fingertips, powered by Arch Linux!</p>
    <br/>
</div>

## Contents

1. [Download](#download)
2. [Usage](#usage)
3. [Features](#features)
4. [Tools](#tools)
5. [License](#license)

<div align="center">
    <h1>Download</h1>
    <p>Download and Install PwnBox2</p>
</div>

#### Requirements

-   Docker installed (Docker Desktop for Windows & Mac)
-   Nerd Fonts installed

PwnBox2 can be downloaded using the git command

```
git clone https://github.com/PlatyPew/PwnBox2.git
```

```bash
# Build image locally
./p2 build

# Or pull from Docker Hub
docker pull platypew/pwnbox2:latest # Base image
docker pull platypew/pwnbox2:extra  # Extra tools
```

You can get basic autocompletion by sourcing the `_p2-autocomplete.zsh` file in your zshrc or source it

```bash
source _p2-autocomplete.zsh
```

<br/>
<div align="center">
    <h1>Usage</h1>
    <p>How to operate PwnBox2</p>
</div>

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
  ls        List pwnboxes
  update    Update image to the latest build

HELP:
  p2 build -h
  p2 attach -h
  p2 rm -h
```

<br/>
<div align="center">
    <h1>Features</h1>
    <p>Why PwnBox2 over other Docker-based environments?</p>
</div>
<br/>

1. It's powered by Arch (which means you have the power of the AUR)
2. It runs on MacOS and Linux (Windows using WSL2)
3. It runs Systemd as its init process (controversial, but here you go anyways)
4. It's compiled for both x86_64 and aarch64
5. It's super lightweight taking a little over 3GB of space
6. You can spawn as many instances as you want and remove them just as quick (does not pollute your system)
7. Supports X11 forwarding, which means you don't need the whole desktop environment just to run GUI programs when you can just forward it your host
8. Customised Neovim and Zsh so you look _super_ cool using it

**Full list of features coming soon!**

### Included Infosec Tools

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
| ngrok         | Secure introspectable tunnels to localhost webhook development tool and debugging tool           |
| nmap          | Utility for network discovery and security auditing                                              |
| pwncat        | A post-exploitation platform for Linux targets                                                   |
| pwndbg        | Makes debugging with GDB suck less                                                               |
| pwntools      | Useful CTF utilities.                                                                            |
| rizin         | Open-source tools to disasm, debug, analyze and manipulate binary files (With Ghidra Decompiler) |
| ropper        | Gadget finder.                                                                                   |
| rsactftool    | RSA attack tool (mainly for CTFs)                                                                |
| sqlmap        | Automatic SQL injection and database takeover tool                                               |
| xortool       | XOR analysis tool.                                                                               |
| yafu          | Yafu factor input integers in a completely automated way.                                        |
| z3            | Theorem prover from Microsoft Research.                                                          |

### Extra Tools

<details>
    <summary>Can only be found in platypew/pwnbox2:extra</summary>

| Tools              | Description                                                                                    |
| ------------------ | ---------------------------------------------------------------------------------------------- |
| arp-scan           | A tool that uses ARP to discover and fingerprint IP hosts on the local network                 |
| autorecon          | A multi-threaded network reconnaissance tool which performs automated enumeration of services  |
| commix             | Automated All-in-One OS Command Injection and Exploitation Tool                                |
| creddump           | A python tool to extract various credentials and secrets from Windows registry hives           |
| crunch             | A wordlist generator for all combinations/permutations of a given character set                |
| dbd                | A Netcat-clone, designed to be portable and offer strong encryption                            |
| dns2tcp            | A tool for relaying TCP connections over DNS                                                   |
| dnsenum            | Script that enumerates DNS information from a domain                                           |
| empire             | A PowerShell and Python post-exploitation agent                                                |
| enum4linux         | A tool for enumerating information from Windows and Samba systems                              |
| expect             | A tool for automating interactive applications                                                 |
| hashcat            | Multithreaded advanced password recovery utility                                               |
| hping              | A command-line oriented TCP/IP packet assembler/analyzer                                       |
| ike-scan           | A tool that uses IKE protocol to discover, fingerprint and test IPSec VPN servers              |
| inetsim            | A software suite for simulating common internet services in a lab environment                  |
| iodine             | Tunnel IPv4 data through a DNS server                                                          |
| john               | John the Ripper password cracker                                                               |
| laudanum           | A collection of injectable files                                                               |
| masscan            | TCP port scanner, spews SYN packets asynchronously                                             |
| mimikatz           | A little tool to play with Windows security                                                    |
| mitmproxy          | SSL-capable man-in-the-middle HTTP proxy                                                       |
| nbtscan            | Scan networks searching for NetBIOS information                                                |
| ncrack             | High-speed network authentication cracking tool                                                |
| nikto              | A web server scanner which performs comprehensive tests against web servers                    |
| onesixtyone        | An SNMP scanner that sends multiple SNMP requests to multiple IP addresses                     |
| patator            | A multi-purpose bruteforcer                                                                    |
| recon-ng           | A full-featured Web Reconnaissance framework written in Python                                 |
| samdump2           | Dump password hashes from a Windows NT/2k/XP installation                                      |
| scalpel            | A frugal, high performance file carver                                                         |
| set                | Social-engineer toolkit                                                                        |
| sleuthkit          | File system and media management forensic analysis tools                                       |
| snmpcheck          | A free open source utility to get information via SNMP protocols                               |
| spiderfoot         | The Open Source Footprinting Tool                                                              |
| spike              | Spike, a RISC-V ISA Simulator                                                                  |
| swaks              | Swiss Army Knife SMTP; Command line SMTP testing, including TLS and AUTH                       |
| udptunnel          | Tunnels TCP over UDP packets                                                                   |
| unix-privesc-check | Allow local unprivilged users to escalate privileges to other users                            |
| wafw00f            | Identify and fingerprint Web Application Firewall (WAF) products protecting a website          |
| wce                | A security tool to list logon sessions and add, change, list and delete associated credentials |
| webshells          | Web backdoors                                                                                  |
| whatweb            | Next generation web scanner that identifies what websites are running                          |
| whois              | Intelligent WHOIS client                                                                       |
| windows-binaries   | A colleciton of pentesting Windows binaries                                                    |

</details>

### Included QoL Tools

| Software      | Description                                                                        |
| ------------- | ---------------------------------------------------------------------------------- |
| autojump      | A cd command that learns                                                           |
| bat           | Cat clone with syntax highlighting and git integration                             |
| exa           | ls replacement                                                                     |
| fzf           | A fuzzy finder                                                                     |
| neovim        | A fully-fleged personal development environment                                    |
| openvpn       | An easy-to-use, robust and highly configurable VPN                                 |
| powerlevel10k | Beautiful zsh shell using powerlevel10k theme                                      |
| qemu-user     | Allows emulation of i386 and x86_64 binaries (Only for aarch64 builds)             |
| ripgrep       | Grep but fasstttt                                                                  |
| tmux          | Allows multiple terminal sessions to be accessed simultaneously in a single window |

<div align="center">
    <h3>And many more!</h1>
</div>
<br/>

<div align="center">
    <h1>License</h1>
    <p>This project is released under the <a href="https://github.com/PlatyPew/PwnBox2/blob/master/LICENSE">MIT License</a></p>
</div>
