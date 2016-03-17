#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
https://docs.docker.com/engine/installation/linux/ubuntulinux/
#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

#Docker requires a 64-bit installation regardless of your Ubuntu version. Additionally, your kernel must be 3.10 at minimum. 
uname -r

######################################
#Update your apt sources#
######################################

apt-get update
apt-get install apt-transport-https ca-certificates

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

#Open the /etc/apt/sources.list.d/docker.list file in your favorite editor.
deb https://apt.dockerproject.org/repo ubuntu-trusty main
#Save and close the /etc/apt/sources.list.d/docker.list file.

apt-get update

apt-get purge lxc-docker

apt-cache policy docker-engine

######################################
#Prerequisites by Ubuntu Version#
######################################

sudo apt-get update

sudo apt-get install linux-image-extra-$(uname -r)

apt-get install apparmor

######################################
#Install#
######################################

sudo apt-get update

sudo apt-get install docker-engine

sudo service docker start

#Verify if the docker is installed ok
#sudo docker run hello-world







