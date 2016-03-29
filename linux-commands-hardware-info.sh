
#The lscpu command reports information about the cpu and processing units. It does not have any further options or functionality.
lscpu

#A general purpose utility, that reports detailed and brief information about multiple different hardware units 
#such as cpu, memory, disk, usb controllers, network adapters etc. Lshw extracts the information from different /proc files.
lshw

#Hwinfo is another general purpose hardware probing utility that can report detailed and
#brief information about multiple different hardware components, and more than what lshw can report.
hwinfo --short

#The lspci command lists out all the pci buses and details about the devices connected to them.
#The vga adapter, graphics card, network adapter, usb ports, sata controllers, etc all fall under this category.
lspci
lspci -v | grep "VGA" -A 12

#lsscsi - List scsi devices
lsscsi

#lsusb - List usb buses and device details
lsusb

#Inxi is a 10K line mega bash script that fetches hardware details from multiple different sources and commands on the system,
#and generates a beautiful looking report that non technical users can read easily.
inxi -Fx

#lsblk - List block devices
lsblk

#df - disk space of file systems
df -H

#Pydf - Python df
pydf

#Fdisk is a utility to modify partitions on hard drives, and can be used to list out the partition information as well.
sudo fdisk -l

#The mount is used to mount/unmount and view mounted file systems.
mount | column -t
mount | column -t | grep ext

#free - Check RAM
#Check the amount of used, free and total amount of RAM on system with the free command.
free -m

#The dmidecode command is different from all other commands.
#It extracts hardware information by reading data from the SMBOIS data structures (also called DMI tables).
# display information about the processor/cpu
sudo dmidecode -t processor

# memory/ram information
sudo dmidecode -t memory

# bios details
sudo dmidecode -t bios

#Many of the virtual files in the /proc directory contain information about hardware and configurations. Here are some of them
# cpu information
cat /proc/cpuinfo

# memory information
cat /proc/meminfo

#Linux/kernel information
cat /proc/version

#SCSI/Sata devices
cat /proc/scsi/scsi 

#Partitions
cat /proc/partitions 

#The hdparm command gets information about sata devices like hard disks.
sudo hdparm -i /dev/sda
