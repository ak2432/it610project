# Use the official Ubuntu base image from Docker Hub
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install required software
RUN apt-get update && \
    apt-get install -y \
        software-properties-common \
        && add-apt-repository ppa:ondrej/php \
        && apt-get update && apt-get install -y \
        apache2 \
        php7.4 \
        php7.4-mysql \
        mysql-server \
        mysql-client \
        && apt-get clean

# Expose ports for Apache and MySQL
EXPOSE 80
EXPOSE 3306

# Copy the SQL scripts into the container
COPY setup.sql /docker-entrypoint-initdb.d/setup.sql

# Start MySQL server and run setup.sql during container startup
CMD service mysql start && mysql -u root < /docker-entrypoint-initdb.d/setup.sql && /usr/sbin/apache2ctl -D FOREGROUND
