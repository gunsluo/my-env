# Install

```
https://v2.hysteria.network/zh/docs/getting-started/Server-Installation-Script/

```

```
# download 
mv hysteria-linux-amd64 hysteria

./hysteria server -c ./config.yaml

# rc-service nginx start
```


```
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

iptables -L -v -n

# 删除第5条
iptables -D INPUT 5
```
