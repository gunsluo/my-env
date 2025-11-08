# Tailscale

The easiest, most secure way to use WireGuard and 2FA.

## RouterOS Setup

Before the first time runs:

```
/interface/veth/add name=container-tailscale address=10.10.10.45/24,fd00:1::45/64 gateway=10.10.10.1 gateway6=fd00:1::1
/interface/bridge/port add bridge=bridge-containers interface=container-tailscale
/container/mounts/add name=tailscale-state src=containers/mounts/tailscale-state dst=/var/lib/tailscale
```

Setup port forwarding:

```
/ip/firewall/nat/add chain=dstnat action=dst-nat in-interface-list=WAN protocol=udp dst-port=16384 to-addresses=10.10.10.45 comment="Tailscale port forwarding"
/ipv6/firewall/nat/add chain=dstnat action=dst-nat in-interface-list=WAN protocol=udp dst-port=16384 to-address=fd00::45 comment="Tailscale port forwarding"
```

Add Tailscale network to the route:

```
/ip/route/add dst-address=100.64.0.0/10 gateway=10.10.10.45 comment="Tailscale network"
```

Add other Tailscale subnets as well:

```
/ip/route/add dst-address=192.168.50.0/24 gateway=10.10.10.45 comment="Tailscale subnet"
```

......


## Create the container:

Before creating the container, make sure configuration files are uploaded to the RouterOS.

```
/container/add file=tailscale.tar.gz interface=container-tailscale root-dir=containers/root-dirs/tailscale mounts=tailscale-state start-on-boot=yes logging=yes
```

## Login

First enter the shell of the tailscale container:

```
/container/shell number=x
```

Then run:

```
tailscale up --accept-routes --advertise-routes 192.168.88.0/24,10.10.10.0/24
tailscale set --accept-routes --advertise-routes 192.168.88.0/24,10.10.10.0/24
```
