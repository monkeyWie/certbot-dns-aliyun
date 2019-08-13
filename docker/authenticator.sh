#!/bin/bash

# 阿里云API操作秘钥
ACCESS_KEY_ID=""
ACCESS_KEY_SECRET=""

# 匹配域名和子域名
DOMAIN=$(expr match "$CERTBOT_DOMAIN" '.*\.\(.*\..*\)')
RR="_acme-challenge."$(expr match "$CERTBOT_DOMAIN" '\(.*\)\..*\..*')

# 调用阿里云接口
RESULT=$(./certbot-dns-aliyun -action create -id $ACCESS_KEY_ID -secret $ACCESS_KEY_SECRET -domain $DOMAIN -rr $RR -value $CERTBOT_VALIDATION)
STATUS=$(echo $RESULT | cut -d":" -f1)
if [ $STATUS == "ok" ]; then
    # 保存记录ID
    if [ ! -d /tmp/CERTBOT_$CERTBOT_DOMAIN ]; then
        mkdir -m 0700 /tmp/CERTBOT_$CERTBOT_DOMAIN
    fi
    RECORD_ID=$(echo $RESULT | cut -d":" -f2)
    echo $RECORD_ID >/tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID
    # 等待10分钟，阿里云dns缓存刷新
    sleep 600
else
    echo $RESULT
fi
