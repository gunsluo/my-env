# sing-box

The universal proxy platform.

## RouterOS Setup

Before the first time runs:

```
/interface/veth/add name=container-sing-box address=10.10.10.56/24,fd00:1::56/64 gateway=10.10.10.1 gateway6=fd00:1::1
/interface/bridge/port add bridge=bridge-containers interface=container-sing-box
/container/mounts/add name=sing-box-conf src=containers/mounts/sing-box-conf dst=/etc/sing-box
```

Setup RouterOS sockify:

```
/ip/firewall/address-list/add list="Fuck GFW" address=<IP of the client that need to be proxied>
/ip/socksify/add name=sing-box port=952 socks5-server=10.10.10.56 socks5-port=1080
/ip/firewall/filter/add chain=input dst-port=952 protocol=tcp src-address-list="Fuck GFW" action=accept comment="Allow sockify for Fuck GFW devices"
/ip/firewall/nat/add chain=srcnat src-address-list="Fuck GFW" protocol=udp dst-port=53 action
=masquerade comment="Masquerade DNS queries for Fuck GFW devices"
/ip/firewall/nat/add chain=dstnat src-address-list=proxy protocol=udp dst-port=53 action=dst-nat to-addresses=10.10.10.56 comment="Hijack DNS for Fuck GFW devices"
/ip/firewall/nat add chain=dstnat src-address-list="Fuck GFW" protocol=tcp action=socksify socksify-service=sing-box comment="Sockify service for Fuck GFW devices"
```

## Create the container:

Before creating the container, make sure configuration files are uploaded to the RouterOS.

```
/container/add file=sing-box.tar.gz interface=container-sing-box root-dir=containers/root-dirs/sing-box mounts=sing-box-conf start-on-boot=yes logging=yes
```
