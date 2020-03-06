<div align="center">
    <img width="640" height="259" src="images/logo-rectangle.png"/>
    <br/>
    <br/>
    ![Pipeline](https://gitlab.com/PlatyPew/Pwnbox2/badges/master/pipeline.svg)
    <br/>
    ![License](https://img.shields.io/badge/license-MIT-green.svg)
    ![Docker](https://img.shields.io/badge/docker-19.03.1-blue.svg)
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
./build.sh # Requires experimental mode to be enabled.
```

```bash
# Pull pre-built image from docker hub
docker pull platypew/pwnbox2
```

<br/>
<div align="center">
    <h1>Usage</h1>
    <p>How to operate pwnbox2</p>
</div>

### General
`run.sh` will start the container, and attach to it. If container is already running, it will automatically attach to it.
A directory will be created, which is mounted from the docker container to your local system. You can find this directory in the container at `~/shared`

`clean.sh` will stop and remove the container. If the mounted directory is empty, it will clear that as well.

Alternatively, one can place this function into their bashrc/zshrc
```bash
p2() {
    if [ -z ${1} ];then
        echo "Usage: ${0} <attach|rm|list|mount> (container name)"
        return 1
    fi

    if [ -z "$(docker stats --no-stream 2> /dev/null)" ]; then
        echo "Docker daemon is not running!"
        return 1
    fi

    if [ ${1} != "list" ] && ([ -z ${1} ] || [ -z ${2} ]); then
        echo "Usage: ${0} <attach|rm|list|mount> (container name)"
        return 1
    fi

    cd ~/PwnBox2 > /dev/null
    case ${1} in
        attach)
            ./run.sh ${2}
            cd - > /dev/null
            ;;
        clean)
            ./clean.sh ${2}
            cd - > /dev/null
            ;;
        list)
            docker container ls -a --filter "ancestor=platypew/pwnbox2" --format "table {{.Names}}\t{{.Status}}\t{{.Size}}\t{{.RunningFor}}"
            cd - > /dev/null
            ;;
        enter)
            cd ~/PwnBox2/${2}
            ;;
        *)
            echo "Usage: ${0} <attach|rm|list|mount> (container name)"
            return 1
            ;;
    esac
}
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
| hashcat       | Advanced password recovery.                                                                                 |
| hashpump      | A tool for performing hash length extension attacks.                                                        |
| hexedit       | Terminal-based hex editor                                                                                   |
| jad           | Java decompiler                                                                                             |
| john          | Password cracker                                                                                            |
| libc-database | Build a database of libc offsets to simplify exploitation.                                                  |
| metasploit    | Platform for developing, testing, and executing exploits.                                                   |
| msieve        | Msieve is a C library implementing a suite of algorithms to factor large integers.                          |
| ngrok         | Secure introspectable tunnels to localhost webhook development tool and debugging tool                      |
| nmap          | Nmap free security scanner, port scanner, & network exploration tool.                                       |
| one_gadget    | Magic gadget search for libc.                                                                               |
| patator       | Multi-purpose brute-forcer                                                                                  |
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
