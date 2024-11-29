-- Crear la base de datos
CREATE DATABASE NombreDeLaBaseDeDatos;

-- Usar la base de datos recién creada
USE NombreDeLaBaseDeDatos;


-- Tabla de usuarios
CREATE TABLE Users (
    id INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    password VARCHAR(255),
    email VARCHAR(100)
);

-- Tabla de direcciones
CREATE TABLE Addresses (
    id INT PRIMARY KEY,
    user_id INT,
    country VARCHAR(50),
    state VARCHAR(50),
    city VARCHAR(50),
    address1 VARCHAR(100),
    address2 VARCHAR(100),
    zip VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Tabla de métodos de pago
CREATE TABLE Payment_Methods (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Tabla de órdenes
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    timestamp DATETIME,
    payment_method_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (payment_method_id) REFERENCES Payment_Methods(id)
);

-- Tabla de productos
CREATE TABLE Products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock INT,
    category_id INT
);

-- Tabla de categorías
CREATE TABLE Categories (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Tabla de detalles de productos en las órdenes
CREATE TABLE Product_Details (
    order_id INT,
    product_id INT,
    count INT,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id),
    PRIMARY KEY (order_id, product_id)
);

-- Relaciones adicionales
ALTER TABLE Products
ADD FOREIGN KEY (category_id) REFERENCES Categories(id);


-- Insertar datos en la tabla Users
INSERT INTO Users (id, firstname, lastname, password, email) VALUES
(1, 'John', 'Doe', 'password123', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'password456', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', 'password789', 'alice.johnson@example.com');

-- Insertar datos en la tabla Addresses
INSERT INTO Addresses (id, user_id, country, state, city, address1, address2, zip) VALUES
(1, 1, 'USA', 'California', 'Los Angeles', '123 Main St', 'Apt 4', '90001'),
(2, 2, 'USA', 'New York', 'New York City', '456 Broadway', 'Floor 2', '10001'),
(3, 3, 'USA', 'Texas', 'Dallas', '789 Elm St', '', '75201');

-- Insertar datos en la tabla Payment_Methods
INSERT INTO Payment_Methods (id, name) VALUES
(1, 'Credit Card'),
(2, 'PayPal'),
(3, 'Bank Transfer');

-- Insertar datos en la tabla Orders
INSERT INTO Orders (id, user_id, timestamp, payment_method_id) VALUES
(1, 1, '2024-11-12 10:00:00', 1),
(2, 2, '2024-11-12 11:00:00', 2),
(3, 3, '2024-11-12 12:00:00', 3);

-- Insertar datos en la tabla Products
INSERT INTO Products (id, name, description, price, stock, category_id) VALUES
(1, 'Laptop', 'High-performance laptop', 999.99, 50, 1),
(2, 'Smartphone', 'Latest model smartphone', 699.99, 100, 2),
(3, 'Headphones', 'Noise-cancelling headphones', 199.99, 200, 3);

-- Insertar datos en la tabla Categories
INSERT INTO Categories (id, name) VALUES
(1, 'Electronics'),
(2, 'Mobile Devices'),
(3, 'Accessories');

-- Insertar datos en la tabla Product_Details
INSERT INTO Product_Details (order_id, product_id, count) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

