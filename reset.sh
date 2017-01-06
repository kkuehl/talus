#!/bin/sh

sudo stop talus-master
sudo stop talus-slave
sudo stop talus-web
sudo stop talus-amqp
sudo stop talus-db

echo sleeping for 10s
sleep 10

sudo kill -KILL $(ps aux | grep slave | grep -v grep | awk '{print $2}')
sudo kill -KILL $(ps aux | grep master | grep -v grep | awk '{print $2}')

sudo start talus-db
sudo start talus-amqp

echo sleeping for db to startup
sleep 20s

sudo start talus-web
sudo start talus-master
sudo start talus-slave

echo "should be good now..."

sleep 5
echo MASTER
echo MASTER
echo MASTER
echo MASTER
echo MASTER
sudo tail -n 30 /var/log/upstart/talus-master.log

echo SLAVE
echo SLAVE
echo SLAVE
echo SLAVE
echo SLAVE
sudo tail -n 30 /var/log/upstart/talus-slave.log
