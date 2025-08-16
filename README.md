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

- `ansible` (not required if not building)
- `lima`
- `qemu` (not required if not building)

```bash
brew install ansible lima qemu
```

### Linux (Arch-based)

- `ansible` (not required if not building)
- `lima-bin`
- `qemu-full`

```bash
yay -S ansible lima-bin qemu-full
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

## Usage

Download the latest release from the [releases page](https://github.com/pwnpad/pwnpad-lima/releases).
Due to GitHub's file size limit, the qcow2 image is split into multiple parts.
Ensure all parts are downloaded.

Concatenate all the files together to make a qcow2 file.

```bash
# aarch64
cat pwnpad-aarch64.qcow2.part_* > pwnpad-aarch64.qcow2

# x86_64
cat pwnpad-x86_64.qcow2.part_* > pwnpad-x86_64.qcow2
```

### Creating the VM

Edit image location in `lima/pwnpad.yml` to point to the qcow2 file on your system.
For example, if you store the qcow2 file in `/tmp/pwnpad-aarch64.qcow2`:

```yaml
# This is the default
images:
  - location: "file:///tmp/pwnpad-aarch64.qcow2"
    arch: aarch64
  - location: "file:///tmp/pwnpad-x86_64.qcow2"
    arch: x86_64
```

Create the new VM using the following command:

```bash
limactl create --yes lima/pwnpad.yml
```

### Issues

For some reason, the VM will not boot properly with Qemu on Linux if you mount a directory.
You can work around by commenting/deleting the following line in `lima/pwnpad.yml`:

```yaml
# Comment/delete these lines to fix the issue
mounts:
  - location: "~"
    mountPoint: null
    writable: null
  - location: "~/.local/share/pwnpad/lima"
    mountPoint: "/mnt/shared"
    writable: true
    sshfs:
      followSymlinks: true
```
