-- Eliminando objetos si ya existen
DROP DATABASE IF EXISTS bdProyectoVentas;
CREATE DATABASE bdProyectoVentas;
USE bdProyectoVentas;

-- Tabla Marca
CREATE TABLE Marca (
  id_marca VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'MAR001'
  marca_producto VARCHAR(100),
  descripcion TEXT
);

INSERT INTO Marca (id_marca, marca_producto, descripcion) 
VALUES 
('MAR001', 'Nike', 'Marca deportiva internacional'),
('MAR002', 'Adidas', 'Marca de ropa y calzado deportivo'),
('MAR003', 'Puma', 'Marca de ropa deportiva y urbana'), 
('MAR004', 'Reebok', 'Marca deportiva para todo tipo de entrenamiento'),
('MAR005', 'New Balance', 'Marca reconocida por su calzado deportivo'),
('MAR006', 'Under Armour', 'Marca de ropa deportiva de alto rendimiento'),
('MAR007', 'Levis', 'Marca icónica de jeans y ropa casual'),
('MAR008', 'Converse', 'Marca clásica de calzado urbano'),
('MAR009', 'Vans', 'Marca de ropa y calzado para skate y street style'),
('MAR010', 'Timberland', 'Marca de calzado resistente y urbano'),
('MAR011', 'Fila', 'Marca deportiva con estilo retro'),
('MAR012', 'Asics', 'Calzado especializado para correr'),
('MAR013', 'Champion', 'Marca popular de ropa deportiva'),
('MAR014', 'H&M', 'Marca de moda accesible y contemporánea'),
('MAR015', 'Zara', 'Marca de ropa moderna y de moda rápida'),
('MAR016', 'Gap', 'Ropa casual y cómoda'),
('MAR017', 'Tommy Hilfiger', 'Marca de ropa y calzado con estilo clásico'),
('MAR018', 'Gucci', 'Marca de lujo y moda'),
('MAR019', 'Prada', 'Marca de lujo con enfoque en calzado'),
('MAR020', 'Lacoste', 'Marca deportiva de alto nivel'),
('MAR021', 'The North Face', 'Marca especializada en ropa para exteriores'),
('MAR022', 'Patagonia', 'Marca de ropa y calzado para actividades al aire libre'),
('MAR023', 'Polo Ralph Lauren', 'Marca de ropa clásica y elegante');



-- Tabla Empresa
CREATE TABLE Empresa (
  id_empresa VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'EMP001'
  nombre_empresa VARCHAR(100),
  direccion VARCHAR(255),
  telefono VARCHAR(20),
  email VARCHAR(100)
);

 
INSERT INTO Empresa (id_empresa, nombre_empresa, direccion, telefono, email) 
VALUES 
('EMP001', 'Fashion Supplier Inc.', '123 Calle Moda, Ciudad X', '123456789', 'contacto@fashionsupplier.com'),
('EMP002', 'Urban Wear Co.', '456 Avenida Estilo, Ciudad Y', '987654321', 'ventas@urbanwear.com'),
('EMP003', 'Street Wear S.A.', '789 Calle Urbano, Lima', '987123456', 'ventas@streetwear.com'),
('EMP004', 'Zapatos y Más', '123 Avenida Calzado, Lima', '123987654', 'contacto@zapatosyma.com'),
('EMP005', 'Sport Fashion Ltd.', '456 Calle Deportiva, Lima', '321456987', 'info@sportfashion.com'),
('EMP006', 'Deportes Elite', '321 Avenida Performance, Lima', '789654123', 'ventas@deporteselite.com'),
('EMP007', 'Calzado Urbano S.R.L.', '987 Avenida Estilo, Lima', '654321789', 'urbano@calzadourbano.com'),
('EMP008', 'La Moda Deportiva', '321 Calle Activa, Lima', '456789123', 'contacto@lamodadeportiva.com'),
('EMP009', 'Zapatillas Plus', '654 Calle Moda, Lima', '789123654', 'ventas@zapatillasplus.com'),
('EMP010', 'Caminantes Perú', '987 Avenida Andar, Lima', '321789654', 'info@caminantesperu.com'),
('EMP011', 'Ropa Trendy S.A.', '654 Calle Estilo, Lima', '654987321', 'ventas@ropatrendy.com'),
('EMP012', 'Moda Casual SAC', '123 Calle Casual, Lima', '789321654', 'info@modacasual.com'),
('EMP013', 'Calzado Fit', '456 Avenida Deportiva, Lima', '321654987', 'contacto@calzadofit.com'),
('EMP014', 'Estilo Deportivo', '987 Avenida Fitness, Lima', '654321123', 'ventas@estilodeportivo.com'),
('EMP015', 'Zapatos Prime', '321 Calle Sport, Lima', '987654321', 'info@zapatosprime.com'),
('EMP016', 'Fashion Step', '654 Avenida Step, Lima', '654987456', 'ventas@fashionstep.com'),
('EMP017', 'Urban Footwear', '321 Avenida Calle, Lima', '123456789', 'contacto@urbanfootwear.com'),
('EMP018', 'Ropa Activa SAC', '987 Avenida Agil, Lima', '789654123', 'ventas@ropaactiva.com'),
('EMP019', 'Deportiva Plus', '321 Calle Rapida, Lima', '456789654', 'info@deportivaplus.com'),
('EMP020', 'Zapatos Elite', '654 Avenida Estilo, Lima', '321456987', 'elite@zapatoselite.com'),
('EMP021', 'Calzado Urbano SA', '987 Calle Estilo, Lima', '789654987', 'urbano@calzadourbano.com');



