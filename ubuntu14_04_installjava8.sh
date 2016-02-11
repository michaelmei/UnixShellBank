
sudo apt-get update
################The security server might be stuck
##############try following to disable the ipv6 network and then comment it back later...
###############The IPv6 setting for the network were ignored, but disabling IPv6 via /etc/sysctl.conf worked:
#Add the following lines at the bottom of /etc/sysctl.conf:
########################################################################################################################
#net.ipv6.conf.all.disable_ipv6 = 1
#net.ipv6.conf.default.disable_ipv6 = 1
#net.ipv6.conf.lo.disable_ipv6 = 1
#Run sudo sysctl -p to reload the /etc/sysctl.conf settings.

sudo apt-get install software-properties-common python-software-properties
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get install git

#auto lisence agreement
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer

java -version

sudo apt-get install oracle-java8-set-default

