#!/bin/bash

if id "${USERNAME}" &>/dev/null; then
  echo "User ${USERNAME} exists do nothing"
else
  echo "User ${USERNAME} does not exists do nothing"
  useradd -rm -d /home/${USERNAME} -s /bin/bash -g root -G sudo -u 1000 ${USERNAME}
  echo "${USERNAME}:${PASSWORD}" | chpasswd
fi
/usr/sbin/sshd -D
