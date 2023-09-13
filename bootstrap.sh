# deve essere 64 bit
getconf LONG_BIT

sudo apt update -y
sudo apt full-upgrade -y
sudo apt install -y git

# install docker
# https://docs.docker.com/engine/install/raspberry-pi-os/
# --------------
cd ~
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# install naspi scripts
# ---------------------
# https://wiki.geekworm.com/XScript
cd ~
sudo su -c 'echo "dtoverlay=pwm-2chan" >> "/boot/config.txt"'
git clone https://github.com/geekworm-com/xscript
cd xscript
chmod +x *.sh

# install the x-c1-fan service
sudo cp -f ./x-c1-fan.sh                /usr/local/bin/
sudo cp -f ./x-c1-fan.service           /lib/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable x-c1-fan
sudo systemctl start x-c1-fan

# install the x-c1-pwr service
sudo cp -f ./x-c1-pwr.sh                /usr/local/bin/
sudo cp -f x-c1-pwr.service             /lib/systemd/system
sudo systemctl daemon-reload
sudo systemctl enable x-c1-pwr
sudo systemctl start x-c1-pwr

# Prepair software shutdown script
sudo cp -f ./x-c1-softsd.sh             /usr/local/bin/

# create alis for software shutdown (warning.. sudo don't work)
echo "alias xoff='sudo /usr/local/bin/x-c1-softsd.sh'" > /etc/profile.d/custom-aliases.sh
echo "alias ll='ls -lisatr'" >> /etc/profile.d/custom-aliases.sh
sudo chmod 777 /etc/profile.d/custom-aliases.sh


