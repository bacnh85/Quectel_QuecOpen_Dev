#!/usr/bin/env sh

# Init the container
if [ -z $(getent passwd $UID) ]; then
  # Create user/group and assign /opt permission
  groupadd -g $GID $GID
  useradd -u $UID -g $GID -s /bin/bash $UID

  USER_PASSWORD=$(date +%s | sha256sum | base64 | head -c 32)
  echo $UID:$USER_PASSWORD | chpasswd
fi

# Chmod /opt and change user
chown $UID:$GID /opt

# Run bash to keep container alive
tail -f /dev/null