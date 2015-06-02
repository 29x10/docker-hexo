FROM binlei/node:iojs-v2.0.0

MAINTAINER BINLEI XUE

RUN apt-get update \
 && apt-get install -y nginx git \
 && rm -rf /var/lib/apt/lists/*

COPY config/default /etc/nginx/sites-available/default

RUN npm install hexo-cli -g

RUN hexo init /usr/src/blog

RUN bash -c "rm -rf /usr/src/blog/source/*"

COPY config/_config.yml /usr/src/blog/_config.yml

COPY source /usr/src/blog/source/

WORKDIR /usr/src/blog

RUN npm install

RUN git clone -b v0.4.0 https://github.com/iissnan/hexo-theme-next themes/next

RUN sed 's/#scheme/scheme/g' themes/next/_config.yml

RUN hexo generate

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]