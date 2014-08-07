#!/bin/sh

sudo service clearinghoused restart
sudo service clearinghoused-testnet restart
sleep 10
sudo service clearblockd restart
sudo service clearblockd-testnet restart
