FROM debian:9
RUN echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib\n\
    deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib\n\
    deb http://mirrors.163.com/debian/ stretch-backports main non-free contrib\n\
    deb-src http://mirrors.163.com/debian/ stretch main non-free contrib\n\
    deb-src http://mirrors.163.com/debian/ stretch-updates main non-free contrib\n\
    deb-src http://mirrors.163.com/debian/ stretch-backports main non-free contrib\n\
    deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib\n\
    deb-src http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' > /etc/apt/sources.list
RUN apt-get update && apt-get install -y certbot
COPY ./authenticator.sh /path/to/dns/
COPY ./cleanup.sh /path/to/dns/
COPY ./certbot-aliyun /path/to/dns/
COPY create.sh .
COPY renew.sh .
RUN chmod +x /path/to/dns/* create.sh renew.sh
CMD ["/bin/bash"]