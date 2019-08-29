FROM debian:9
RUN apt-get update && apt-get install -y certbot vim
ADD ./authenticator.sh /path/to/dns/
ADD ./cleanup.sh /path/to/dns/
ADD ./certbot-dns-aliyun /path/to/dns/
RUN chmod +x /path/to/dns/*