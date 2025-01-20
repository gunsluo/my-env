#!/bin/sh

nohup ssserver -c /etc/shadowsocks-rust/config.json &
>/dev/null
