#!/bin/bash
#Shell script to install Docker on Ubuntu; change the username on line 30 as required.

#Remove previous docker installations
echo '------------------------Removing old packages------------------------'
apt-get remove docker docker-engine docker.io containerd runc
#Update repo
echo '------------------------Updating package list------------------------'
apt-get update
#Install dependencies
echo '------------------------Installing dependecies------------------------'
apt-get install ca-certificates curl gnupg lsb-release
#Add Docker GPG key
echo '------------------------Download gpg and add to keyrings------------------------'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg 
echo '------------------------Set variables------------------------'
architecture=`dpkg --print-architecture`
echo $architecture 
lsbrel=`lsb_release -cs`
echo $lsbrel
echo '------------------------Set the new source list------------------------'
echo  "deb [arch=$architecture signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $lsbrel stable" | sudo tee /etc/apt/sources.>
#Update repo
echo '------------------------Update package list------------------------'
apt-get update
#Install Docker
echo '------------------------Install docker------------------------'
apt-get install docker-ce docker-ce-cli containerd.io
echo '------------------------Add user to docker group------------------------'
usermod -aG docker matteo
echo 'Script completed; Dcoker is now installed; run ----newgrp docker----- to log in with the new group ID'
