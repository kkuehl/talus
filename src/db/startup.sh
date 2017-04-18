#!/bin/bash

mkdir -p /talus/logs/mongodb || true
mkdir -p /talus/data/mongodb || true

# The following improvement is from https://stackoverflow.com/questions/25137283/eval-inline-mongodb-replica-set-config
(sleep 20 ; mongo --eval 'var cfg={"_id" :"rs0", "version": 1, "members": [{"_id": 0, "host": "talus-db:27017"}]} ; rs.initiate(cfg) ; while (rs.status().startupStatus || (rs.status().hasOwnProperty("myState") && rs.status().myState != 1)) { printjson( rs.status() ); sleep(1000); }; printjson( rs.status() ) ; rs.reconfig(cfg, {force:true}) ; rs.slaveOk();') &

mongod \
	--logpath /talus/logs/mongodb/mongodb.log \
	--dbpath /talus/data/mongodb \
	--replSet rs0
