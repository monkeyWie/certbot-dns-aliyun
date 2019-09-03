## certbot 阿里云dns插件
用于阿里云上域名的certbot自动续签证书。

### 编译
```shell
bash build.sh
```

### 运行
```shell
certbot-dns-aliyun.exe -h
Usage of certbot-dns-aliyun.exe:
  -action string
        create or delete
  -domain string
        create domain
  -id string
        accessKeyId
  -record string
        delete recordId
  -region string
        regionId
  -rr string
        create RR
  -secret string
        accessSecret
  -value string
        create value
```

### docker
```
cp certbot-dns-aliyun ./docker
cd docker
docker build -t cert:latest .

docker run \
-e ACCESS_KEY_ID=*** \
-e ACCESS_KEY_SECRET=*** \
--name cert \
-itd certbot-aliyun:latest /bin/bash
```