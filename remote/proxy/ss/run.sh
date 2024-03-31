#!/bin/bash

nohup /root/proxy/ss/shadowsocks2 -s 'ss://chacha20-ietf-poly1305:password@[0.0.0.0]:33689' -verbose & > /dev/null
