FROM nginx

# Download packages
RUN apt-get update
RUN apt-get install -y curl vim

# Copy angular files
COPY . /usr/share/nginx
COPY ./conf /etc/nginx/sites-enabled/conf
COPY ./conf /etc/nginx/sites-available/conf

# Installation
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs

RUN apt-get clean

WORKDIR /usr/share/nginx
RUN npm install npm -g

RUN npm cache clean
RUN npm install


# Open port and start nginx
EXPOSE 3000
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
