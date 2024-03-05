#!/bin/bash
yc compute instance create \
--name reddit-from-image \
--hostname reddit-from-image \
--memory=4 \
--create-boot-disk image-id=fd8a5hul46n8gdn9uv5o \
--metadata serial-port-enable=1 \
--network-interface subnet-name=subnet,nat-ip-version=ipv4 \
--ssh-key ~/.ssh/appuser.pub
