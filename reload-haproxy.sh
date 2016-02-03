#!/bin/bash

set -e

haproxy -c -f /etc/haproxy/haproxy.cfg
haproxy -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid -st $(</var/run/haproxy.pid)
echo "[OK] HAProxy restarted - PID $(cat /var/run/haproxy.pid)"
