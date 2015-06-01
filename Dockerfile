FROM ubuntu:trusty

COPY assets/ /root/assets/

RUN cp -f /root/assets/sources.list /etc/apt/sources.list \
 && apt-get update \
 && apt-get upgrade \
 && apt-get install -y curl ca-certificates nginx \
 && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash \
 && source /root/.nvm/nvm.sh \
 && nvm install iojs-v2.0.0 \
 && npm install hexo-cli -g \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app

WORKDIR /root

RUN hexo init blog
WORKDIR /root/blog

RUN npm install

EXPOSE 4000

CMD ["hexo", "server"]