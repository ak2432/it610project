# Use the official Ubuntu base image from Docker Hub
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install required software
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update && apt-get install -y \
    apache2 \
    php7.4 \
    php7.4-mysql \
    mysql-client \
    && apt-get clean

# Expose port 80 for Apache
EXPOSE 80

# Copy the SQL script into the container
COPY setup.sql /docker-entrypoint-initdb.d/setup.sql

# Copy MySQL configuration file to grant privileges
COPY mysql-init.sql /docker-entrypoint-initdb.d/mysql-init.sql

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]

