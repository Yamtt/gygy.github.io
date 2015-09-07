#!/bin/sh
cp -R ./* /
rm -rf ./quick-setup
chmod +x /etc/init.d/macvlan
chmod +x /bin/pppconnectcheck
chmod +x /bin/genwancfg
