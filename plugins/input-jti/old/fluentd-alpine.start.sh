#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.

fluentd -c /fluentd/fluent.conf -p /fluentd/plugins $FLUENTD_OPT
