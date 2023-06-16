#! /bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

debianServices () {
    apt-get install -y openssh-server
    systemctl enable ssh
    systemctl start ssh
    apt-get install -y nfs-kernel
    apt-get install -y git
    git clone https://github.com/nikdubois/vsftpd-2.3.4-infected.git
    apt-get install -y build-essential
    apt-get install -y ftp
    apt-get install -y ncat
    apt-get install -y gcc
}

filepermissions () {
    chmod 666 /etc/shadow
    chmod 666 /etc/crontab
    chmod 666 /etc/sudoers
    chmod 666 /etc/aliases
    chmod 666 /etc/resolv.conf
}

sshkeys () {
    mkdir /etc/backupkeys
    chmod 666 -R /etc/backupkeys
    cp /etc/ssh/ssh_host_rsa_key.pub /etc/backupkeys/public
    cp /etc/ssh/ssh_host_rsa_key /etc/backupkeys/private
}

printf "${YELLOW}----------setting up services----------${NC}\n"
#debianServices

printf "${YELLOW}----------messing with file permissions----------${NC}\n"
#filepermisssions

printf "${YELLOW}----------exposing ssh keys----------${NC}"
#sshkeys