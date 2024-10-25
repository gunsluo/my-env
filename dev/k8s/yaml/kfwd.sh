#! /bin/sh

# ifconfig en0 alias 10.0.0.52 255.255.255.0
ifconfig en0 alias 10.0.0.52 netmask 0xFFFFFFFF up
ifconfig en0 alias 10.0.0.53 netmask 0xFFFFFFFF up
