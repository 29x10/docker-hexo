FROM ubuntu:trusty

COPY assets/ /root/assets/

RUN apt-get update \
 && apt-get install -y curl ca-certificates nginx \
 && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash \
 && bash -c ". /root/.nvm/nvm.sh && nvm install iojs-v2.0.0"
 && rm -rf /var/lib/apt/lists/*

ENV /root/.nvm/versions/io.js/v2.0.0/bin:$PATH

RUN npm install hexo-cli -g 

WORKDIR /root

RUN hexo init blog
WORKDIR /root/blog

RUN npm install

EXPOSE 4000

CMD ["hexo", "server"]