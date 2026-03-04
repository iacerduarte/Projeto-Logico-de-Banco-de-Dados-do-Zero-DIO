use workshop_mechanics;
show tables;

INSERT INTO customers (name, phone, email, address) VALUES
('João Silva', '21999990001', 'joao@email.com', 'Rua A, 100'),
('Maria Souza', '21999990002', 'maria@email.com', 'Rua B, 200');

INSERT INTO mechanics (name, specialty, salary, phone) VALUES
('Carlos Mecânico', 'Freios', '4500', '21988880001'),
('Pedro Técnico', 'Motor', '3200', '21988880002');

INSERT INTO services (description, labor_cost) VALUES
('Troca de óleo', 80.00),
('Troca de pastilha de freio', 150.00),
('Alinhamento e balanceamento', 120.00);

INSERT INTO parts (description, unit_price, stock_quantity) VALUES
('Filtro de óleo', 35.00, 20),
('Óleo 5W30 (litro)', 45.00, 50),
('Pastilha de freio', 120.00, 15);

INSERT INTO vehicles (plate, model, brand, year, id_customer) VALUES
('ABC1234', 'Civic', 'Honda', 2018, 1),
('XYZ5678', 'Gol', 'Volkswagen', 2020, 2);

INSERT INTO service_orders (open_date, status, total_value, id_vehicle, id_mechanic) VALUES
('2026-03-01', 'Aberta', 0.00, 1, 1),
('2026-03-02', 'Concluída', 0.00, 2, 2);

INSERT INTO payments (payment_date, amount, payment_method, id_service_order) VALUES
('2026-03-02', 300.00, 'Cartão', 1),
('2026-03-03', 450.00, 'Pix', 2);

INSERT INTO service_order_services (id_service_order, id_service, quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 2, 1);

INSERT INTO service_order_parts (id_service_order, id_part, quantity) VALUES
(1, 1, 1),
(1, 2, 4),
(2, 3, 1);

SELECT * FROM customers;
SELECT * FROM mechanics;
SELECT * FROM services;
SELECT * FROM parts;
SELECT * FROM vehicles;
SELECT * FROM service_orders;
SELECT * FROM payments;
SELECT * FROM service_order_services;
SELECT * FROM service_order_parts;

-- Question: Which clients are registered?
SELECT * FROM customers;

-- Question: Which service orders are currently open?
SELECT * FROM service_orders WHERE Status = 'Aberta';

-- Question: Which service orders are currently finished?
SELECT * FROM service_orders WHERE Status = 'Concluída';

-- Question: Which mechanics have the highest salaries?
SELECT name, Salary FROM mechanics ORDER BY Salary DESC;

-- Question: Which mechanics have the highest salaries?
SELECT name, Salary FROM mechanics WHERE Salary = (SELECT MAX(Salary) FROM mechanics);

-- Which parts were used the most (total quantity > 2)?
SELECT 
    p.description AS part,
    SUM(sop.quantity) AS total_used
FROM parts p
JOIN service_order_parts sop ON p.id_part = sop.id_part
GROUP BY p.description
HAVING SUM(sop.quantity) > 2
ORDER BY total_used DESC;

-- Listar nome e telefone dos clientes
SELECT name, phone FROM customers;

-- List all vehicles
SELECT plate, model, brand, year FROM vehicles;

-- Calculate a 10% discount on the order value
SELECT id_service_order, total_value, total_value * 0.10 AS discount, total_value - (total_value * 0.10) AS final_value FROM service_orders;

-- Mechanic's annual salary
SELECT name, salary, salary * 12 AS annual_salary FROM mechanics;

-- Clients in alphabetical order
SELECT name FROM customers ORDER BY name ASC;

-- Service orders from highest to lowest value.
SELECT id_service_order, total_value FROM service_orders ORDER BY total_value DESC;
    
SELECT 
    so.id_service_order,
    m.name AS mechanic,
    so.total_value,
    p.payment_method,
    p.payment_date
FROM service_orders so
INNER JOIN mechanics m 
    ON so.id_mechanic = m.id_mechanic
INNER JOIN payments p 
    ON so.id_service_order = p.id_service_order;
    
    
