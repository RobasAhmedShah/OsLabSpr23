#!/bin/bash


read -p "Enter the share directory path " share_path
share_path=${share_path}

read -p "Enter the share name (default: share): " share_name
share_name=${share_name}

sudo apt-get update
sudo apt-get install -y samba
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
sudo cat > /etc/samba/smb.conf << EOF

[$share_name]
path = $share_path
browsable = yes
writable = yes
guest ok = yes
read only = no
EOF

sudo mkdir $share_path
sudo chmod -R 777 $share_path

# Restart SAMBA
sudo systemctl restart smbd.service

