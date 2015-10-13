FROM smebberson/alpine-nginx:1.0.0

# Copy angular files
COPY . /usr/share/nginx
RUN rm -v /etc/nginx/nginx.conf
ADD ./nginx.conf /etc/nginx/

# Installation
RUN apk add --update nodejs=0.12.2-r0 git python make && \
    rm -rf /var/cache/apk/* && \
    npm install -g npm

WORKDIR /usr/share/nginx

RUN npm cache clean
RUN npm install

# Open port and start nginx
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
