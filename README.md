# teobox-bootstrap

# firt update
# -----------
apt update
apt full-upgrade


# install uhubctl
# ---------------
apt install -y git libusb-1.0-0-dev
git clone https://github.com/mvp/uhubctl /tmp/uhubctl
cd /tmp/uhubctl
make
make install
/usr/sbin/uhubctl -a 2 -l 2
lsblk


# install deskpi scripts
# ----------------------
git clone https://github.com/DeskPi-Team/deskpi.git /tmp/deskpi
cd /tmp/deskpi/
chmod +x install.sh
./install.sh

# install docker
# https://docs.docker.com/engine/install/raspberry-pi-os/
# --------------
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/raspbian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/raspbian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


# relocate docker dir
https://www.ibm.com/docs/en/z-logdata-analytics/5.1.0?topic=compose-relocating-docker-root-directory


