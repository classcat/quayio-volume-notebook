FROM ubuntu:trusty
MAINTAINER ClassCat Co.,Ltd. <support@classcat.com>

########################################################################
# ClassCat/Volume-Notebook:Simple Dockerfile
#   Maintained by ClassCat Co.,Ltd ( http://www.classcat.com/ )
########################################################################

#--- HISTORY -----------------------------------------------------------
# 06-sep-15 : tag "simple" : removed ssh
# 04-sep-15 : fixed.
#-----------------------------------------------------------------------

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y language-pack-en language-pack-en-base \
  && apt-get install -y language-pack-ja language-pack-ja-base \
  && update-locale LANG="en_US.UTF-8"

VOLUME /root/notebook

WORKDIR /root/notebook

ENTRYPOINT /usr/bin/tail -F /dev/null


### End of Dockerfile ###
