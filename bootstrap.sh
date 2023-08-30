sudo apt update
sudo apt full-upgrade -y
sudo apt install -y git


# install uhubctl
# ---------------
cd ~
sudo apt install -y libusb-1.0-0-dev
git clone https://github.com/mvp/uhubctl 
cd uhubctl 
make
sudo make install
/usr/sbin/uhubctl -a 2 -l 2
lsblk 



# install docker
# https://docs.docker.com/engine/install/raspberry-pi-os/
# --------------
cd ~
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
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin



# install boxpi-bootstrap scripts
# --------------------------------
cd ~
git clone https://github.com/teopost/boxpi-bootstrap.git
cd boxpi-bootstrap/systemd/
mkdir /data
sudo cp ~/boxpi-bootstrap/systemd/data.mount            /etc/systemd/system/
sudo cp ~/boxpi-bootstrap/systemd/reset-usb.service   /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable data.mount
sudo systemctl enable reset-usb.service
sudo systemctl start data.mount
sudo systemctl start reset-usb.service


/usr/sbin/uhubctl -a 2 -l 2


# install deskpi scripts
# ----------------------
cd ~
git clone https://github.com/DeskPi-Team/deskpi.git
cd ./deskpi/
chmod +x install.sh
sudo ./install.sh
cd ..

# the system reboot now



# --------------------------------------------------



exit




# configure github key
ssh-keygen
cat /root/.ssh/id_rsa.pub
# add key to github
git clone -y git@github.com:teopost/boxpi-bootstrap.git /home/teopost/boxpi-bootstrap
cd /home/teopost/boxpi-bootstrap/systemd/
mkdir /data




dtoverlay=disable-wifi
dtoverlay=disable-bt


# relocate docker dir
https://www.ibm.com/docs/en/z-logdata-analytics/5.1.0?topic=compose-relocating-docker-root-directory

174c:55aa
