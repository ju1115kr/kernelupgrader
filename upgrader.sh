#!/bin/bash

# Message from
#
# 				made by. Lee Ju Young
#  
#
# Maybe this command will help for you when compile without error ($ make)
# I expect you'll finish this kernel upgrade project
#
# Also this script needs root permission, so you must used by 'sudo' command
# If you want to excute this script,
#
# 				$ > sudo ./upgrader.sh
#
#
# And
# 				
			######
			#     #   ####   #    #   #  #####
			#     #  #    #  ##   #        #
			#     #  #    #  # #  #        #
			#     #  #    #  #  # #        #
			#     #  #    #  #   ##        #
			######    ####   #    #        #

			######
			#     #    ##    #    #     #     ####
			#     #   #  #   ##   #     #    #    #
			######   #    #  # #  #     #    #
			#        ######  #  # #     #    #
			#        #    #  #   ##     #    #    #
			#        #    #  #    #     #     ####
#

####################################################################################

# command:
nslookup cdn.kernel.org
nslookup www.kernel.org

# install preparities packages
yum install wget gcc make ncurses-devel openssl-devel elfutils-libelf-devel bc perl kernel-devel -y
pip install lxml BeautifulSoup4 requests # install python lib

# get latest kernel version from kernel.org
latest_kernel_version="$(python kernel_crawing/kernel_version.py)"
latest_kernel_link="$(python kernel_crawing/kernel_link.py)"

wget $latest_kernel_link 	# download latest version kernel file
tar -xvf linux-$latest_kernel_version.tar.xz && cd linux-$latest_kernel_version # Decompress tar.xz file and change directory

yes "" | make oldconfig		# make oldconfig with all 'yes' command repeatedly output a line with all specified string by default
make -j4  				# 'make' processing will be VERY VERY LONG TIME :)
make -j4 modules
make modules_install
make install			# install to system

grub2-set-default 0		# change boot sequence
grub2-mkconfig -o /boot/grub2/grub.cfg

init 6				# reboot

uname -a			# if you complete reboot please check out kernel version on this system
package-cleanup --oldkernels --count=1
