-- init.sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

INSERT INTO users (username, password) VALUES ('admin', 'password123'), ('guest', 'guest123');

-- Create a vulnerable table for SQL injection
CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

INSERT INTO items (name, price) VALUES ('Widget', 19.99), ('Gadget', 29.99);

-- Create a user with a weak password and excessive privileges
CREATE USER weakuser WITH PASSWORD 'weakpassword';
GRANT ALL PRIVILEGES ON DATABASE mock_database TO weakuser;

