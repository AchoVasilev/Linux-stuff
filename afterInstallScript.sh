#!/bin/bash

#configure dnf
sudo nano /etc/dnf/dnf.conf
max_parallel_downloads=10
fastestmirror=true
deltarpm=true

#update system
sudo dnf update -y

#add rpm repos
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

#add flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y

#install tweaks
sudo dnf install gnome-tweaks 
flatpak install flathub com.mattjakeman.ExtensionManager

#install multimedia
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia -y
sudo dnf install vlc

#create programming directory
mkdir Mine && cd Mine && mkdir Programs && cd Programs

#Install postman
sudo flatpak install postman

#Install Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code -y

#Install docker
sudo dnf -y install dnf-plugins-core -y
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

#Install IntelliJ
wget https://download.jetbrains.com/idea/ideaIC-2022.3.tar.gz
sudo tar -xzf ideaIC-2022.3.tar.gz --directory=/home/acho/Programs
cd idea-IC-223.7571.182/bin
./idea.sh
#if error with permissions - sudo chown -R $(whoami) idea-IC-223.7571.182/

#Install pgadmin
sudo rpm -i https://ftp.postgresql.org/pub/pgadmin/pgadmin4/yum/pgadmin4-fedora-repo-2-1.noarch.rpm
sudo dnf install pgadmin4 -y
sudo /usr/pgadmin4/bin/setup-web.sh -y

#Install NodeJs
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
nvm install 18.10.0
nvm use 18.10.0
npm install -g @angular/cli

gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"
