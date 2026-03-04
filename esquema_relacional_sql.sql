-- criação do banco de dados para o cenário de Oficina Mecânica
-- drop database workshop_mechanics;
create database workshop_mechanics;
use workshop_mechanics;

CREATE TABLE customers (
    id_customer INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    address VARCHAR(150)
);

CREATE TABLE vehicles (
    id_vehicle INT PRIMARY KEY AUTO_INCREMENT,
    plate VARCHAR(10) NOT NULL UNIQUE,
    model VARCHAR(50),
    brand VARCHAR(50),
    year YEAR,
    id_customer INT,
    FOREIGN KEY (id_customer) REFERENCES customers(id_customer)
);

CREATE TABLE mechanics (
    id_mechanic INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100),
    salary DECIMAL(10,2),
    phone VARCHAR(20)
);

CREATE TABLE service_orders (
    id_service_order INT PRIMARY KEY AUTO_INCREMENT,
    open_date DATE NOT NULL,
    status VARCHAR(30),
    total_value DECIMAL(10,2),
    id_vehicle INT,
    id_mechanic INT,
    FOREIGN KEY (id_vehicle) REFERENCES vehicles(id_vehicle),
    FOREIGN KEY (id_mechanic) REFERENCES mechanics(id_mechanic)
);

CREATE TABLE services (
    id_service INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(150) NOT NULL,
    labor_cost DECIMAL(10,2) NOT NULL
);

CREATE TABLE parts (
    id_part INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(150) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT
);

CREATE TABLE payments (
    id_payment INT PRIMARY KEY AUTO_INCREMENT,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(30),
    id_service_order INT,
    FOREIGN KEY (id_service_order) REFERENCES service_orders(id_service_order)
);

CREATE TABLE service_order_services (
    id_service_order INT,
    id_service INT,
    quantity INT DEFAULT 1,
    PRIMARY KEY (id_service_order, id_service),
    FOREIGN KEY (id_service_order) REFERENCES service_orders(id_service_order),
    FOREIGN KEY (id_service) REFERENCES services(id_service)
);

CREATE TABLE service_order_parts (
    id_service_order INT,
    id_part INT,
    quantity INT NOT NULL,
    PRIMARY KEY (id_service_order, id_part),
    FOREIGN KEY (id_service_order) REFERENCES service_orders(id_service_order),
    FOREIGN KEY (id_part) REFERENCES parts(id_part)
);

show tables;
