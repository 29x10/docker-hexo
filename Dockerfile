FROM binlei/node:iojs-v2.0.0

MAINTAINER BINLEI XUE

RUN apt-get update \
 && apt-get install -y nginx \
 && rm -rf /var/lib/apt/lists/*

COPY config/default /etc/nginx/sites-available/default

RUN npm install hexo-cli -g

RUN hexo init /usr/src/blog

RUN bash -c "rm -rf /usr/src/blog/source/*"

COPY config/_config.yml /usr/src/blog/_config.yml

COPY source /usr/src/blog/source/

WORKDIR /usr/src/blog

RUN npm install

RUN hexo generate

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]