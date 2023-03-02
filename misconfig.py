import os
import random

#RUN AS ROOT OR SUDOER

#variables that will store lists, command variables and anything else that needs to be stored as a variable,
groupnames = ("goblinos", "sandialabs", "cisoers", "insureslaves", "consultants","students","mayoeaters", "umlauts","boredapes")
servicesetup = 'sudo apt install -y openssh-server && sudo apt install -y nfs-kernel-server'
fileperms = 'sudo chmod 666 /etc/shadow && chmod 666 /etc/crontab && chmod 666 /root/.bash_history '
sshkeys = 'mkdir /etc/backupkeys && cp /etc/ssh/ssh_host_rsa_key.pub /etc/backupkeys/publicbackup && cp /etc/ssh/ssh_host_rsa_key /etc/backupkeys'
firewall = 'sudo iptables --flush && sudo ufw enable && sudo ufw allow from any && sudo ufw status'
whooppasswdfile = 'sudo echo "root:password123" > /opt/rootcreds.txt && echo "ethan:password123" > /etc/ethanscreds.txt && echo "john:password123" > /home/$USER/Desktop/johnscreds.txt'
rsync = 'sudo echo "motd file = /etc/rsyncd.motd" > /etc/rsyncd.conf && echo "lock file = /var/run/rsync.lock" >> /etc/rsyncd.conf && echo "log file = /var/log/rsyncd.log" >> /etc/rsyncd.conf && echo "pid file = /var/run/rsyncd.pid" >> /etc/rsyncd.conf && echo " " >> /etc/rsyncd.conf && echo "[files]" >> /etc/rsyncd.conf && echo " path = /" >> /etc/rsyncd.conf && echo " comment = Remote file share." >> /etc/rsyncd.conf && echo " uid = 0" >> /etc/rsyncd.conf && echo " gid = 0" >> /etc/rsyncd.conf && echo " read only = no" >> /etc/rsyncd.conf && echo " list = yes" >> /etc/rsyncd.conf && systemctl restart rsync'
nfs = 'systemctl enable nfs-kernel-server && systemctl start nfs-kernel-server && sudo echo "/home" >> /etc/exports && echo "/" >> /etc/exports '
cronjob = 'echo "*/15 * * * * iptables --flush && ufw allow from any >/dev/null 2>&1" '
#setuid = ''
# remember to add extra cronjobs for different machines
wwscript ='mkdir /scripts && echo "oh no dont edit this world writable script to do bad things ohh nooo" >> /scripts/rootcron.sh && chmod -R 777 /scripts'
#sudoers =''

#randomly chooses two objects from groupname list and creates two groups with messy permissions.
print("creating random groups...")
for i in range(3):
    group = (random.choice(groupnames))
    groupcmd = ("sudo groupadd "+ group + "")
    os.system(groupcmd)

print('setting up some services...')
os.system(servicesetup)

print("messing with file permissions...")
os.system(fileperms)

print("exposing ssh keys...")
os.system(sshkeys)

print("misconfiguring firewalls...")
os.system(firewall)

print("adding creds in random spots...")
os.system(whooppasswdfile)

print("misconfiguring rsync...")
os.system(rsync)

print("misconfiguring nfs...")
os.system(nfs)

print("creating writable script...")
os.system(wwscript)
