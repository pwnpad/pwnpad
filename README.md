<div align="center">
    <img width="640" height="259" src="images/logo-rectangle.png"/>
    <br/>
    <br/>
    <a href="https://github.com/PlatyPew/PwnBox2/actions"><img src="https://github.com/PlatyPew/PwnBox2/actions/workflows/docker-image.yml/badge.svg"></a>
    <br/>
    <a href="https://gitlab.com/PlatyPew/PwnBox2/-/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-green.svg"></a>
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

PwnBox2 can be downloaded using the git command
```
git clone https://gitlab.com/PlatyPew/PwnBox2.git
```

```bash
# Build image locally
./p2 build

# Or pull from Docker Hub
docker pull platypew/PwnBox2:latest
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
    <p>Why PwnBox2 over other docker-based environments?</p>
</div>
<br/>

1. It's powered by Arch (which means you have the power of the AUR)
2. It runs on MacOS and Linux (as long as they run systemd in the backend)
3. It runs systemd as its init process
4. It's compiled for both x86 and aarch64
5. It's super lightweight taking a little over 3GB of space
6. You can spawn as many instances as you want and remove them just as quick (does not pollute your system)
7. Supports X11 forwarding, which means you don't need the whole desktop environment just to run GUI programs when you can just forward it your host

### Included Infosec Tools
| Tools         | Description                                                                                                 |
|---------------|-------------------------------------------------------------------------------------------------------------|
| afl           | State-of-the-art fuzzer.                                                                                    |
| autorecon     | Wrapper around multiple scanning tools for quick enumeration                                                |
| binwalk       | Firmware (and arbitrary file) analysis tool.                                                                |
| exiftool      | Meta information reader/writer.                                                                             |
| exploitdb     | The official Exploit Database repository.                                                                   |
| foremost      | File carver.                                                                                                |
| gdb           | GNU Project debugger.                                                                                       |
| gobuster      | URI and DNS subdomain bruteforcer                                                                           |
| hexedit       | Terminal-based hex editor                                                                                   |
| jadx          | Java decompiler                                                                                             |
| libc-database | Build a database of libc offsets to simplify exploitation.                                                  |
| metasploit    | Platform for developing, testing, and executing exploits.                                                   |
| ngrok         | Secure introspectable tunnels to localhost webhook development tool and debugging tool                      |
| nmap          | Nmap free security scanner, port scanner, & network exploration tool.                                       |
| pwncat        | A post-exploitation platform for Linux targets                                                              |
| pwndbg        | Makes debugging with GDB suck less                                                                          |
| pwntools      | Useful CTF utilities.                                                                                       |
| radare2       | The best disassembler                                                                                       |
| ropper        | Gadget finder.                                                                                              |
| rsactftool    | RSA attack tool (mainly for CTFs)                                                                           |
| sqlmap        | Automatic SQL injection and database takeover tool                                                          |
| xortool       | XOR analysis tool.                                                                                          |
| yafu          | Yafu factor input integers in a completely automated way.                                                   |
| z3            | Theorem prover from Microsoft Research.                                                                     |
| zsteg         | Detect stegano-hidden data in PNG & BMP.                                                                    |

### Included QoL Tools
| Software                                                               | Description                                                                                                                              |
|------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| autojump                                                               | A cd command that learns                                                                                                                 |
| fzf                                                                    | A fuzzy finder                                                                                                                           |
| mlocate                                                                | A Unix utility which serves to find files on filesystems                                                                                 |
| neovim                                                                 | A fully-fleged personal development environment
| powerlevel10k                                                          | Beautiful zsh shell using powerlevel10k theme
| openvpn                                                                | A virtual private network manager                                                                                                        |
| ripgrep                                                                | Grep but fasstttt                                                                                                                        |
| sagemath                                                               | A computer algebra system with includes algebra, combinatorics, graph theory, numerical analysis, number theory, calculus and statistics |
| tmux                                                                   | Allows multiple terminal sessions to be accessed simultaneously in a single window                                                       |

<div align="center">
    <h3>And many more!</h1>
</div>
<br/>

<div align="center">
    <h1>License</h1>
    <p>This project is released under the <a href="https://gitlab.com/PlatyPew/PwnBox2/-/blob/master/LICENSE">MIT License</a></p>
</div>
