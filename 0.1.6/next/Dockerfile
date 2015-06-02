FROM binlei/hexo:0.1.6

RUN git clone -b v0.4.0 https://github.com/iissnan/hexo-theme-next themes/next

RUN sed -i -e 's/\#scheme/scheme/g' themes/next/_config.yml \
 && sed -i -e 's/\/tags/\/tags\//g' themes/next/_config.yml

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
