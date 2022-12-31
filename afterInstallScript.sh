#!/bin/bash

#Update the system
sudo dnf update -y

#Add programs
mkdir Programs
cd Programs

##Install IntelliJ Community
wget https://download.jetbrains.com/idea/ideaIC-2022.3.tar.gz
sudo tar -xzf ideaIC-2022.3.tar.gz --directory=/home/acho/Programs



