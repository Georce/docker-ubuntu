FROM index.alauda.cn/library/ubuntu:trusty-20150427
MAINTAINER sameer@damagehead.com

# Change Aliyun Mirrors

RUN sed -i s@archive.ubuntu.com@mirrors.aliyun.com@g /etc/apt/sources.list

RUN echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
 && apt-get update \
 && apt-get install -y vim.tiny wget sudo net-tools ca-certificates unzip \
 && rm -rf /var/lib/apt/lists/* # 20150504x

# Change timezone to Shanghai
RUN \cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
