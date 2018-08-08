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
apt-mark hold linux-image-generic linux-headers-generic
apt-get install -y make bc bison flex libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev wget python3 python3-pip
pip3 install lxml BeautifulSoup4 requests # install python lib

# get latest kernel version from kernel.org
latest_kernel_version="$(python3 kernel_crawing/kernel_version.py)"
latest_kernel_link="$(python3 kernel_crawing/kernel_link.py)"

wget $latest_kernel_link 	# download latest version kernel file
tar -xvf linux-$latest_kernel_version.tar.xz && cd linux-$latest_kernel_version # Decompress tar.xz file and change directory

yes "" | make oldconfig		# make oldconfig with all 'yes' command repeatedly output a line with all specified string by default
make 				# 'make' processing will be VERY VERY LONG TIME :)
make install			# install to system

grub-set-default 0		# change boot sequence
update-grub			# apply changed grub config

init 6				# reboot
uname -a			# if you complete reboot please check out kernel version on this system