-- Tabla Producto
CREATE TABLE Producto (
  id_producto VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'PROD001'
  nombre_producto VARCHAR(100),
  descripcion TEXT,
  precio DECIMAL(10, 2),
  stock INT,
  id_empresa VARCHAR(10),  
  id_marca VARCHAR(10),  
  FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa),
  FOREIGN KEY (id_marca) REFERENCES Marca(id_marca)
);

INSERT INTO Producto (id_producto, nombre_producto, descripcion, precio, stock, id_empresa, id_marca)
VALUES 
('PROD001', 'Zapatillas Air Max', 'Zapatillas deportivas para correr', 150.00, 30, 'EMP001', 'MAR001'),
('PROD002', 'Camiseta Dry-Fit', 'Camiseta de alto rendimiento para entrenamientos', 35.50, 100, 'EMP001', 'MAR002'),
('PROD003', 'Pantalón Jogger', 'Pantalón estilo casual y urbano', 60.00, 50, 'EMP002', 'MAR003'), 
('PROD004', 'Zapatillas Reebok Classic', 'Zapatillas clásicas para uso diario', 200.00, 50, 'EMP003', 'MAR004'),
('PROD005', 'Camiseta New Balance', 'Camiseta deportiva para running', 90.00, 75, 'EMP004', 'MAR005'),
('PROD006', 'Pantalón Under Armour', 'Pantalón de entrenamiento cómodo', 110.00, 40, 'EMP005', 'MAR006'),
('PROD007', 'Jeans Levis 501', 'Jeans clásicos de corte recto', 150.00, 30, 'EMP006', 'MAR007'),
('PROD008', 'Zapatillas Converse All Star', 'Zapatillas urbanas de lona', 120.00, 60, 'EMP007', 'MAR008'),
('PROD009', 'Zapatillas Vans Old Skool', 'Zapatillas para skate y uso casual', 130.00, 45, 'EMP008', 'MAR009'),
('PROD010', 'Botas Timberland', 'Botas resistentes para exteriores', 300.00, 20, 'EMP009', 'MAR010'),
('PROD011', 'Camiseta Fila Retro', 'Camiseta con diseño retro deportivo', 70.00, 80, 'EMP010', 'MAR011'),
('PROD012', 'Zapatillas Asics Gel-Kayano', 'Zapatillas para correr largas distancias', 250.00, 35, 'EMP011', 'MAR012'),
('PROD013', 'Sudadera Champion', 'Sudadera deportiva con capucha', 95.00, 50, 'EMP012', 'MAR013'),
('PROD014', 'Camisa H&M Casual', 'Camisa casual para uso diario', 60.00, 100, 'EMP013', 'MAR014'),
('PROD015', 'Chaqueta Zara Modern', 'Chaqueta moderna de moda rápida', 120.00, 70, 'EMP014', 'MAR015'),
('PROD016', 'Polera Gap Comfort', 'Polera cómoda y casual', 85.00, 80, 'EMP015', 'MAR016'),
('PROD017', 'Polos Tommy Hilfiger', 'Polo clásico y elegante', 110.00, 65, 'EMP016', 'MAR017'),
('PROD018', 'Zapatillas Gucci Ace', 'Zapatillas de lujo con detalles exclusivos', 450.00, 15, 'EMP017', 'MAR018'),
('PROD019', 'Zapatos Prada Derby', 'Zapatos de vestir de lujo', 550.00, 10, 'EMP018', 'MAR019'),
('PROD020', 'Polo Lacoste Classic', 'Polo clásico con logo bordado', 130.00, 55, 'EMP019', 'MAR020'),
('PROD021', 'Chaqueta The North Face', 'Chaqueta resistente al clima', 220.00, 25, 'EMP020', 'MAR021'),
('PROD022', 'Camiseta Patagonia Outdoor', 'Camiseta para actividades al aire libre', 80.00, 70, 'EMP021', 'MAR022'),
('PROD023', 'Polera Ralph Lauren', 'Polera elegante de Polo Ralph Lauren', 140.00, 40, 'EMP003', 'MAR023');


