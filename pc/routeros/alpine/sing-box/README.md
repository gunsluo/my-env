# Issue

1. 下载geoip失败, 修改DNS使用dns-cn. 第一次下载成功后再修改会dns-proxy
```
   "rules": [
      {
        "rule_set": "geosite-cn",
        "server": "dns-cn"
      },
      {
        "server": "dns-proxy"
      }
    ]

    ===>
   "rules": [
      {
        "rule_set": "geosite-cn",
        "server": "dns-cn"
      },
      {
        "server": "dns-dn"
      }
    ]
```
