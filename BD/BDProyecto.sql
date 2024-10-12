
# Eliminando objetos si ya existen
DROP DATABASE IF EXISTS bdProyectoVentas;
CREATE DATABASE bdProyectoVentas;
USE bdProyectoVentas;

CREATE TABLE Marca (
  id_marca VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'MAR001'
  marca_producto VARCHAR(100),
  descripcion TEXT
);

-- Población inicial de Marca con nuevo formato de ID
INSERT INTO Marca (id_marca, marca_producto, descripcion) 
VALUES 
('MAR001', 'Nike', 'Marca deportiva internacional'),
('MAR002', 'Adidas', 'Marca de ropa y calzado deportivo'),
('MAR003', 'Puma', 'Marca de ropa deportiva y urbana');

CREATE TABLE Empresa (
  id_empresa VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'EMP001'
  nombre_empresa VARCHAR(100),
  direccion VARCHAR(255),
  telefono VARCHAR(20),
  email VARCHAR(100)
);

-- Población inicial de Empresa con nuevo formato de ID
INSERT INTO Empresa (id_empresa, nombre_empresa, direccion, telefono, email) 
VALUES 
('EMP001', 'Fashion Supplier Inc.', '123 Calle Moda, Ciudad X', '123456789', 'contacto@fashionsupplier.com'),
('EMP002', 'Urban Wear Co.', '456 Avenida Estilo, Ciudad Y', '987654321', 'ventas@urbanwear.com');

CREATE TABLE Producto (
  id_producto VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'PROD001'
  nombre_producto VARCHAR(100),
  descripcion TEXT,
  precio DECIMAL(10, 2),
  stock INT,
  id_empresa VARCHAR(10), -- Clave foránea de Empresa
  id_marca VARCHAR(10), -- Clave foránea de Marca
  FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa),
  FOREIGN KEY (id_marca) REFERENCES Marca(id_marca)
);

-- Población inicial de Producto con nuevo formato de ID
INSERT INTO Producto (id_producto, nombre_producto, descripcion, precio, stock, id_empresa, id_marca)
VALUES 
('PROD001', 'Zapatillas Air Max', 'Zapatillas deportivas para correr', 150.00, 30, 'EMP001', 'MAR001'),
('PROD002', 'Camiseta Dry-Fit', 'Camiseta de alto rendimiento para entrenamientos', 35.50, 100, 'EMP001', 'MAR002'),
('PROD003', 'Pantalón Jogger', 'Pantalón estilo casual y urbano', 60.00, 50, 'EMP002', 'MAR003');


CREATE TABLE Usuario (
  id_usuario VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'USR001'
  id_email VARCHAR(100),
  contraseña VARCHAR(100)
);

-- Población inicial de Usuario con nuevo formato de ID
INSERT INTO Usuario (id_usuario, id_email, contraseña)
VALUES 
('USR001', 'jperez@correo.com', '123qwe'),
('USR002', 'mgomez@correo.com', '123qwe');


CREATE TABLE Cliente (
  id_cliente VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'CLI001'
  nombre VARCHAR(100),
  direccion VARCHAR(255),
  telefono VARCHAR(20),
  email VARCHAR(100),
  dni VARCHAR(20),
  contraseña VARCHAR(100)
);

-- Población inicial de Cliente con nuevo formato de ID
INSERT INTO Cliente (id_cliente, nombre, direccion, telefono, email, dni, contraseña)
VALUES 
('CLI001', 'Juan Pérez', '123 Calle Principal, Lima', '987654321', 'jperez@correo.com', '84516295', '123qwe'),
('CLI002', 'María Gómez', '456 Calle Secundaria, Callao', '987654654', 'mgomez@correo.com', '41523658', '123qwe');


CREATE TABLE CarritoCompras (
  id_carrito VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'CARR001'
  id_cliente VARCHAR(10), -- Clave foránea de Cliente
  productos JSON, -- Productos en formato JSON
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);



CREATE TABLE Pedido (
  id_pedido VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'PED001'
  id_carrito VARCHAR(10), -- Clave foránea de CarritoCompras
  fecha_pedido DATE,
  estado VARCHAR(50),
  fecha_entrega DATE,
  FOREIGN KEY (id_carrito) REFERENCES CarritoCompras(id_carrito)
);



CREATE TABLE Pago (
  id_pago VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'PAY001'
  id_pedido VARCHAR(10), -- Clave foránea de Pedido
  metodo_pago VARCHAR(50),
  monto DECIMAL(10, 2),
  fecha DATE,
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);



CREATE TABLE Envio (
  id_envio VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'ENV001'
  id_pedido VARCHAR(10), -- Clave foránea de Pedido
  direccion VARCHAR(255),
  costo DECIMAL(10, 2),
  fecha DATE,
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);
