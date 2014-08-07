#!/bin/sh
CURDIR=`pwd`
cd /home/xcp/insight-api
export BITCOIND_DATADIR=/home/xch/.viacoin/
export BITCOIND_USER=`cat /home/xch/.viacoin/viacoin.conf | sed -n 's/.*rpcuser=\([^ \n]*\).*/\1/p'`
export BITCOIND_PASS=`cat /home/xch/.viacoin/viacoin.conf | sed -n 's/.*rpcpassword=\([^ \n]*\).*/\1/p'`
INSIGHT_NETWORK=livenet INSIGHT_DB=/home/xch/insight-api/db util/sync.js -D
cd $CURDIR
