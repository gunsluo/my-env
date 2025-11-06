# alpine

```
docker buildx build --platform=linux/amd64 -t alpine:routeros -f Dockerfile .

docker save -o alpine.tar alpine:routeros
tar -tf alpine.tar | head -n 20

gzip alpine.tar
tar -tzf alpine.tar.gz | grep -E "(manifest.json|index.json)"

docker rmi alpine:routeros
```


## RouterOS Setup

Before the first time runs:

```
/interface/veth/add name=container-alpine address=10.10.10.10/24,fd00:1::10/64 gateway=10.10.10.1 gateway6=fd00:1::1
/interface/bridge/port add bridge=bridge-containers interface=container-alpine
/container/mounts/add name=container-mounts src=containers/mounts dst=/mnt/container-mounts
```

## Create the container:

### alpine
```
/container/add file=alpine.tar.gz interface=container-alpine root-dir=containers/root-dirs/alpine mounts=container-mounts start-on-boot=yes

/container/start 0
```

### Tailscale

```
/container/add file=tailscale.tar.gz interface=container-tailscale root-dir=containers/root-dirs/tailscale mounts=tailscale-state start-on-boot=yes logging=yes
```

## Login

First enter the shell of the tailscale container:

```
/container/shell number=x

tailscale up --accept-routes --advertise-routes 192.168.100.0/24,10.10.10.0/24
```

### sing-box

```
/container/add file=sing-box.tar.gz interface=container-sing-box root-dir=containers/root-dirs/sing-box mounts=sing-box-conf start-on-boot=yes logging=yes
```


## Change the login shell to Fish

Edit `/etc/passwd` after launched the container.
