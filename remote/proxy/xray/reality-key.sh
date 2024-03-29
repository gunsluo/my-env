

```
xray uuid
xray x25519


nerdctl run --rm -it teddysun/xray:1.8.1 xray uuid
nerdctl run --rm -it teddysun/xray:1.8.1 xray x25519

iptables -L
iptables -A INPUT -p tcp --dport 33443 -j ACCEPT
iptables -D INPUT -p tcp --dport 33443 -j ACCEPT
```