-- Tabla Usuario
CREATE TABLE Usuario (
  id_usuario VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'USR001'
  email VARCHAR(100),  
  contraseña VARCHAR(100)
);

-- Población inicial de Usuario
INSERT INTO Usuario (id_usuario, email, contraseña)
VALUES 
('USR001', 'jperez@correo.com', '123qwe'),
('USR002', 'mgomez@correo.com', '123qwe'),
('USR003', 'lrodriguez@correo.com', 'abc123'),
('USR004', 'dmarquez@correo.com', '123abc'),
('USR005', 'ftorres@correo.com', 'qwe456'),
('USR006', 'ggarcia@correo.com', 'zxc789'),
('USR007', 'eluna@correo.com', 'luna789'),
('USR008', 'jcastro@correo.com', 'jcastro123'),
('USR009', 'mruiz@correo.com', 'ruiz123'),
('USR010', 'ablanco@correo.com', 'blanco789'),
('USR011', 'cperalta@correo.com', 'peralta456'),
('USR012', 'glopez@correo.com', 'lopez123'),
('USR013', 'vcastillo@correo.com', 'castillo456'),
('USR014', 'therrera@correo.com', 'herrera123'),
('USR015', 'salvarez@correo.com', 'alvarez789'),
('USR016', 'anavarro@correo.com', 'navarro789'),
('USR017', 'pcabrera@correo.com', 'cabrera456'),
('USR018', 'jmendoza@correo.com', 'mendoza123'),
('USR019', 'mramos@correo.com', 'ramos789'),
('USR020', 'mgutierrez@correo.com', 'gutierrez456'),
('USR021', 'nfernandez@correo.com', 'fernandez123'),
('USR022', 'jmartinez@correo.com', 'martinez789');



-- Tabla Cliente
CREATE TABLE Cliente (
  id_cliente VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'CLI001'
  nombre VARCHAR(100),
  direccion VARCHAR(255),
  telefono VARCHAR(20),
  email VARCHAR(100),
  dni VARCHAR(20),
  contraseña VARCHAR(100)
);
 
INSERT INTO Cliente (id_cliente, nombre, direccion, telefono, email, dni, contraseña)
VALUES 
('CLI001', 'Juan Pérez', '123 Calle Principal, Lima', '987654321', 'jperez@correo.com', '84516295', '123qwe'),
('CLI002', 'María Gómez', '456 Calle Secundaria, Callao', '987654654', 'mgomez@correo.com', '41523658', '123qwe'),
('CLI003', 'Luis Rodríguez', '789 Avenida Central, Lima', '987654789', 'lrodriguez@correo.com', '12345678', 'abc123'),
('CLI004', 'Daniel Márquez', '321 Avenida Parque, Lima', '987654012', 'dmarquez@correo.com', '87654321', '123abc'),
('CLI005', 'Fernando Torres', '654 Calle de la Playa, Lima', '987654345', 'ftorres@correo.com', '23456789', 'qwe456'),
('CLI006', 'Gabriel García', '987 Calle de los Sueños, Lima', '987654678', 'ggarcia@correo.com', '34567890', 'zxc789'),
('CLI007', 'Eva Luna', '135 Avenida del Sol, Lima', '987654901', 'eluna@correo.com', '45678901', 'luna789'),
('CLI008', 'José Castro', '246 Calle del Río, Lima', '987654234', 'jcastro@correo.com', '56789012', 'jcastro123'),
('CLI009', 'Marta Ruiz', '357 Calle de la Esperanza, Lima', '987654567', 'mruiz@correo.com', '67890123', 'ruiz123'),
('CLI010', 'Ana Blanco', '468 Calle del Océano, Lima', '987654890', 'ablanco@correo.com', '78901234', 'blanco789'),
('CLI011', 'Carlos Peralta', '579 Calle de la Paz, Lima', '987654123', 'cperalta@correo.com', '89012345', 'peralta456'),
('CLI012', 'Gloria López', '680 Avenida Libertad, Lima', '987654456', 'glopez@correo.com', '90123456', 'lopez123'),
('CLI013', 'Verónica Castillo', '791 Avenida de los Ríos, Lima', '987654789', 'vcastillo@correo.com', '01234567', 'castillo456'),
('CLI014', 'Tomás Herrera', '802 Calle de la Libertad, Lima', '987654012', 'therrera@correo.com', '12345678', 'herrera123'),
('CLI015', 'Sofia Alvarez', '913 Calle del Jardín, Lima', '987654345', 'salvarez@correo.com', '23456789', 'alvarez789'),
('CLI016', 'Alberto Navarro', '024 Calle del Bosque, Lima', '987654678', 'anavarro@correo.com', '34567890', 'navarro789'),
('CLI017', 'Pablo Cabrera', '135 Avenida de la Paz, Lima', '987654901', 'pcabrera@correo.com', '45678901', 'cabrera456'),
('CLI018', 'Jorge Mendoza', '246 Calle del Futuro, Lima', '987654234', 'jmendoza@correo.com', '56789012', 'mendoza123'),
('CLI019', 'María Ramos', '357 Avenida del Tiempo, Lima', '987654567', 'mramos@correo.com', '67890123', 'ramos789'),
('CLI020', 'Miguel Gutierrez', '468 Calle del Mar, Lima', '987654890', 'mgutierrez@correo.com', '78901234', 'gutierrez456'),
('CLI021', 'Nadia Fernández', '579 Calle del Cielo, Lima', '987654123', 'nfernandez@correo.com', '89012345', 'fernandez123'),
('CLI022', 'Julio Martínez', '680 Avenida del Sol, Lima', '987654456', 'jmartinez@correo.com', '90123456', 'martinez789');





