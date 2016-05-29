#!/bin/bash
#to be run as root user
echo Name of the directory ?
read dir
mkdir $dir
cd $dir
touch file{1..100}.txt
truncate -s 10k file{1..100}.txt

 for n in {1..100}; do
    cat /dev/urandom | tr -dc A-Za-z0-9 | head -c 16 > file$n.txt 
  done 

chmod 444 -R file{1..100}.txt
touch -d "2 days ago" file{1..100}.txt
echo completed 