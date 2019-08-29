#!/bin/bash

# 阿里云API操作秘钥
_ACCESS_KEY_ID=${ACCESS_KEY_ID:=""}
_ACCESS_KEY_SECRET=${ACCESS_KEY_SECRET:=""}

# 匹配域名和子域名
DOMAIN=$(echo $CERTBOT_DOMAIN | grep -oP '[^\.]+\.[^\.]+$')
CERTBOT_DOMAIN_LENGTH=$(expr length $CERTBOT_DOMAIN)
DOMAIN_LENGTH=$(expr length $DOMAIN)
if [ $(expr $CERTBOT_DOMAIN_LENGTH == $DOMAIN_LENGTH) == 1 ]; then
    RR="_acme-challenge"
else
    SUB_LENGTH=$(expr $CERTBOT_DOMAIN_LENGTH - $DOMAIN_LENGTH - 1)
    RR="_acme-challenge."$(expr substr $CERTBOT_DOMAIN 1 $SUB_LENGTH)
fi

# 调用阿里云接口
RESULT=$(/path/to/dns/certbot-dns-aliyun -action create -id $_ACCESS_KEY_ID -secret $_ACCESS_KEY_SECRET -domain $DOMAIN -rr $RR -value $CERTBOT_VALIDATION)
STATUS=$(echo $RESULT | cut -d":" -f1)
if [ $STATUS == "ok" ]; then
    # 保存记录ID
    if [ ! -d /tmp/CERTBOT_$CERTBOT_DOMAIN ]; then
        mkdir -m 0700 /tmp/CERTBOT_$CERTBOT_DOMAIN
    fi
    RECORD_ID=$(echo $RESULT | cut -d":" -f2)
    echo $RECORD_ID >/tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID
    # 等待10分钟，阿里云dns缓存刷新
    sleep ${REFRESH_SLEEP:="600"}
else
    echo $RESULT
fi
