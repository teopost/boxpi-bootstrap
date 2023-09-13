lsblk -no UUID /dev/sda2
ls /dev/disk/by-uuid/ECFA8ADDFA8AA404
cd /lib/systemd/system
 


cp ./hd.mount /etc/systemd/system/
cp ./reset-usb.service /etc/systemd/system/

mkdir /hd

systemctl daemon-reload
systemctl enable hd.mount

