#Installing Xvbf
#######################################################################################

#If you are running Debian or Ubuntu and are using apt-get, installing is simply as:
apt-get install xvfb

#If you are on CentOS and using yum, it's
yum install xorg-X11-server-Xvfb


#Installing the Browsers
#######################################################################################

#if you want the actual Google Chrome, open a terminal and follow:
#The 32-bit version is no longer available.

cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

#If you encounter any errors simply use
sudo apt-get -f install


#http://www.leonardteo.com/2011/07/taking-server-side-screenshots-of-websites/
#######################################################################################
#I’ll assume that you did the apt-get install to get both Firefox and flash-plugin. Once you have those, test the configuration like this…

#Make sure that the xvfb server is running
#Run this: 
DISPLAY=:5 nohup firefox http://www.youtube.com &
nohup google-chrome --display=$DISPLAY --screenshots https://www.google.com &
 
#Explanation:
#DISPLAY=:5 This tells xvfb to render to display 5 (virtual) nohup silence the output firefox loads firefox http://youtube.com loads youtube which tells you whether you have Flash or not & Load this in the background
#Firefox should be running in the background now. If it’s not, you may have to debug and find out why. Remove the nohup and the & to see the output to shell if you need to debug.
#Now comes the moment of truth. Taking a screenshot:


DISPLAY=:5 import -window root screenshot.png
#This will dump the desktop to screenshot.png. Check it.
#Kill firefox by typing fg then CTRL+C.


#http://peter.sh/experiments/chromium-command-line-switches/
#chromium --load-extension

#https://sites.google.com/site/mygwtexamples/home/testing/headless-running

#http://elementalselenium.com/tips/29-chrome-driver
