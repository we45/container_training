#!/bin/sh
while :; do
  sleep 10
  for each in $( redis-cli KEYS \* ); do
    result=$(redis-cli type $each)
    value=""
    if [ $result == "list" ]
    then
      value=$(redis-cli lrange $each 0 -1)
    elif [ $result == "string" ]
    then
      value=$(redis-cli get $each)
    elif [ $result == "set" ]
    then
      value=$(redis-cli smembers $each)
    fi
    curl -X POST -H "Content-Type: application/json; charset=UTF-8" -d "{\"key\": \"$each\", \"value\": \"$value\"}" http://$LISTENER_IP:$LISTENER_PORT
    sleep 1
  done
  sleep 10
done
