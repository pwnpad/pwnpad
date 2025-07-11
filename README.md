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

- `limactl`
- `ansible-playbook`
- `qemu-img`
- `virt-sparsify`

```bash
./build_vm.sh
```

## Installation

Download the latest release from the [releases page](https://github.com/pwnpad/pwnpad-lima/releases).

Concatenate all the files together to make a qcow2 file.

```bash
cat pwnpad.qcow2.part_* > pwnpad.qcow2
```

Edit image location in `lima/pwnpad.yml` to point to the qcow2 file on your system.
For example, if you store the qcow2 file in `/tmp/pwnpad.qcow2`

```yaml
# This is the default
images:
  - location: "file:///tmp/pwnpad.qcow2"
    arch: aarch64
```