-- Tabla Ventas

CREATE TABLE Venta (
  id_venta VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'VEN001'
  id_cliente VARCHAR(10),  
  fecha_venta TIMESTAMP NOT NULL,  
  total DECIMAL(10, 2) NOT NULL,  
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);



INSERT INTO Venta (id_venta, id_cliente, fecha_venta, total) VALUES
('VEN001', 'CLI001', '2024-01-03 10:15:00', 150.00),
('VEN002', 'CLI002', '2024-01-05 11:30:00', 131.00), 
('VEN003', 'CLI003', '2024-01-07 09:45:00', 85.50),
('VEN004', 'CLI004', '2024-01-10 14:20:00', 290.00), 
('VEN005', 'CLI005', '2024-01-12 16:35:00', 120.75),
('VEN006', 'CLI006', '2024-01-15 13:10:00', 95.00),
('VEN007', 'CLI007', '2024-01-18 17:25:00', 250.00),
('VEN008', 'CLI008', '2024-01-20 10:50:00', 175.00),
('VEN009', 'CLI009', '2024-01-22 12:30:00', 60.00),
('VEN010', 'CLI010', '2024-01-25 15:45:00', 130.00),
('VEN011', 'CLI011', '2024-01-28 11:15:00', 190.00), 
('VEN012', 'CLI012', '2024-01-30 14:55:00', 180.00),
('VEN013', 'CLI013', '2024-01-31 16:40:00', 90.00),
('VEN014', 'CLI014', '2024-01-29 09:05:00', 170.00), 
('VEN015', 'CLI015', '2024-01-27 13:35:00', 140.00),
('VEN016', 'CLI016', '2024-02-02 10:20:00', 140.00),
('VEN017', 'CLI017', '2024-02-04 11:40:00', 175.00),
('VEN018', 'CLI018', '2024-02-06 09:30:00', 95.00),
('VEN019', 'CLI019', '2024-02-10 14:10:00', 220.00),
('VEN020', 'CLI020', '2024-02-12 16:50:00', 180.00),
('VEN021', 'CLI001', '2024-02-15 13:25:00', 110.00),
('VEN022', 'CLI002', '2024-02-18 17:00:00', 130.00),
('VEN023', 'CLI003', '2024-02-20 10:55:00', 131.00),
('VEN024', 'CLI004', '2024-02-22 12:35:00', 160.00),
('VEN025', 'CLI005', '2024-02-25 15:15:00', 85.00),
('VEN026', 'CLI006', '2024-02-27 11:05:00', 190.00),
('VEN027', 'CLI007', '2024-02-28 14:45:00', 175.00),
('VEN028', 'CLI008', '2024-03-03 10:30:00', 150.00),
('VEN029', 'CLI009', '2024-03-05 11:50:00', 210.00),
('VEN030', 'CLI010', '2024-03-07 09:40:00', 95.00),
('VEN031', 'CLI011', '2024-03-10 14:25:00', 180.00),
('VEN032', 'CLI012', '2024-03-12 16:55:00', 130.00),
('VEN033', 'CLI013', '2024-03-15 13:15:00', 200.00),
('VEN034', 'CLI014', '2024-03-18 17:20:00', 175.00),
('VEN035', 'CLI015', '2024-03-20 10:10:00', 160.00),
('VEN036', 'CLI016', '2024-03-22 12:45:00', 90.00),
('VEN037', 'CLI017', '2024-03-25 15:30:00', 220.00),
('VEN038', 'CLI018', '2024-04-02 10:05:00', 140.00),
('VEN039', 'CLI019', '2024-04-04 11:25:00', 175.00),
('VEN040', 'CLI020', '2024-04-06 09:35:00', 95.00),
('VEN041', 'CLI001', '2024-04-08 14:15:00', 220.00),
('VEN042', 'CLI002', '2024-04-10 16:45:00', 180.00),
('VEN043', 'CLI003', '2024-04-12 13:20:00', 110.00),
('VEN044', 'CLI004', '2024-04-14 17:10:00', 130.00),
('VEN045', 'CLI005', '2024-04-16 10:50:00', 200.00),
('VEN046', 'CLI006', '2024-04-18 12:30:00', 160.00),
('VEN047', 'CLI007', '2024-04-20 15:00:00', 85.00),
('VEN048', 'CLI008', '2024-04-22 11:40:00', 190.00),
('VEN049', 'CLI009', '2024-04-24 14:55:00', 175.00),
('VEN050', 'CLI010', '2024-04-26 09:15:00', 150.00),
('VEN051', 'CLI011', '2024-04-28 13:35:00', 220.00),
('VEN052', 'CLI012', '2024-05-03 10:20:00', 140.00),
('VEN053', 'CLI013', '2024-05-05 11:40:00', 175.00),
('VEN054', 'CLI014', '2024-05-07 09:30:00', 95.00),
('VEN055', 'CLI015', '2024-05-10 14:10:00', 220.00),
('VEN056', 'CLI016', '2024-05-12 16:50:00', 180.00),
('VEN057', 'CLI017', '2024-05-15 13:25:00', 110.00),
('VEN058', 'CLI018', '2024-05-17 17:00:00', 130.00),
('VEN059', 'CLI019', '2024-05-20 10:55:00', 200.00),
('VEN060', 'CLI020', '2024-05-22 12:35:00', 160.00),
('VEN061', 'CLI021', '2024-05-25 15:15:00', 85.00),
('VEN062', 'CLI022', '2024-06-02 10:30:00', 150.00),
('VEN063', 'CLI001', '2024-06-04 11:50:00', 210.00),
('VEN064', 'CLI002', '2024-06-06 09:40:00', 95.00),
('VEN065', 'CLI003', '2024-06-08 14:25:00', 180.00),
('VEN066', 'CLI004', '2024-06-10 16:55:00', 130.00),
('VEN067', 'CLI005', '2024-06-12 13:15:00', 200.00),
('VEN068', 'CLI006', '2024-06-15 17:20:00', 175.00),
('VEN069', 'CLI007', '2024-06-18 10:10:00', 160.00),
('VEN070', 'CLI008', '2024-06-20 12:45:00', 90.00),
('VEN071', 'CLI009', '2024-06-22 15:30:00', 220.00),
('VEN072', 'CLI010', '2024-06-25 10:05:00', 140.00),
('VEN073', 'CLI011', '2024-06-27 11:25:00', 175.00),
('VEN074', 'CLI012', '2024-06-30 09:35:00', 95.00),
('VEN075', 'CLI013', '2024-06-30 14:15:00', 220.00),
('VEN076', 'CLI014', '2024-06-30 16:45:00', 180.00),
('VEN077', 'CLI015', '2024-06-30 13:20:00', 110.00),
('VEN078', 'CLI016', '2024-06-30 17:10:00', 130.00),
('VEN079', 'CLI017', '2024-06-30 10:50:00', 200.00),
('VEN080', 'CLI018', '2024-07-03 10:20:00', 140.00),
('VEN081', 'CLI019', '2024-07-05 11:40:00', 175.00),
('VEN082', 'CLI020', '2024-07-07 09:30:00', 95.00),
('VEN083', 'CLI001', '2024-07-10 14:10:00', 220.00),
('VEN084', 'CLI002', '2024-07-12 16:50:00', 180.00),
('VEN085', 'CLI003', '2024-07-15 13:25:00', 110.00),
('VEN086', 'CLI004', '2024-07-18 17:00:00', 130.00),
('VEN087', 'CLI005', '2024-07-20 10:55:00', 200.00),
('VEN088', 'CLI006', '2024-07-22 12:35:00', 160.00),
('VEN089', 'CLI007', '2024-07-25 15:15:00', 85.00),
('VEN090', 'CLI008', '2024-07-27 11:40:00', 190.00),
('VEN091', 'CLI009', '2024-07-29 14:55:00', 175.00),
('VEN092', 'CLI010', '2024-08-01 10:30:00', 150.00),
('VEN093', 'CLI011', '2024-08-03 11:50:00', 210.00),
('VEN094', 'CLI012', '2024-08-05 09:40:00', 95.00),
('VEN095', 'CLI013', '2024-08-08 14:25:00', 180.00),
('VEN096', 'CLI014', '2024-08-10 16:55:00', 130.00),
('VEN097', 'CLI015', '2024-08-12 13:15:00', 200.00),
('VEN098', 'CLI016', '2024-08-15 17:20:00', 175.00),
('VEN099', 'CLI017', '2024-08-18 10:10:00', 160.00),
('VEN100', 'CLI018', '2024-08-20 12:45:00', 90.00),
('VEN101', 'CLI019', '2024-08-22 15:30:00', 220.00),
('VEN102', 'CLI020', '2024-09-01 10:05:00', 140.00),
('VEN103', 'CLI001', '2024-09-04 11:25:00', 175.00),
('VEN104', 'CLI002', '2024-09-06 09:35:00', 95.00),
('VEN105', 'CLI003', '2024-09-08 14:15:00', 220.00),
('VEN106', 'CLI004', '2024-09-10 16:45:00', 180.00),
('VEN107', 'CLI005', '2024-09-12 13:20:00', 110.00),
('VEN108', 'CLI006', '2024-09-15 17:10:00', 130.00),
('VEN109', 'CLI007', '2024-09-18 10:50:00', 200.00),
('VEN110', 'CLI008', '2024-10-01 10:20:00', 140.00),
('VEN111', 'CLI009', '2024-10-02 11:40:00', 175.00),
('VEN112', 'CLI010', '2024-10-05 09:30:00', 95.00),
('VEN113', 'CLI011', '2024-10-07 14:25:00', 180.00),
('VEN114', 'CLI012', '2024-10-09 16:55:00', 130.00),
('VEN115', 'CLI013', '2024-10-12 13:15:00', 200.00),
('VEN116', 'CLI014', '2024-10-15 17:20:00', 175.00),
('VEN117', 'CLI015', '2024-10-17 10:10:00', 160.00),
('VEN118', 'CLI016', '2024-10-20 12:45:00', 90.00),
('VEN119', 'CLI017', '2024-10-22 15:30:00', 220.00);

