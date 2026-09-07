FROM ubuntu:20.04

RUN apt-get update && apt-get install -y samba
RUN groupadd -r samba && useradd -r -g samba k8s
RUN (echo "password"; echo "password") |  smbpasswd -a k8s
RUN smbpasswd -e k8s
RUN mkdir  /data/
COPY smb.conf /etc/samba/smb.conf
COPY startup.sh /root/startup.sh

CMD ["/bin/bash", "-c", "/root/startup.sh"]
