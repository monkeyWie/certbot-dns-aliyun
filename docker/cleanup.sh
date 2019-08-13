#!/bin/bash

# 阿里云API操作秘钥
_ACCESS_KEY_ID=${ACCESS_KEY_ID:=""}
_ACCESS_KEY_SECRET=${ACCESS_KEY_SECRET:=""}

# 删除记录文件
if [ -f /tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID ]; then
    RECORD_ID=$(cat /tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID)
    rm -f /tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID

    # 调用阿里云接口
    /path/to/dns/certbot-dns-aliyun -action delete -id $_ACCESS_KEY_ID -secret $_ACCESS_KEY_SECRET -record $RECORD_ID
fi
