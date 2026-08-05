<div align="center">
    <img src="assets/logo.png" style="width: 25%; height: auto;"/>
    <br/>
    <br/>
    <a href="https://github.com/pwnpad/pwnpad/blob/master/LICENSE"><img src="https://img.shields.io/github/license/pwnpad/pwnpad"></a>
    <img src="https://img.shields.io/badge/Coded%20By%20Humans-100%25-brightgreen" />
    <h1>PwnPad Lima</h1>
    <p>A fully virtualised environment</p>
</div>

## Requirements

If you are building this yourself, you will need the following tools installed:

### MacOS

- `lima` (special version required)
- `ansible` (not required if not building)
- `qemu` (not required if not building)

To get the full experience, you will need a special version of [lima](https://github.com/pwnpad/lima/releases) that supports USB passthrough.
To install, download the latest Darwin ARM64 build and extract it to `/usr/local/`:

```bash
tar -xzvf lima-*-Darwin-arm64.tar.gz -C /usr/local/
```

You may skip this step if you are using the pre-built VM.

```bash
brew install ansible qemu
```

## Building

To build the VM yourself:

```bash
./build_vm.sh
```

If you would like to export the VM to a qcow2 file:

```bash
./create_qcow2.sh
```

The file will be created in `~/.lima/pwnpad-builder/pwnpad-arm64.qcow2`

## Usage

Create the new VM using the following command:

```bash
limactl create --yes https://raw.githubusercontent.com/pwnpad/pwnpad-lima/refs/heads/master/lima/pwnpad.yml
```