-- Detalle Ventas

CREATE TABLE Detalle_venta (
  id_detalle INT AUTO_INCREMENT PRIMARY KEY,
  id_venta VARCHAR(10),  
  id_producto VARCHAR(10),  
  cantidad INT NOT NULL,  
  precio_unitario DECIMAL(10, 2) NOT NULL,  
  FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
  FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);


-- datos en la tabla Detalle_venta
INSERT INTO Detalle_venta (id_venta, id_producto, cantidad, precio_unitario) VALUES

('VEN001', 'PROD001', 1, 150.00),
('VEN002', 'PROD002', 2, 35.50),
('VEN002', 'PROD003', 1, 60.00),
('VEN003', 'PROD004', 1, 85.50),
('VEN004', 'PROD005', 2, 90.00),
('VEN004', 'PROD006', 1, 110.00),
('VEN005', 'PROD007', 1, 120.75),
('VEN006', 'PROD008', 1, 95.00),
('VEN007', 'PROD009', 2, 125.00),
('VEN008', 'PROD010', 1, 175.00),
('VEN009', 'PROD011', 1, 60.00),
('VEN010', 'PROD012', 1, 130.00),
('VEN011', 'PROD013', 2, 95.00),
('VEN012', 'PROD014', 3, 60.00),
('VEN013', 'PROD015', 1, 90.00),
('VEN014', 'PROD016', 2, 85.00),
('VEN015', 'PROD017', 1, 110.00),
('VEN016', 'PROD018', 1, 140.00),
('VEN017', 'PROD019', 1, 175.00),
('VEN018', 'PROD020', 1, 95.00),
('VEN019', 'PROD021', 1, 220.00),
('VEN020', 'PROD022', 2, 90.00),
('VEN021', 'PROD023', 1, 110.00),
('VEN022', 'PROD001', 1, 130.00),
('VEN023', 'PROD002', 2, 35.50),
('VEN023', 'PROD003', 1, 60.00),
('VEN024', 'PROD004', 2, 80.00),
('VEN025', 'PROD005', 1, 85.00),
('VEN026', 'PROD006', 1, 110.00),
('VEN026', 'PROD007', 1, 80.00),
('VEN027', 'PROD008', 1, 175.00),
('VEN028', 'PROD009', 1, 150.00),
('VEN029', 'PROD010', 1, 210.00),
('VEN030', 'PROD011', 1, 95.00),
('VEN031', 'PROD012', 1, 180.00),
('VEN032', 'PROD013', 1, 130.00),
('VEN033', 'PROD014', 2, 60.00),
('VEN033', 'PROD015', 1, 80.00),
('VEN034', 'PROD016', 2, 87.50),
('VEN035', 'PROD017', 1, 160.00),
('VEN036', 'PROD018', 1, 90.00),
('VEN037', 'PROD019', 1, 220.00),
('VEN038', 'PROD020', 1, 140.00),
('VEN039', 'PROD021', 1, 175.00),
('VEN040', 'PROD022', 1, 95.00),
('VEN041', 'PROD023', 2, 110.00),
('VEN042', 'PROD001', 1, 180.00),
('VEN043', 'PROD002', 2, 35.50),
('VEN043', 'PROD003', 1, 39.00),
('VEN044', 'PROD004', 1, 130.00),
('VEN045', 'PROD005', 2, 90.00),
('VEN046', 'PROD006', 1, 160.00),
('VEN047', 'PROD007', 1, 85.00),
('VEN048', 'PROD008', 2, 95.00),
('VEN049', 'PROD009', 1, 175.00),
('VEN050', 'PROD010', 1, 150.00),
('VEN051', 'PROD011', 2, 110.00),
('VEN052', 'PROD012', 1, 140.00),
('VEN053', 'PROD013', 1, 175.00),
('VEN054', 'PROD014', 1, 95.00),
('VEN055', 'PROD015', 2, 110.00),
('VEN056', 'PROD016', 2, 90.00),
('VEN057', 'PROD017', 1, 110.00),
('VEN058', 'PROD018', 1, 130.00),
('VEN059', 'PROD019', 1, 200.00),
('VEN060', 'PROD020', 1, 160.00),
('VEN061', 'PROD021', 1, 85.00),
('VEN062', 'PROD022', 1, 150.00),
('VEN063', 'PROD023', 2, 105.00),
('VEN064', 'PROD001', 1, 95.00),
('VEN065', 'PROD002', 3, 35.50),
('VEN065', 'PROD003', 1, 60.00),
('VEN066', 'PROD004', 1, 130.00),
('VEN067', 'PROD005', 2, 90.00),
('VEN068', 'PROD006', 1, 175.00),
('VEN069', 'PROD007', 1, 160.00),
('VEN070', 'PROD008', 1, 90.00),
('VEN071', 'PROD009', 2, 110.00),
('VEN072', 'PROD010', 1, 140.00),
('VEN073', 'PROD011', 1, 175.00),
('VEN074', 'PROD012', 1, 95.00),
('VEN075', 'PROD013', 2, 110.00),
('VEN076', 'PROD014', 3, 60.00),
('VEN077', 'PROD015', 1, 110.00),
('VEN078', 'PROD016', 1, 130.00),
('VEN079', 'PROD017', 2, 100.00),
('VEN080', 'PROD018', 1, 140.00),
('VEN081', 'PROD019', 1, 175.00),
('VEN082', 'PROD020', 1, 95.00),
('VEN083', 'PROD021', 1, 220.00),
('VEN084', 'PROD022', 2, 90.00),
('VEN085', 'PROD023', 1, 110.00),
('VEN086', 'PROD001', 1, 130.00),
('VEN087', 'PROD002', 2, 35.50),
('VEN087', 'PROD003', 1, 60.00),
('VEN088', 'PROD004', 2, 80.00),
('VEN089', 'PROD005', 1, 85.00),
('VEN090', 'PROD006', 1, 110.00),
('VEN090', 'PROD007', 1, 80.00),
('VEN091', 'PROD008', 1, 175.00),
('VEN092', 'PROD009', 1, 150.00),
('VEN093', 'PROD010', 1, 210.00),
('VEN094', 'PROD011', 1, 95.00),
('VEN095', 'PROD012', 1, 180.00),
('VEN096', 'PROD013', 1, 130.00),
('VEN097', 'PROD014', 2, 60.00),
('VEN097', 'PROD015', 1, 80.00),
('VEN098', 'PROD016', 2, 87.50),
('VEN099', 'PROD017', 1, 160.00),
('VEN100', 'PROD018', 1, 90.00),
('VEN101', 'PROD019', 1, 220.00),
('VEN102', 'PROD020', 1, 140.00),
('VEN103', 'PROD021', 1, 175.00),
('VEN104', 'PROD022', 1, 95.00),
('VEN105', 'PROD023', 2, 110.00),
('VEN106', 'PROD001', 1, 180.00),
('VEN107', 'PROD002', 2, 35.50),
('VEN107', 'PROD003', 1, 39.00),
('VEN108', 'PROD004', 1, 130.00),
('VEN109', 'PROD005', 2, 90.00),
('VEN110', 'PROD006', 1, 140.00),
('VEN111', 'PROD007', 1, 175.00),
('VEN112', 'PROD008', 1, 95.00),
('VEN113', 'PROD009', 1, 180.00),
('VEN114', 'PROD010', 1, 130.00),
('VEN115', 'PROD011', 2, 75.00),
('VEN115', 'PROD012', 1, 50.00),
('VEN116', 'PROD013', 1, 175.00),
('VEN117', 'PROD014', 2, 80.00),
('VEN118', 'PROD015', 1, 90.00),
('VEN119', 'PROD016', 2, 110.00);







