<div align="center">
    <img src="assets/logo.png" style="width: 25%; height: auto;"/>
    <br/>
    <br/>
    <a href="https://github.com/pwnpad/pwnpad/blob/master/LICENSE"><img src="https://img.shields.io/github/license/pwnpad/pwnpad"></a>
    <img src="https://img.shields.io/badge/Coded%20By%20Humans-100%25-brightgreen" />
    <h1>PwnPad Lima</h1>
    <p>A fully virtualised environment</p>
</div>

## Build

Requirements:

- lima
- ansible-playbook

```bash
./build.sh
```

## Installation

Download the latest release from the [releases page](https://github.com/pwnpad/pwnpad-lima/releases).

```bash
tar -xJvf pwnpad.tar.xz -C ~/.lima/
```

Copy the public key from `~/.lima/_config/user.pub` and paste it into the `ssh-authorized-keys` field in `~/.lima/pwnpad/cloud-config.yaml`.

If no public and private key exists, go to `~/.lima/_config` and run `ssh-keygen -f user -t ed25519` to generate a new key pair.
