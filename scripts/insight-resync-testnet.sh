#!/bin/sh
CURDIR=`pwd`
cd ~xcp/insight-api
export BITCOIND_DATADIR=/home/xch/.viacoin-testnet/
export BITCOIND_USER=`cat /home/xch/.viacoin-testnet/viacoin.conf | sed -n 's/.*rpcuser=\([^ \n]*\).*/\1/p'`
export BITCOIND_PASS=`cat /home/xch/.viacoin-testnet/viacoin.conf | sed -n 's/.*rpcpassword=\([^ \n]*\).*/\1/p'`
INSIGHT_NETWORK=testnet INSIGHT_DB=/home/xcp/insight-api/db util/sync.js -D
cd $CURDIR