-- STORE PROCEDURES

-- AGREGAR 

DELIMITER //

-- Eliminar el procedimiento si ya existe
DROP PROCEDURE IF EXISTS AgregarProveedor //
CREATE PROCEDURE AgregarProveedor(
    IN p_nombre_empresa VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100)
)
BEGIN
    DECLARE last_id INT;
    DECLARE new_id VARCHAR(10);
    -- Buscar el último  id_empresa
    SELECT IFNULL(MAX(CAST(SUBSTRING(id_empresa, 4) AS UNSIGNED)), 0) INTO last_id
    FROM Empresa;

    -- Generar el nuevo ID 
    SET new_id = CONCAT('EMP', LPAD(last_id + 1, 3, '0'));

    -- Insertar el nuevo proveedor
    INSERT INTO Empresa (id_empresa, nombre_empresa, direccion, telefono, email) 
    VALUES (new_id, p_nombre_empresa, p_direccion, p_telefono, p_email);
END //

DELIMITER ;



-- MODIFICAR

DELIMITER //

CREATE PROCEDURE modificarProveedor(
    IN p_cod_emp VARCHAR(50),
    IN p_nom_emp VARCHAR(100),
    IN p_direc_emp VARCHAR(200),
    IN p_telef_emp VARCHAR(20),
    IN p_email_emp VARCHAR(100)
)
BEGIN
    UPDATE empresa
    SET 
        nombre_empresa = p_nom_emp,
        direccion = p_direc_emp,
        telefono = p_telef_emp,
        email = p_email_emp
    WHERE 
        id_empresa = p_cod_emp;
