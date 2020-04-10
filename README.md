## certbot 阿里云dns插件
用于阿里云上域名的certbot自动续签证书。

### 编译
```shell
sh build.sh
```

### 运行
```shell
certbot-aliyun -h
Usage of certbot-aliyun:
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
#构建
cp certbot-aliyun ./docker
cd docker
docker build -t certbot-aliyun:latest .

#启动容器
docker run \
--name cert \
-itd \
-v /etc/letsencrypt:/etc/letsencrypt \
-e ACCESS_KEY_ID=XXX \
-e ACCESS_KEY_SECRET=XXX \
liwei2633/certbot-aliyun

#首次创建证书，根据命令提示输入
docker exec -it cert ./create.sh *.pdown.org

#续签
docker exec cert ./renew.sh
```