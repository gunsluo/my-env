# Introduce


### System


```
apt update
apt install -y ufw

ufw status
ufw enable
ufw allow ssh
ufw allow 80
ufw allow 443
ufw allow 27756
ufw allow 33689

apt install -y vim telnet

iptables -L
```


### Shadowrocket 

```
wget https://github.com/shadowsocks/go-shadowsocks2/releases/download/v0.1.5/shadowsocks2-linux.tgz

tar zxvf shadowsocks2-linux.tgz
mv shadowsocks2-linux shadowsocks2
```


### Xray


**https://github.com/XTLS/Xray-install**
```
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u root

system status xray
```


### Trojan

```
wget https://github.com/p4gefau1t/trojan-go/releases/download/v0.10.6/trojan-go-linux-amd64.zip

unzip trojan-go-linux-amd64.zip
cp example/server.json config.json
```


### Cert

```
curl https://get.acme.sh | sh -s email=gunsluo@gmail.com

apt install -y socat

acme.sh --register-account -m gunsluo@gmail.com
ufw allow 80

acme.sh --set-default-ca --server letsencrypt
acme.sh --issue --standalone -d luojis.com -k ec-256
```

### Warp

```
wget git.io/warp.sh
bash warp.sh proxy
bash warp.sh status
```


