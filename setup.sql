-- Create the database and select it
CREATE DATABASE fraud_detection;
USE fraud_detection;

-- Create roles
CREATE ROLE branch_admin;
CREATE ROLE customer_service_rep;
CREATE ROLE bank_teller;

-- Create the 'Roles' table
CREATE TABLE Roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(255) NOT NULL
);

-- Insert records into the 'Roles' table
INSERT INTO Roles (RoleName) VALUES
    ('Branch Administrator'),
    ('Customer Service Rep'),
    ('Bank Teller');

-- Create the 'Users' table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(255) NOT NULL,
    RoleID INT NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- Insert records into the 'Users' table
INSERT INTO Users (Username, RoleID) VALUES
    ('user1', 1), -- Assign to Branch Administrator role
    ('user2', 2), -- Assign to Customer Service Rep role
    ('user3', 3); -- Assign to Bank Teller role

-- Grant permissions to roles
-- Branch Administrators have full permissions
GRANT ALL PRIVILEGES ON fraud_detection.* TO branch_admin;

-- Customer Service Reps and Bank Tellers can add and view data
GRANT INSERT, SELECT ON fraud_detection.* TO customer_service_rep;
GRANT INSERT, SELECT ON fraud_detection.* TO bank_teller;

-- Flush privileges
FLUSH PRIVILEGES;
