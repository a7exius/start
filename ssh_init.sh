#!/bin/bash
# Install ssh key files
#
# scriptver=3
# scriptdate=22.09.2017
# upd1:26.09.2017:user ak add
# upd2:11.12.2018:add git hub sources
apt-get update && apt-get -y install sudo mc openssh-server fail2ban
if [ ! -d /root/.ssh ]; then
   mkdir /root/.ssh
fi
if [ -e /root/.ssh/authorized_keys ]; then
   td=`date +%Y-%m-%d_%H:%M:%S`
   cp /root/.ssh/authorized_keys /root/.ssh/authorized_keys.$td.old
fi
git clone https://github.com/a7exius/.ssh /tmp/ssh
mv /tmp/ssh/authorized_keys /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 400 /root/.ssh/authorized_keys
if [[ `grep -c '^ak:' /etc/passwd` -eq 0  ]]; then
	useradd -m -s /bin/bash ak
	mkdir /home/ak/.ssh
	mv /tmp/ssh/authorized_keys_ak /home/ak/.ssh/authorized_keys
        chown -R ak:ak /home/ak/.ssh
        chmod 700 /home/ak/.ssh
        chmod 400 /home/ak/.ssh/authorized_keys
        usermod -G sudo ak
fi
rm -rf /tmp/ssh

