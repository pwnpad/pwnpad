# PlatyPew's PwnBox2
Because who needs a virtual machine?

## Installation
You can either build it yourself using `./build.sh`, or pull it from docker hub.

Build yourself
```bash
./build.sh
./run.sh <name of container>
```

Pull from docker hub (It's faster, but packages may be outdated)
```bash
docker pull platypew/pwnbox2
./run.sh <container name>
```

Removing unused containers
```bash
./clean <container name>
```

## Usage
How to use this

### General
By executing `run.sh`, you will effectively start the container and attach to it.
Upon exiting the container, the container will be stopped. To re-attach to it, do `docker start <container name>` and `docker attach <container name>`

### Installing tools
It comes pre-installed with every single tool you possibly need

PwnBox2 uses Arch Linux

Package manager `yay` are installed.

## Included CTF Tools
- afl - State-of-the-art fuzzer.
- binwalk - Firmware (and arbitrary file) analysis tool.
- checksec - Check binary hardening settings.
- dirsearch - Web path scanner.
- exiftool - Meta information reader/writer.
- exploitdb - The official Exploit Database repository.
- factordb - Factorise primes using online database.
- featherduster - An automated, modular cryptanalysis tool.
- foremost - File carver.
- gdb - GNU Project debugger.
- hashcat - Advanced password recovery.
- hashpump - A tool for performing hash length extension attacks.
- hexedit - Terminal-based hex editor
- jad - Java decompiler
- john - Password cracker
- libc-database - Build a database of libc offsets to simplify exploitation.
- metasploit - Platform for developing, testing, and executing exploits.
- msieve - Msieve is a C library implementing a suite of algorithms to factor large integers.
- ngrok - Secure introspectable tunnels to localhost webhook development tool and debugging tool
- nmap - Nmap free security scanner, port scanner, & network exploration tool.
- one_gadget - Magic gadget search for libc.
- patator - Multi-purpose brute-forcer
- pwntools - Useful CTF utilities.
- pycrypto - Python cryptography toolkit.
- radare2 - The best disassembler (Not an opinion)
- ropper - Gadget finder.
- rsactftool - RSA attack tool (mainly for CTFs)
- shellnoob - A shellcode writing toolkit.
- sqlmap - Automatic SQL injection and database takeover tool
- termshark - Terminal-based Wireshark
- wcc - A collection of compilation tools to perform binary black magic on the GNU/Linux and other POSIX platforms.
- wuzz - Interactive cli tool for HTTP inspection
- xortool - XOR analysis tool.
- z3 - Theorem prover from Microsoft Research.
- zsteg - Detect stegano-hidden data in PNG & BMP.

## General Software
- autojump - A cd command that learns
- fzf - A fuzzy finder
- gmpy2 - A C-coded Python extension module that supports multiple-precision arithmetic
- mlocate - A Unix utility which serves to find files on filesystems
- neovim - Best code editor ever (Not an opinion)
- netcat - TCP/IP swiss army knife
- nodejs - A JavaScript runtime built on Chrome's V8 JavaScript engine
- oh-my-zsh - Beautiful zsh shell with agnoster theme
- python - An interpreted, high-level, general-purpose programming language
- ripgrep - Grep but fasstttt
- ruby - Another interpreted, high-level, general-purpose programming language.
- sagemath - A computer algebra system with includes algebra, combinatorics, graph theory, numerical analysis, number theory, calculus and statistics
- tmux - Allows multiple terminal sessions to be accessed simultaneously in a single window
- zsh-autopair - Automatically pairs quotations marks and brackets when typing commands
- zsh-autosuggestions - Suggests commands that you've used before
- zsh-syntax-highlighting - Beautiful highlighting while typing commands
- zsh-vimode-visual - Allow vim visual mode to work within the prompt

## Other stuffu
Good luck for your CTFs, and hack harder.
