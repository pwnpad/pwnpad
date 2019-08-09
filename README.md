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

PwnBox no longer uses a Ubuntu backend. It's using Arch now

Package manager `pacman` and `yay` are installed

## Other stuffu
Good luck for your CTFs, and hack harder.
