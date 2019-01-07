#!/bin/sh
set -ex

## from redis-3.2
sed -i "s/bind 127.0.0.1/bind $CLIENTHOST/g" /etc/redis.conf

## redis port inside redis.conf
sed -i "s/port 6379/port $CLIENTPORT/g" /etc/redis.conf
# sed -i "s/# requirepass foobared/requirepass $REQUIREPASS/g" /etc/redis.conf
# sed -i "s/# masterauth <master-password>/masterauth $REQUIREPASS/g" /etc/redis.conf

## slaveof <masterip> <masterport> => slaveof $MASTERHOST $MASTERPORT
if [ "$MASTERPORT" != "" ];then
	sed -i "s/# slaveof <masterip> <masterport>/slaveof $MASTERHOST $MASTERPORT/g" /etc/redis.conf
fi

## appendfsync everysec => appendfsync $APPENDFSYNC
if [ "$APPENDFSYNC" != "" ];then
	sed -i "s/appendonly no/appendonly yes/g" /etc/redis.conf
	sed -i "s/appendfsync everysec/appendfsync $APPENDFSYNC/g" /etc/redis.conf
fi


# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
	set -- redis-server "$@"
fi

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	nohup /post_db.sh > /dev/null 2>&1 &
	chown -R redis .
	exec su-exec redis "$@"
fi

exec "$@"
