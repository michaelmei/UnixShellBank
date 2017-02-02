#http://www.leonardteo.com/2011/07/taking-server-side-screenshots-of-websites/
#######################################################################################

#Installing Xvbf and screenshot tool
#######################################################################################

sudo apt-get install xvfb
sudo apt-get install imagemagick


#Installing the Browsers
#######################################################################################

#if you want the actual Google Chrome, open a terminal and follow:
#The 32-bit version is no longer available.

cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

#If you encounter any errors simply use
sudo apt-get -f install


#Create a file in /etc/init.d called xvfb. Put this in:
#######################################################################################

#!/bin/bash
#
# /etc/rc.d/init.d/xvfb
#
# chkconfig: 345 98 90
# description: starts virtual framebuffer process to
# enable server
#
#
#
# Source function library.
#.  /etc/init.d/functions
XVFB_OUTPUT=/tmp/Xvfb.out
XVFB=/usr/bin/X11/Xvfb
XVFB_OPTIONS=":5 -screen 0 1080x1440x24 -fbdir /var/run"

start()  {
echo -n "Starting : X Virtual Frame Buffer "
$XVFB $XVFB_OPTIONS >>$XVFB_OUTPUT 2>&1&; #remove ; if necessary
RETVAL=$?
echo
return $RETVAL
}

stop()   {
echo -n "Shutting down : X Virtual Frame Buffer"
echo
killall Xvfb
echo
return 0
}

case "$1" in
start)
start
;;
stop)
stop
;;
status)
status xvfb
;;
restart)
    stop
    start
    ;;

*)
echo "Usage: xvfb {start|stop|status|restart}"
exit 1
;;
esac
exit $?
#######################################################################################

#Once you have this shell script in place, you can simply start and stop the xvfb server easily with:
sudo /etc/init.d/xvfb start    # (or sudo service xvfb start)
sudo /etc/init.d/xvfb stop
#Great!

#I’ll assume that you did the apt-get install to get both Firefox and flash-plugin. Once you have those, test the configuration like this…

#Make sure that the xvfb server is running
#Run this: 
DISPLAY=:5 nohup firefox http://www.youtube.com &
nohup google-chrome --display=$DISPLAY --screenshots https://www.google.com &

#Advanced usage
sudo nohup google-chrome \
--display=:5 \
--load-extension={directory} \
--allow-running-insecure-content \
--user-data-dir=/root/chrome-profile \
--no-default-browser-check \
--disable-breakpad \
--disable-translate \
--always-authorize-plugins \
--always-on \
--restore-last-session \
https://www.google.com > chromelog &
 
#Explanation:
#DISPLAY=:5 This tells xvfb to render to display 5 (virtual) nohup silence the output firefox loads firefox http://youtube.com loads youtube which tells you whether you have Flash or not & Load this in the background
#Firefox should be running in the background now. If it’s not, you may have to debug and find out why. Remove the nohup and the & to see the output to shell if you need to debug.
#Now comes the moment of truth. Taking a screenshot:

#This will dump the desktop to screenshot.png. Check it.
DISPLAY=:5 import -window root screenshot.png

#Kill firefox by typing fg then CTRL+C.

#http://peter.sh/experiments/chromium-command-line-switches/
#chromium --load-extension

#https://sites.google.com/site/mygwtexamples/home/testing/headless-running

#http://elementalselenium.com/tips/29-chrome-driver


