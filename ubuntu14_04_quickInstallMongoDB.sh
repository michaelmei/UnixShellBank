sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

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

sudo apt-get install -y mongodb-org=3.0.6 mongodb-org-server=3.0.6 mongodb-org-shell=3.0.6 mongodb-org-mongos=3.0.6 mongodb-org-tools=3.0.6

echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections

sudo service mongod start


#AFTER LOGIN TO THE SYSTEM
mongo 127.0.0.1:28000

#Setup user roles
db.createUser({user:"admin_name", pwd:"1234",roles:["readWrite","dbAdmin"]})

