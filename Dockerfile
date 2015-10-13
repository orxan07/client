FROM alpine:latest

RUN apk add --update nginx=1.8.0-r1 && \
    rm -rf /var/cache/apk/* && \
    chown -R nginx:www-data /var/lib/nginx
    
RUN apk add --update nodejs=0.12.2-r0 git python make && \
    rm -rf /var/cache/apk/* && \
    npm install -g npm

# Copy angular files
COPY . /usr/share/nginx
RUN rm -v /etc/nginx/nginx.conf
ADD ./nginx.conf /etc/nginx/



WORKDIR /usr/share/nginx

RUN npm install

# Open port and start nginx
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
