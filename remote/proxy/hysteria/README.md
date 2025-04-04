# Install

```
./install.sh

# modify password
# vi /etc/hysteria/config.yaml

# copy blog to /usr/share/nginx/html/

# cert
iptables -A INPUT -p udp --dport 443 -j ACCEPT

rc-service hysteria start
# rc-service hysteria stop
```

```
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p udp --dport 443 -j ACCEPT
iptables -D INPUT -p tcp --dport 443 -j ACCEPT
iptables -D INPUT -p udp --dport 443 -j ACCEPT

iptables -L -v -n

```
