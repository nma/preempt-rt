#!/bin/bash

fallocate -l 1G /swapfile

ls -lh /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile

