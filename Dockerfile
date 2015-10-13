FROM smebberson/alpine-nginx:1.0.0

# Download packages
RUN apt-get update
RUN apt-get install -y curl vim

# Copy angular files
COPY . /usr/share/nginx
RUN rm -v /etc/nginx/nginx.conf
ADD ./nginx.conf /etc/nginx/

# Installation
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs
RUN apt-get clean

WORKDIR /usr/share/nginx

RUN npm cache clean
RUN npm install

# Open port and start nginx
EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
