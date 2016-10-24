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


#For Firefox, it's just apt-get install firefox.

#On CentOS, I have had more trouble.
#For starters, Chrome is not supported on CentOS and I haven't even found a simply way to build Chrominum and I gave up.
#Installing firefox also had a little hiccup: I ran yum install firefox, but then running firefox resulted in an error, which I solved by also installing gdk-pixbuf2 via yum install gdk-pixbuf2.
#If you are on other Linux distros I haven't mentoned, checkout the Chrome download page and the Firefox on Linux page.


#Xvfb Usage
#######################################################################################

#The usage of Xvfb is:
xvfb-run <some command>

#That's all you need to know! For example, you can run Firefox within Xvfb:
xvfb-run firefox http://google.com
#This should just start a firefox process in the background. You may see a cryptic warning in the terminal, but otherwise it's not very exciting because you don't actually see anything.


#If you use Testem to run tests, you can do:
#######################################################################################

#to run your tests in Firefox or
xvfb-run testem -l firefox

#to run them in Chrome - headless!
xvfb-run testem -l chrome


#http://peter.sh/experiments/chromium-command-line-switches/
#chromium --load-extension

#https://sites.google.com/site/mygwtexamples/home/testing/headless-running

#http://elementalselenium.com/tips/29-chrome-driver
