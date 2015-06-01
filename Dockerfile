FROM ubuntu:trusty

COPY assets/ /root/assets/

RUN apt-get update \
 && apt-get install -y curl ca-certificates nginx \
 && curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash \
 && bash -c ". /root/.nvm/nvm.sh && nvm install iojs-v2.0.0 && nvm use iojs-v2.0.0 && nvm alias default iojs-v2.0.0 && ln -s /root/.nvm/versions/io.js/v2.0.0/bin/node /usr/local/bin/node && ln -s /root/.nvm/versions/io.js/v2.0.0/bin/npm /usr/local/bin/npm" \
 && npm install hexo-cli -g \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN hexo init blog
WORKDIR /root/blog

RUN npm install

EXPOSE 4000

CMD ["hexo", "server"]