END //

DELIMITER ;

-- BORRA
DELIMITER //

DROP PROCEDURE IF EXISTS eliminarProveedor //

CREATE PROCEDURE eliminarProveedor(
    IN p_id_empresa VARCHAR(10)
)
BEGIN
    -- Verificar si la empresa tiene productos asociados
    DECLARE cantidad_productos INT;
    
    SELECT COUNT(*) INTO cantidad_productos
    FROM Producto
    WHERE id_empresa = p_id_empresa;

    -- Condición para eliminar o no
    IF cantidad_productos = 0 THEN
        DELETE FROM Empresa WHERE id_empresa = p_id_empresa;
        SELECT CONCAT('Proveedor con ID ', p_id_empresa, ' eliminado exitosamente.') AS Mensaje;
    ELSE
        SELECT CONCAT('No se puede eliminar el proveedor con ID ', p_id_empresa, ' porque tiene productos asociados.') AS Mensaje;
    END IF;
END //

DELIMITER ;


-- SP PARA GRAFICOS 

-- POR MES 

DELIMITER //

CREATE PROCEDURE spVentasPorMes(an INT)
BEGIN
    SELECT 
        CASE MONTH(fecha_venta)
            WHEN 1 THEN 'Enero'
            WHEN 2 THEN 'Febrero'
            WHEN 3 THEN 'Marzo'
            WHEN 4 THEN 'Abril'
            WHEN 5 THEN 'Mayo'
            WHEN 6 THEN 'Junio'
            WHEN 7 THEN 'Julio'
            WHEN 8 THEN 'Agosto'
            WHEN 9 THEN 'Septiembre'
            WHEN 10 THEN 'Octubre'
            WHEN 11 THEN 'Noviembre'
            WHEN 12 THEN 'Diciembre'
        END AS mes,
        SUM(total) AS total
    FROM Venta
    WHERE YEAR(fecha_venta) = an
    GROUP BY MONTH(fecha_venta)
    ORDER BY MONTH(fecha_venta);
