
### Bitwarden

```
https://docs.docker.com/engine/install/ubuntu/


docker pull vaultwarden/server:1.30.5

```


### Sync to cloudflare


```
# https://rclone.org/install/

apt install -y unzip

curl https://rclone.org/install.sh | sudo bash

```

```
# ~/.config/rclone/rclone.conf
[cf]
type = s3
provider = Cloudflare
access_key_id = abc123
secret_access_key = xyz456
endpoint = https://<accountid>.r2.cloudflarestorage.com
acl = private

```


```
rclone sync /root/bitwarden/data/db.sqlite3 cf:bitwarden/
```

```
crontab -e



0 3 * * * /usr/bin/rclone sync /root/bitwarden/data/db.sqlite3 cf:bitwarden/
```

