#!/bin/bash
# Install ssh key files
#
# scriptver=7
# scriptdate=22.09.2017
# upd1:26.09.2017:user ak add
# upd2:11.12.2018:add git hub sources
# upd3:05.12.2019:add interact multiuser menu
# upd4:11.12.2019:add create .ssh for root
# upd5:14.02.2020:add username and chown
# upd6:31.05.2023:del ak
if [ ! -e /root/.ssh/authorized_keys ]; then
                mkdir /root/.ssh
                touch /root/.ssh/authorized_keys
fi
user1='root'
user2='root'
                if [ -e /$user1/.ssh/authorized_keys ]; then
                           td=`date +%Y-%m-%d_%H:%M:%S`
                           cp /$user1/.ssh/authorized_keys /$user1/.ssh/authorized_keys.$td.old
                fi
                git clone https://github.com/a7exius/.ssh /tmp/ssh
                mv /tmp/ssh/authorized_keys /$user1/.ssh/authorized_keys
                echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGHo38z/83kZqGF7ny+S0oT2QHFo5IJbFm50xlPdND7CxxwPT8NkhCreEpGMIljHqATujaC7otFLiFFQoIW02tf046VRzz7jTE4vhSOrUrIhYr2htIvICjzIrtS
eJhaCXdEj6xV0N9cD/m46lE/Fq4//C6OKcZcFS9/30QZlOk9Je4ZVWHwanmz+NcZprYG9dOBZAq1yCtwVN9kilk9V2L0ihdx4vqZrh4OEoSi7SceTQQBDtdRgkor02CKUZ4otseyBADFCOJaMqhiEsP8yFn6Tw0sHAjpr1T9vQmKndDiS6EF9ii
Zieo1gxukTboCekvXCegzhYZxTu7I6U3QdIf root@rumsk1dlpl03" >> /$user1/.ssh/authorized_keys
                echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAqB6GUyKlTQEpQZu1mH71CqHmqmRFD6h4tMP0Crtth2SSuQ8crtZBoC3xuR27Lfqy4OBOC5ifu0MdYla00gizAgMcR5UkV73R4J9rNfVAhA0xkN1Ybvtap5XWPItPn
/9mw5D+DUdG+CnNfhV7CVFt55D+vsOnzysrq/KZdOO7xmjgeuFZnq5G2LeDoVSboDWnaSA8uIQGbSvhLg6LYZtJ0VWo8pTHVRnWpf3eJkNxCcHrndv/VjrVl0Pu2/sl05EnEa4IlzHMRYjSrOOYK360IBcRmoGtsuUj063inVmtijaHNa/9W0sb
g2hOAXv+h0Y2cbyJloilUjuvSrGY+Oq/+w==" >>/$user1/.ssh/authorized_keys
chmod 700 /$user1/.ssh
chmod 400 /$user1/.ssh/authorized_keys
chown -R $user2:$user2 /$user1/.ssh
rm -rf /tmp/ssh
