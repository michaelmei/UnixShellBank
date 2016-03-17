#check the image list
docker images

#checkup the ubuntu image
docker search ubuntu

#pull the ubuntu 14.04
docker pull ubuntu:14.04

docker images

#The next step is to create a container and make the required changes. 
#Creating a container is Docker is done with the run command followed by, 
#amongst other things, a command to run within the container. 
#We are going to create a new container and use a bash session to customise the container 
#before saving it as a new image for use in the future.

#Create the Docker container with the run command and specify the bash shell to be executed on completion. 
#This will leave us with a bash session which we can use the customise the image. 
#Replace the ad892dd21d60 ID with the ID of the image we downloaded in the previous step.
docker run -i -t ad892dd21d60  /bin/bash

#You now have an active shell on the container which has been created with the id 3a09b2588478. 
#Type exit to end the session in your guest container and the container will be stopped and kept available on your Docker system.

#Run the ps Docker command to see what containers are known to your Docker system.
docker ps -a

#I’m going to use container ID 3a09b2588478 for the rest of this example but yours will be a different ID.
docker start 3a09b2588478

#We can now attach to the container to create a shell where we can make our modifications.
docker attach 3a09b2588478

#You now have a shell running on the container which you can use to make your changes to the container. 
#Let’s keep it simple and just run an upgrade with apt-get and then exit. 
#In the real world, you might install an application, or define your configuration such as LDAP SSH login.
apt-get update
apt-get upgrade
exit

#The last step in our example is to save the container as a new image which can be used to create future Docker containers. 
#You’ll need to specify the container ID as well as the name of the image to use. 
#You can specify a new image name or overwrite the existing image name.
docker commit 3a09b2588478 ubuntu:14.04
#b2391f1efa6db419fad0271efc591be11d0a6d7f645c17487ef3d06ec54c6489



