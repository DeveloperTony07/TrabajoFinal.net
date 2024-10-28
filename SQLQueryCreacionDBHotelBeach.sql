-- Crear la base de datos HotelBeachSA
CREATE DATABASE HotelBeachSA;

-- Utilizar la base de datos recién creada
USE HotelBeachSA;

-- Crear tabla para los Clientes
CREATE TABLE Clients (
    IdentificationCard NVARCHAR(30) PRIMARY KEY NOT NULL,
	FullName NVARCHAR(150) NOT NULL,
    TypeID NVARCHAR(30) NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    PhoneNumber NVARCHAR(30) NOT NULL,
    LocationAddress NVARCHAR(150) NOT NULL
);


-- Crear tabla para los Paquetes
CREATE TABLE Packages (
    Id INT PRIMARY KEY IDENTITY,
    PackageType NVARCHAR(30) NOT NULL,
    Price DECIMAL(38, 2) NOT NULL,
    Bonus DECIMAL(38, 2) NOT NULL,
    MonthlyPayments INT NOT NULL,
    MonthyPaymentsPrice DECIMAL(38, 2) NOT NULL
);


-- Crear tabla para los Administradores
CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(150) NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    Role NVARCHAR(30) NOT NULL
);

-- Crear la tabla Reservations
CREATE TABLE Reservations (
    Id INT PRIMARY KEY,
    IdCardClient NVARCHAR(30) FOREIGN KEY REFERENCES Clients(IdentificationCard),
    IdPackage INT FOREIGN KEY REFERENCES Packages(Id),
    ClientName NVARCHAR(150),
    TypeIdClient NVARCHAR(30),
    ClientEmail NVARCHAR(150),
    PackageName NVARCHAR(30),
    AmountPeople INT,
    AmountDays INT,
    AdmissionDate DATETIME,
    DepurateDay DATETIME,
    PaymentType NVARCHAR(50),
    Discount DECIMAL,
    Iva DECIMAL,
    Total DECIMAL,
    DiscountColones DECIMAL,
    IvaColones DECIMAL,
    TotalColones DECIMAL,
    CheckNumber NVARCHAR(50),
    NameBank NVARCHAR(150)
);

-- Agregar nuevas columnas a la tabla 'Reservations'
ALTER TABLE Reservations
ADD TotalColones DECIMAL(38, 2) NOT NULL DEFAULT 0.00,
    IvaColones DECIMAL(38, 2) NOT NULL DEFAULT 0.00,
    DiscountColones DECIMAL(38, 2) NOT NULL DEFAULT 0.00;


SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Reservations';

SELECT * FROM INFORMATION_SCHEMA.TABLE_PRIVILEGES WHERE TABLE_NAME = 'Reservations';

USE HotelBeachSA;

EXEC sp_rename 'Reservations.TotalColonesDP', 'TotalColones', 'COLUMN';

ALTER TABLE Reservations
ADD clientEmail NVARCHAR(100) Not Null DEFAULT 'correodf@gmail.com';

-- Eliminar la restricción DEFAULT de la columna 'clientEmail' en la tabla 'Reservations'
ALTER TABLE Reservations
ALTER COLUMN clientEmail NVARCHAR(100);

-- Insertar datos de los Paquetes
INSERT INTO Packages (PackageType, Price, Bonus, MonthlyPayments, MonthyPaymentsPrice)
VALUES
    ('Todo incluido', 450.00, 45.00, 24, (450.00 * 0.45) / 24),
    ('Alimentación', 275.00, 35.00, 18, (275.00 * 0.35) / 18),
    ('Hospedaje', 210.00, 15.00, 12, (210.00 * 0.15) / 12);

	select * from Reservations
	select * from Clients
	select * from Packages
