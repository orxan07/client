FROM smebberson/alpine-nginx:1.0.0

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
