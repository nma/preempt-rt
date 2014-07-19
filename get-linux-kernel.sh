#!/bin/bash

# locate our most up to date preempt_rt kernel patch, default to 3.14 if not set
PREEMPT_RT_VERSION=${PREEMPT_RT_VERSION:-"3.14.12-rt9"}
# the linux kernel must match the patch version.
LINUX_KERNEL_VERSION=${PREEMPT_RT_VERSION}
# to ensure our kernel does not contain any malware, we grab the signer's public key 
KERNEL_GPG_KEY=${KERNEL_GPG_KEY:-"00411886"}

echo "GET KERNAL VERSION --> ${PREEMPT_RT_VERSION}"

# install linux kernel manager ketchup
echo "Attempting to install ketchup kernel manager."
sudo apt-get install ketchup
cd /usr/src/kernels
mkdir linux
cd linux

# setup our loading key
gpg --recv-keys ${KERNEL_GPG_KEY}

# grab the kernel source 
echo "Grabbing kernel version ${LINUX_KERNEL_VERSION}... (may take a while to grab source files)"
ketchup -r -G ${PREEMPT_RT_VERSION} > /dev/null 2>&1
echo "Completed linux kernel source download. Now you can go configure it."

# NOTE: ketchup command above just automating this process below...

# get and apply the preempt-rt patch
# wget http://www.kernel.org/pub/linux/kernel/v3.14/linux-3.14.12.tar.bz2 > /dev/null 2>&1 
# wget https://www.kernel.org/pub/linux/kernel/projects/rt/3.14/patch-3.14.12-rt9.patch.gz > /dev/null 2>&1  

# tar -jxvf linux-3.14.12.tar.bz2
# mv linux-3.14.12 linux-3.14.12-rt9
# cd linux-3.14.12-rt9
# zcat ../patch-3.14.12-rt9.patch.gz | patch -p1

