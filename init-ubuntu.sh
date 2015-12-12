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
    echo 'script need your username and password'
    exit
fi

user=$1
pass=$2
echo "username:"$user
echo "password:"$pass

cd

# add user to sudoers
# modify ubuntu start type
echo 'modify /etc/sudoers now'
echo $pass | sudo -S chmod 640 /etc/sudoers
echo $pass | sudo -S cat /etc/sudoers > /tmp/sudoers
echo "$user ALL=(ALL)   NOPASSWD:   ALL" >> /tmp/sudoers
echo $pass | sudo -S mv /tmp/sudoers /etc/sudoers
echo $pass | sudo -S chown root:root /etc/sudoers
echo $pass | sudo -S chmod 640 /etc/sudoers

echo 'modify /etc/default/grub now'
cat /etc/default/grub | awk 'BEGIN{con="";}{gsub("quiet splash", "quiet splash text"); con=con""$0"\n";}END{print con;}' > /tmp/grub1
sudo mv /tmp/grub1 /etc/default/grub
sudo update-grub

# install packages
echo 'apt-get some packages'
sudo apt-get update
sudo apt-get install -y openssh-server python-pip python-virtualenv vim git tmux sauce

echo 'clear folder now'
sudo mv .profile ../
sudo rm -rf *
sudo rm -rf .*
sudo rm -rf .config

echo 'create virtual environment folder named pyvirt'
virtualenv pyvirt

# copy files
echo 'clone linux config files'
git clone https://github.com/pmars/linux-config.git

echo 'mv config files to user folder'
mv linux-config/.[a-z]* ./

echo 'reload bashrc'
source .bashrc

echo 'clear linux config files'
rm -rf linux-config

# init ssh keys
echo 'init ssh key'
ssh-keygen -t rsa -P ''<<EOF

EOF

echo 'init over!'

exit

