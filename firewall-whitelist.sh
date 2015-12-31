sudo apt-get install ufw
sudo ufw disable
sudo ufw enable

# We are doing incoming white-list
sudo ufw default allow incoming
# We are doing outgoing black-list
sudo ufw default deny outgoing

#ssh
sudo ufw allow 22/tcp

#web
sudo ufw allow 80/tcp

#ftp
sudo ufw allow 21/tcp

#unallow ftp
sudo ufw delete allow 80/tcp

#unallow the first rule (1)
sudo ufw delete 1

#specify a range
sudo ufw allow 1000:2000/tcp
sudo ufw allow 1000:2000/udp

#allow a specific ip address to access
sudo ufw allow from 192.168.255.255

#allow IP address 192.168.0.4 access to port 22 for all protocols
sudo ufw allow from 192.168.1.0/24

#sudo ufw allow from <target> to <destination> port <port number> proto <protocol name>
#allow IP address 192.168.0.4 access to port 22 using TCP
sudo ufw allow from 192.168.0.4 to any port 22 proto tcp

#MORE FROM https://help.ubuntu.com/community/UFW