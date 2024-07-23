#!/bin/bash

if [ $# -ne 1 ]
then
echo -e "Wrong params to shell-script"
exit 1
fi

# Detecting Python

version=$(echo "$( python3 -c 'import sys; print(sys.version_info[:])')" | sed -e 's/)//; s/(//; s/\,/\n/2; s/ //' | sed -e  's/,//; 2d')

if [ -n "$version" ]
then
if [ $version -ge 300 ]
then
echo -e "Python3 detected" >&2
else
echo -e "Python version is uncompatible" >&2
fi
else
echo "Python3 not found" >&2
fi

# Getting info from Docker

docker_images=$(sudo docker images -a)

sudo docker rmi $(python3 script.py "$docker_images" "$1")


