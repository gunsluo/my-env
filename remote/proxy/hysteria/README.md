# Install

```
./install.sh

# modify password
# vi /etc/hysteria/config.yaml
# copy blog to /usr/share/nginx/html/
rc-service hysteria start
# rc-service hysteria stop
```

```
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

iptables -D INPUT -p tcp --dport 80 -j ACCEPT
iptables -D INPUT -p tcp --dport 443 -j ACCEPT

iptables -L -v -n


# 端口跳跃
iptables -t nat -A PREROUTING -i eth0 -p udp --dport 37001:39999 -j DNAT --to-destination :443
ip6tables -t nat -A PREROUTING -i eth0 -p udp --dport 37001:39999 -j DNAT --to-destination :443


iptables -t nat -D PREROUTING -i eth0 -p udp --dport 37001:39999 -j DNAT --to-destination :443
ip6tables -t nat -D PREROUTING -i eth0 -p udp --dport 37001:39999 -j DNAT --to-destination :443
```
