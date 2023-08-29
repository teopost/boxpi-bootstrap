cp ./hd.mount /etc/systemd/system/
cp ./reset-usb.service /etc/systemd/system/

mkdir /hd

systemctl daemon-reload
systemctl enable hd.mount

