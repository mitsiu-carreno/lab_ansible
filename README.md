# Usage
```bash
ansible-playbook site.yml -K
```

```bash
sudo apt update
sudo apt install ansible git
git clone https://github.com/mitsiu-carreno/lab_ansible.git
Fill inventory/group_vars/tljh_server.yml
sudo su 
ansible-playbook -i inventory/hosts.ini -c local site.yml
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
-bios /nix/store/lzm84ri4kbyx8gqxwk5sd21mqc5all73-qemu-11.1.1/share/qemu/edk2-aarch64-code.fd \
-drive if=virtio,file=disk.img,format=qcow2 \
-cdrom ubuntu-26.04.1-live-server-arm64.iso \
-serial mon:stdio \
-nographic \
-netdev user,id=net0,hostfwd=tcp::2222-:22,hostfwd=tcp::8080-:80 \
-device virtio-net-pci,netdev=net0

#Snapshot disk
qemu-img snapshot -c clean ubuntu2404-ansible.qcow2
Restore later:
qemu-img snapshot -a clean ubuntu2404-ansible.qcow2
```

# OS
```
sudo ufw allow 3001/tcp
systemctl poweroff
cat /sys/class/power_supply/BATT/capacity

# Free port
kill -9 $(lsof -i:PORT)

# Access usb
lsblk
    sda - Disk
    └ sda1 - Part

sudo mount /dev/sda1 /media/usb
sudo umount /media/usb

# Gen users
./str_gen.sh a 30

# 1--- Turn in
sudo su
sudo chown -R root:root /home/jupyter-
# 1 Undo
sudo chown -R jupyter-lab:jupyter-lab /home/jupyter-lab

# 2--- Deploy
sudo ./deployer.sh <group> <544|644> /home/lab/instrumentos/a-inst.pdf
                           Exex|Read

# 3--- Logs traefik
sudo journalctl -u traefik.service -f >> a-traefik.log

# 4--- Locked out
sudo cat /opt/tljh/state/examauth_locked_users.json

# 5--- Monitor
htop

# 6--- Key-words
egrep -ri "persona|gato|carro" /home/jupyter-* \
        --exclude-dir=dist \
        --exclude-dir=.jupyter 2>/dev/null \
        | sort

# Deploy manually
sudo rsync -av /etc/skell/ /home/jupyter-lab
``` 
