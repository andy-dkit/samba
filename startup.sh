#!/bin/bash

# change permissions of mounted directories
chown -R k8s:samba /data/sambashare
chmod -R g+w /data/sambashare/

# start samba
service smbd start

# keep process alive
tail -f /dev/null

