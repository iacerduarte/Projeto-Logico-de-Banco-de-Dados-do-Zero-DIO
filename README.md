# Projeto-Logico-de-Banco-de-Dados-do-Zero-DIO

This project consists of the complete logical design and implementation of a relational database for a mechanical workshop (Oficina).
The objective is to:
•	Transform a conceptual ER model into a logical relational schema
•	Define Primary Keys and Foreign Keys
•	Apply constraints and referential integrity
•	Implement the schema using SQL (DDL)
•	Insert test data (DML)
•	Develop complex SQL queries answering business questions
________________________________________
🧠 Business Context – Workshop Scenario
The system manages:
•	Customers
•	Vehicles
•	Mechanics
•	Service Orders
•	Services
•	Parts
•	Payments
________________________________________
🏗️ Logical Schema (Relational Model)
🔹 Entities & Tables
👤 clients
•	idClient (PK)
•	Fname
•	Lname
•	CPF (UNIQUE)
•	Phone

🚗 vehicles
•	idVehicle (PK)
•	Plate (UNIQUE)
•	Model
•	Brand
•	Year
•	idClient (FK)
👨‍🔧 mechanics
•	idMechanic (PK)
•	Fname
•	Specialty
•	Salary
📄 service_orders
•	idOrder (PK)
•	OpenDate
•	CloseDate
•	Status
•	idVehicle (FK)
•	idMechanic (FK)
🛠 services
•	idService (PK)
•	Description
•	LaborCost
🔩 parts
•	idPart (PK)
•	PartName
•	Price
•	StockQuantity
🔗 order_services (N:N)
•	idOrder (FK)
•	idService (FK)
•	Quantity
🔗 order_parts (N:N)
•	idOrder (FK)
•	idPart (FK)
•	Quantity
