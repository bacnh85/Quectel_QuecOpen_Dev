#!/usr/bin/env sh

# Init the container
if [ -z $(getent passwd $PUID) ]; then
  # Create user/group and assign /opt permission
  groupadd -g $PGID $PGID
  useradd -u $PUID -g $PGID -s /bin/bash $PUID

  USER_PASSWORD=$(date +%s | sha256sum | base64 | head -c 32)
  echo $PUID:$USER_PASSWORD | chpasswd
fi

# Chmod /opt and change user
chown $PUID:$PGID /opt

# Run bash to keep container alive
tail -f /dev/null