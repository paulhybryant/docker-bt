ARG ARCH=docker.io
FROM ${ARCH}/ubuntu:20.04
ARG ARCH

LABEL maintainer="paulhybryant@gmail.com"

COPY hooks/qemu-aarch64-static /usr/bin/

RUN apt-get update && apt-get install -y wget && wget -O install.sh http://download.bt.cn/install/install-ubuntu_6.0.sh && echo 'y' | bash install.sh
RUN rm -f /www/server/panel/data/admin_path.pl

EXPOSE 8888

COPY entrypoint.sh /usr/bin/
ENTRYPOINT ["/usr/bin/entrypoint.sh"]
