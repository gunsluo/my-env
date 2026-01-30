# Install

```
https://wiki.alpinelinux.org/wiki/Replacing_non-Alpine_Linux_with_Alpine_remotely
```

```
wget https://dl-cdn.alpinelinux.org/alpine/v3.23/releases/x86_64/alpine-virt-3.23.2-x86_64.iso

dd if=alpine-virt-3.23.2-x86_64.iso of=/dev/vda
```

**Reboot, and login again from vnc with root.**
```
mkdir /media/setup
cp -a /media/vda/* /media/setup

mkdir /lib/setup
cp -a /.modloop/* /lib/setup

rc-service modloop stop
umount /dev/vda

mv /media/setup/* /media/vda/
mv /lib/setup/* /.modloop/


setup-alpine
```

```
-- using nft
-- apk add iptables

-- iptables -L -v -n

-- iptables -A INPUT -p tcp --dport 22 -j ACCEPT
-- iptables -P INPUT DROP
-- iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

-- rc-service iptables save
-- rc-update add iptables
-- rc-service iptables start
```

```

ZEROSSL_EAB_KID= ZEROSSL_HMAC_KEY= ./system.sh
# modify password
vi /etc/shadowsocks/config.json
rc-service shadowsocks start

# modify config
vi /etc/sing-box/config.json
rc-service sing-box start

# modify config
vi /etc/hysteria/config.json
rc-service hysteria start
```
