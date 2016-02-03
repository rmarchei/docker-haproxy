# HAProxy - http://www.haproxy.org/
#

FROM alpine:3.2
MAINTAINER Ruggero Marchei <ruggero.marchei@daemonzone.net>

RUN apk add --update bash python3 haproxy inotify-tools ca-certificates \ 
  && pip3 install chaperone \
  && rm -rf /var/cache/apk/* \
  && mkdir -p /var/log/haproxy \
  && chown -R haproxy:haproxy /etc/haproxy /var/log/haproxy

COPY chaperone.conf         /etc/chaperone.d/chaperone.conf
COPY reload-haproxy.sh      /usr/local/bin/reload-haproxy
COPY stalk-haproxy.sh       /usr/local/sbin/stalk-haproxy

ENTRYPOINT ["/usr/bin/chaperone"]