END //

DELIMITER ;



-- TOP 10 MARCA QUE MAS VENDEN 

DELIMITER //

CREATE PROCEDURE spVentasPorMarca()
BEGIN
    SELECT 
        m.marca_producto AS marca,
        SUM(d.precio_unitario * d.cantidad) AS total
    FROM Detalle_venta d
    INNER JOIN Venta v ON d.id_venta = v.id_venta
    INNER JOIN Producto p ON d.id_producto = p.id_producto
    INNER JOIN Marca m ON p.id_marca = m.id_marca
    GROUP BY m.marca_producto
    ORDER BY total DESC
    LIMIT 10;  -- Limitar a las 10 marcas con mayores ventas
END //

DELIMITER ;


-- DETALLE DE PEDIDO POR ID_VENTA

DELIMITER $$

CREATE PROCEDURE obtenerDetallePedido(IN venta_id VARCHAR(20))
BEGIN
    SELECT 
        v.id_venta, 
        c.nombre AS nombre_cliente, 
        p.nombre_producto, 
        dv.cantidad, 
        dv.precio_unitario
    FROM 
        venta v
    LEFT JOIN 
        cliente c ON c.id_cliente = v.id_cliente
    LEFT JOIN 
        detalle_venta dv ON dv.id_venta = v.id_venta
    LEFT JOIN 
        producto p ON p.id_producto = dv.id_producto
    WHERE 
        v.id_venta = venta_id;
END $$

DELIMITER ;
