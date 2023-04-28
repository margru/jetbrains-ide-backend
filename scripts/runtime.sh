#!/bin/bash

if id "${USERNAME}" &>/dev/null; then
  echo "User ${USERNAME} exists do nothing"
else
  echo "User ${USERNAME} does not exists lets create them"
  useradd -rm -d /home/"${USERNAME}" -s /bin/bash -g root -G sudo -u 1000 "${USERNAME}"
  chown "${USERNAME}" /home/"${USERNAME}"
fi
echo "${USERNAME}:${PASSWORD}" | chpasswd

/usr/sbin/sshd -D
