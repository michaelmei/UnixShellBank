# https://scaleyourcode.com/blog/article/3

wget http://download.redis.io/releases/redis-2.8.19.tar.gz
tar xzf redis-2.8.19.tar.gz
sudo mv redis-2.8.19 /etc/redis
cd /etc/redis
sudo apt-get install make
sudo apt-get install gcc
sudo aptitude install build-essential
sudo make

sudo apt-get install tcl8.5
sudo make install

cd utils
sudo ./install_server.sh

#restart redis
sudo service redis_6379 restart
