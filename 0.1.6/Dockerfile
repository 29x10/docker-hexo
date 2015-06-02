FROM iojs:2.2.1

MAINTAINER BINLEI XUE

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.9.1-1~jessie

RUN apt-get update && \
    apt-get install -y ca-certificates nginx=${NGINX_VERSION} && \
	    rm -rf /var/lib/apt/lists/*

ENV HEXO_CLI_VERSION 0.1.6

RUN npm install hexo-cli@${HEXO_CLI_VERSION} -g

ENV HEXO_DIR /usr/src/hexo

RUN hexo init ${HEXO_DIR}

WORKDIR ${HEXO_DIR}

RUN npm install

CMD ["nginx", "-g", "daemon off;"]
