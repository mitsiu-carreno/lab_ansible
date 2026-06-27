# Usage
```bash
ansible-playbook site.yml
```

# SSH key setup
```bash
# Gen key
ssh-keygen -t ed25519 -f ansible_key

# Send public key
ssh-copy-id -i ./ansible_key -p 2222 lab@localhost

# Delete known host
ssh-keygen -R "[127.0.0.1]:2222"
ssh-keygen -R localhost
ssh-keygen -R "[localhost]:2222"
```

# Dev setup
```bash
curl -LO https://cdimage.ubuntu.com/releases/22.04/release/ubuntu-22.04.5-live-server-arm64.iso

qemu-img create -f qcow2 disk.img 12G

qemu-system-aarch64 \
-machine virt,accel=hvf \
-cpu host \
-m 4096 \
-smp 4 \
-bios /nix/store/47nqyp9q0i8cggv8l3h6jrwpw7ww3bw8-qemu-10.2.2/share/qemu/edk2-aarch64-code.fd \
-drive if=virtio,file=disk.img,format=qcow2 \
-cdrom ubuntu-24.04.4-live-server-arm64.iso \
-serial mon:stdio \
-nographic \
-netdev user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80 \
-device virtio-net-pci,netdev=net0

#Snapshot disk
qemu-img snapshot -c clean ubuntu2404-ansible.qcow2
Restore later:
qemu-img snapshot -a clean ubuntu2404-ansible.qcow2
```
