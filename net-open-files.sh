#!/bin/sh
# script provided by noah to use when ion is still attached to stale banneker handle
for x in /proc/*/fd/* /proc/*/cwd /proc/*/exe; do
    F=`readlink "$x" | grep ^/net`
    [ -n "$F" ] && echo "$x $F"
done

