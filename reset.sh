#!/bin/sh

if [[ `systemctl` =~ -\.mount ]]; then
	sudo systemctl stop talus-master
	sudo systemctl stop talus-slave
	sudo systemctl stop docker.talus-web
	sudo systemctl stop docker.talus-amqp
	sudo systemctl stop docker.talus-db
else
	sudo stop talus-master
	sudo stop talus-slave
	sudo stop talus-web
	sudo stop talus-amqp
	sudo stop talus-db
fi

echo sleeping for 10s
sleep 10

sudo kill -KILL $(ps aux | grep slave | grep -v grep | awk '{print $2}')
sudo kill -KILL $(ps aux | grep master | grep -v grep | awk '{print $2}')

if [[ `systemctl` =~ -\.mount ]]; then
	sudo systemctl start docker.talus-db
	sudo systemctl start docker.talus-amqp
else
	sudo start talus-db
	sudo start talus-amqp
fi

echo sleeping for db to startup
sleep 20s

if [[ `systemctl` =~ -\.mount ]]; then
	sudo systemctl start docker.talus-web
	sudo systemctl start talus-master
	sudo systemctl start talus-slave
else
	sudo start talus-web
	sudo start talus-master
	sudo start talus-slave
fi

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
