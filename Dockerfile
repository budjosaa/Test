FROM  nginx
RUN  rm /usr/share/nginx/html/index.html
COPY ./html/index.html /usr/share/nginx/html/

