#!/bin/bash

#############################################
# File Name: init.sh
# Author: xingming
# mail: huoxm@zetyun.com
# Created Time:  2015-12-12 18时00分07秒
#############################################

# make sure you have run those two commands:
## sudo apt-get install git
## https://github.com/pmars/linux-config.git

# then you can run this script
## bash linux-config/init-ubuntu.sh username password

if [ $# -lt 2 ]; then
    echo 'script need two params'
    echo 'please input username and password'
    exit
fi

user=$1
pass=$2

echo "username:"$user
echo "password:"$pass

# add user to sudoers
# modify ubuntu start type
sudo -i
chmod 640 /etc/sudoers
echo "$user ALL=(ALL)   NOPASSWD:   ALL" >> /etc/sudoers
cat /etc/default/grub | awk 'BEGIN{con="";}{gsub("quiet splash", "quiet splash text"); con=con""$0"\n";}END{print con;}' > /etc/default/grub1
mv /etc/default/grub1 /etc/default/grub
update-grub
su $user
cd

# install packages
sudo apt-get update
sudo apt-get install -y openssh-server python-pip python-virtualenv vim git tmux sauce
sudo mv .profile ../
sudo rm -rf *
sudo rm -rf .*
sudo rm -rf .config
virtualenv pyvirt

# copy files
git clone https://github.com/pmars/linux-config.git
mv linux-config/.[a-z]* ./
source .bashrc
rm -rf linux-config

# init ssh keys
ssh-keygen -t rsa -P ''<<EOF

EOF

echo 'init over!'

exit

