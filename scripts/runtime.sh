#!/bin/bash

if ! grep "${USERNAME}" /etc/passwd >dev/null 2>&1; then
	useradd -rm -d /home/${USERNAME} -s /bin/bash -g root -G sudo -u 1000 ${USERNAME}
	echo "${USERNAME}:${PASSWORD}" | chpasswd
fi
/usr/sbin/sshd -D
