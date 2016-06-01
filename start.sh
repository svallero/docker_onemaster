#!/bin/bash

# New password can be passed at runtime
echo oneadmin:${ONE_PASSWORD} > ${ONE_AUTH}

# start oned and scheduler
# (mh this is not microservices style)
one start

# process to keep the container alive ;)
tail -f /var/log/one/oned.log
