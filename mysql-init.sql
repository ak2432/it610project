-- Grant privileges to create roles and users
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '';
FLUSH PRIVILEGES;
