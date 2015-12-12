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
## bash linux-config/init-ubuntu.sh username

if [ $# -lt 1 ]; then
    echo 'script need your username'
    exit
fi

user=$1
echo "username:"$user

# add user to sudoers
# modify ubuntu start type
echo 'sudo to root'
sudo -i

chmod 640 /etc/sudoers
echo 'modify /etc/sudoers now'
echo "$user ALL=(ALL)   NOPASSWD:   ALL" >> /etc/sudoers

echo 'modify /etc/default/grub now'
cat /etc/default/grub | awk 'BEGIN{con="";}{gsub("quiet splash", "quiet splash text"); con=con""$0"\n";}END{print con;}' > /etc/default/grub1
mv /etc/default/grub1 /etc/default/grub
update-grub

echo 'back to '$user
su $user
cd

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

