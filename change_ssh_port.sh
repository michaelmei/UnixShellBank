#Step 1
#As root, use your favorite text editor (vi) to edit the sshd configuration file.

vi /etc/ssh/sshd_config

#Step 2
#Edit the line which states 'Port 22'. But before doing so, you'll want to read the note below. 
#Choose an appropriate port, also making sure it not currently used on the system.

# What ports, IPs and protocols we listen for
Port 50683

#Note: The Internet Assigned Numbers Authority (IANA) is responsible for the global coordination of the DNS Root, 
#IP addressing, and other Internet protocol resources. It is good practice to follow their port assignment guidelines. 
#Having said that, port numbers are divided into three ranges: 
#Well Known Ports, Registered Ports, and Dynamic and/or Private Ports. 
#The Well Known Ports are those from 0 through 1023 and SHOULD NOT be used. 
#Registered Ports are those from 1024 through 49151 should also be avoided too. 
#Dynamic and/or Private Ports are those from 49152 through 65535 and can be used. 
#Though nothing is stopping you from using reserved port numbers, 
#our suggestion may help avoid technical issues with port allocation in the future.

#Step 3
#Switch over to the new port by restarting SSH.
/etc/init.d/ssh restart

#Step 4
#Verify SSH is listening on the new port by connecting to it. Note how the port number now needs to be declared.
ssh username@hostname.com -p 50683

