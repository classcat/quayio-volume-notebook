FROM ubuntu:trusty
MAINTAINER ClassCat Co.,Ltd. <support@classcat.com>

########################################################################
# ClassCat/Volume-Notebook Dockerfile
#   Maintained by ClassCat Co.,Ltd ( http://www.classcat.com/ )
########################################################################

#--- HISTORY -----------------------------------------------------------
# 04-sep-15 : fixed.
#-----------------------------------------------------------------------

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y language-pack-en language-pack-en-base \
  && apt-get install -y language-pack-ja language-pack-ja-base \
  && update-locale LANG="en_US.UTF-8" \
  && apt-get install -y openssh-server \
  && mkdir -p /var/run/sshd \
  && sed -i.bak -e "s/^PermitRootLogin\s*.*$/PermitRootLogin yes/" /etc/ssh/sshd_config

VOLUME /root/notebook

WORKDIR /opt
COPY assets/cc-init.sh /opt/cc-init.sh

#EXPOSE 22 80

CMD /opt/cc-init.sh; /usr/sbin/sshd -D


### End of Dockerfile ###
