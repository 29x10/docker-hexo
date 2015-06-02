FROM binlei/node:iojs-v2.0.0

MAINTAINER BINLEI XUE

RUN apt-get update \
 && apt-get install -y nginx \
 && rm -rf /var/lib/apt/lists/*

COPY config/default /etc/nginx/sites-available/default

RUN service nginx restart

RUN npm install hexo-cli -g

RUN hexo init /root/blog

RUN bash -c "rm -rf /root/blog/source/*"

COPY config/_config.yml /root/blog/_config.yml

COPY source /root/blog/source/

WORKDIR /root/blog

RUN npm install

RUN hexo generate

EXPOSE 80