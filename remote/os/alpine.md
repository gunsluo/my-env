# Install

```
https://wiki.alpinelinux.org/wiki/Replacing_non-Alpine_Linux_with_Alpine_remotely
```

```
wget https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/x86_64/alpine-virt-3.21.2-x86_64.iso

dd if=alpine-virt-3.21.2-x86_64.iso of=/dev/vda
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
apk add iptables

iptables -L -v -n

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -P INPUT DROP
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

rc-service iptables save
rc-service iptables start
```
