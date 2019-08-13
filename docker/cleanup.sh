#!/bin/bash

# 阿里云API操作秘钥
ACCESS_KEY_ID=""
ACCESS_KEY_SECRET=""

# 删除记录文件
if [ -f /tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID ]; then
    RECORD_ID=$(cat /tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID)
    rm -f /tmp/CERTBOT_$CERTBOT_DOMAIN/RECORD_ID

    # 调用阿里云接口
    ./certbot-dns-aliyun -action delete -id $ACCESS_KEY_ID -secret $ACCESS_KEY_SECRET -record $RECORD_ID
fi
