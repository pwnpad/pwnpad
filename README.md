<div align="center">
    <img width="640" height="259" src="images/logo-rectangle.png"/>
    <br/>
    <br/>
    <a href="https://gitlab.com/PlatyPew/PwnBox2/pipelines/latest"><img src="https://gitlab.com/PlatyPew/Pwnbox2/badges/master/pipeline.svg"></a>
    <br/>
    <a href="https://gitlab.com/PlatyPew/PwnBox2/-/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-green.svg"></a>
    <a href="https://hub.docker.com/_/docker"><img src="https://img.shields.io/badge/docker-19.03.8-blue.svg"></a>
    <br/>
    <h1>PwnBox2</h1>
    <p>Perfect for doing Capture-The-Flag challenges on MacOS, without needing a clunky, fat, resource hungry virtual machine. PwnBox2 provides a wide array of tools at your very own fingertips, powered by Arch Linux!</p>
    <br/>
</div>

## Contents
1. [Download](#download)
2. [Usage](#usage)
3. [Tools](#tools)
4. [License](#license)

<div align="center">
    <h1>Download</h1>
</div>

**You can either build it yourself using `./build.sh`, or pull it from docker hub.**

```bash
# Build image locally
./p2 build
```

```bash
# Pull pre-built image from docker hub
docker pull platypew/pwnbox2:latest
```

<br/>
<div align="center">
    <h1>Usage</h1>
    <p>How to operate pwnbox2</p>
</div>

### General
You can use `p2` to manage pwnboxes. `echo "alias p2=~/PwnBox2/p2" > ~/.zshrc`

```
$ p2
USAGE:
  p2 <SUBCOMMAND>

SUBCOMMAND:
  build     Build Docker image
  attach    Attach into container
  rm        Remove container and its volumes
  volume    Enter into container's volume
  list      List pwnboxes
  update    Update image to the latest build

HELP:
  p2 build -h
  p2 attach -h
  p2 rm -h
```

<br/>
<div align="center">
    <h1>Tools</h1>
    <p>List of all the tools installed in PwnBox2</p>
</div>

## Included CTF Tools
| Tools         | Description                                                                                                 |
|---------------|-------------------------------------------------------------------------------------------------------------|
| afl           | State-of-the-art fuzzer.                                                                                    |
| binwalk       | Firmware (and arbitrary file) analysis tool.                                                                |
| checksec      | Check binary hardening settings.                                                                            |
| dirsearch     | Web path scanner.                                                                                           |
| exiftool      | Meta information reader/writer.                                                                             |
| exploitdb     | The official Exploit Database repository.                                                                   |
| factordb      | Factorise primes using online database.                                                                     |
| featherduster | An automated, modular cryptanalysis tool.                                                                   |
| foremost      | File carver.                                                                                                |
| gdb           | GNU Project debugger.                                                                                       |
| gobuster      | URI and DNS subdomain bruteforcer                                                                           |
| hexedit       | Terminal-based hex editor                                                                                   |
| hydra         | Multi-purpose brute-forcer                                                                                  |
| jad           | Java decompiler                                                                                             |
| john          | Password cracker                                                                                            |
| libc-database | Build a database of libc offsets to simplify exploitation.                                                  |
| metasploit    | Platform for developing, testing, and executing exploits.                                                   |
| msieve        | Msieve is a C library implementing a suite of algorithms to factor large integers.                          |
| ngrok         | Secure introspectable tunnels to localhost webhook development tool and debugging tool                      |
| nmap          | Nmap free security scanner, port scanner, & network exploration tool.                                       |
| one_gadget    | Magic gadget search for libc.                                                                               |
| pwndbg        | Makes debugging with GDB suck less                                                                          |
| pwntools      | Useful CTF utilities.                                                                                       |
| pycrypto      | Python cryptography toolkit.                                                                                |
| radare2       | The best disassembler (Not an opinion)                                                                      |
| ropper        | Gadget finder.                                                                                              |
| rsactftool    | RSA attack tool (mainly for CTFs)                                                                           |
| shellnoob     | A shellcode writing toolkit.                                                                                |
| sqlmap        | Automatic SQL injection and database takeover tool                                                          |
| termshark     | Terminal-based Wireshark                                                                                    |
| wcc           | A collection of compilation tools to perform binary black magic on the GNU/Linux and other POSIX platforms. |
| wuzz          | Interactive cli tool for HTTP inspection                                                                    |
| xortool       | XOR analysis tool.                                                                                          |
| z3            | Theorem prover from Microsoft Research.                                                                     |
| zsteg         | Detect stegano-hidden data in PNG & BMP.                                                                    |

## General Software
| Software                                                               | Description                                                                                                                              |
|------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| autojump                                                               | A cd command that learns                                                                                                                 |
| fzf                                                                    | A fuzzy finder                                                                                                                           |
| gmpy2                                                                  | A C-coded Python extension module that supports multiple-precision arithmetic                                                            |
| mlocate                                                                | A Unix utility which serves to find files on filesystems                                                                                 |
| neovim                                                                 | Best code editor ever (Not an opinion)                                                                                                   |
| netcat                                                                 | TCP/IP swiss army knife                                                                                                                  |
| nodejs                                                                 | A JavaScript runtime built on Chrome's V8 JavaScript engine                                                                              |
| oh-my-zsh                                                              | Beautiful zsh shell with agnoster theme                                                                                                  |
| openvpn                                                                | A virtual private network manager                                                                                                        |
| python                                                                 | An interpreted, high-level, general-purpose programming language                                                                         |
| ripgrep                                                                | Grep but fasstttt                                                                                                                        |
| ruby                                                                   | Another interpreted, high-level, general-purpose programming language.                                                                   |
| sagemath                                                               | A computer algebra system with includes algebra, combinatorics, graph theory, numerical analysis, number theory, calculus and statistics |
| tmux                                                                   | Allows multiple terminal sessions to be accessed simultaneously in a single window                                                       |
| zsh-autopair                                                           | Automatically pairs quotations marks and brackets when typing commands                                                                   |
| zsh-autosuggestions                                                    | Suggests commands that you've used before                                                                                                |
| zsh-syntax-highlighting                                                | Beautiful highlighting while typing commands                                                                                             |
| zsh-vimode-visual                                                      | Allow vim visual mode to work within the prompt                                                                                          |

<div align="center">
    <h1>License</h1>
    <p>This project is released under the <a href="https://gitlab.com/PlatyPew/PwnBox2/-/blob/master/LICENSE">MIT License</a></p>
</div>
