# NAS on RaspberryPi

## Documentation

* [Debian documentation on RaspberryPI](https://wiki.debian.org/RaspberryPi)
* [Debian images (daily build)](https://wiki.debian.org/RaspberryPiImages)

## Usage

### First install

#### TL;DR

```bash
# Plug SD card to main computer then
sudo ./install.sh /dev/sdx
# Plug SD card to rasp and run locally (screen + keyboard on rasp)
apt update && apt upgrade -y && apt install -y python3 sudo
adduser tristan && usermod -aG sudo,ssh tristan
# From the main computer
ssh-copy-id 192.168.1.XXX
```

### Running the playbook

```bash
eval `ssh-agent`
ssh-add
source venv/bin/activate
ansible-playbook -i inventory.yml main.yml
```

Don't forget to change admin's password using `ovm-firstaid` or a simple
`passwd admin`.
