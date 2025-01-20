
```
wget https://github.com/shadowsocks/shadowsocks-rust/releases/download/v1.22.0/shadowsocks-v1.22.0.x86_64-unknown-linux-musl.tar.xz

tar -xf shadowsocks-v1.22.0.x86_64-unknown-linux-musl.tar.xz

mv * /usr/local/bin/
```

```
iptables -A INPUT -p tcp --dport 33689 -j ACCEPT

iptables -L -v -n

mkdir -p /etc/shadowsocks-rust
```
