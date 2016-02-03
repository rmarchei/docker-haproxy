#!/bin/bash

while inotifywait -q -e modify,attrib,close_write /etc/haproxy/haproxy.cfg; do
  sleep 1
  reload-haproxy
done
