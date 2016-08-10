#INSTALL JAVA 8
#INSTALL MYSQL
cd ~
wget https://github.com/actionml/PredictionIO/releases/download/v0.9.6/PredictionIO-0.9.6.tar.gz
tar zxvf PredictionIO-0.9.6.tar.gz

mkdir ~/PredictionIO-0.9.6/vendors

#Spark Setup
wget http://d3kbcqa49mib13.cloudfront.net/spark-1.5.1-bin-hadoop2.6.tgz
tar zxvfC spark-1.5.1-bin-hadoop2.6.tgz PredictionIO-0.9.6/vendors

#PredictionIO-0.9.6/conf/pio-env.sh change relative settings to MYSQL engine for example
#AFTER CHANGING THE CONFIGURATION, RUN THE FOLLOWING SCRIPT:
sh PredictionIO-0.9.6/bin/load-pio-env.sh

#Start the event server
PredictionIO-0.9.6/bin/pio eventserver &
