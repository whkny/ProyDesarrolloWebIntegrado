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

-- Población inicial de Marca
INSERT INTO Marca (id_marca, marca_producto, descripcion) 
VALUES 
('MAR001', 'Nike', 'Marca deportiva internacional'),
('MAR002', 'Adidas', 'Marca de ropa y calzado deportivo'),
('MAR003', 'Puma', 'Marca de ropa deportiva y urbana');

-- Tabla Empresa
CREATE TABLE Empresa (
  id_empresa VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'EMP001'
  nombre_empresa VARCHAR(100),
  direccion VARCHAR(255),
  telefono VARCHAR(20),
  email VARCHAR(100)
);

-- Población inicial de Empresa
INSERT INTO Empresa (id_empresa, nombre_empresa, direccion, telefono, email) 
VALUES 
('EMP001', 'Fashion Supplier Inc.', '123 Calle Moda, Ciudad X', '123456789', 'contacto@fashionsupplier.com'),
('EMP002', 'Urban Wear Co.', '456 Avenida Estilo, Ciudad Y', '987654321', 'ventas@urbanwear.com');

-- Tabla Producto
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

-- Población inicial de Producto
INSERT INTO Producto (id_producto, nombre_producto, descripcion, precio, stock, id_empresa, id_marca)
VALUES 
('PROD001', 'Zapatillas Air Max', 'Zapatillas deportivas para correr', 150.00, 30, 'EMP001', 'MAR001'),
('PROD002', 'Camiseta Dry-Fit', 'Camiseta de alto rendimiento para entrenamientos', 35.50, 100, 'EMP001', 'MAR002'),
('PROD003', 'Pantalón Jogger', 'Pantalón estilo casual y urbano', 60.00, 50, 'EMP002', 'MAR003');

-- Tabla Usuario
CREATE TABLE Usuario (
  id_usuario VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'USR001'
  email VARCHAR(100), -- Consistencia en el nombre
  contraseña VARCHAR(100)
);

-- Población inicial de Usuario
INSERT INTO Usuario (id_usuario, email, contraseña)
VALUES 
('USR001', 'jperez@correo.com', '123qwe'),
('USR002', 'mgomez@correo.com', '123qwe');

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

-- Población inicial de Cliente
INSERT INTO Cliente (id_cliente, nombre, direccion, telefono, email, dni, contraseña)
VALUES 
('CLI001', 'Juan Pérez', '123 Calle Principal, Lima', '987654321', 'jperez@correo.com', '84516295', '123qwe'),
('CLI002', 'María Gómez', '456 Calle Secundaria, Callao', '987654654', 'mgomez@correo.com', '41523658', '123qwe');

-- Tabla CarritoCompras
CREATE TABLE CarritoCompras (
  id_carrito VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'CARR001'
  id_cliente VARCHAR(10), -- Clave foránea de Cliente
  fecha_creacion TIMESTAMP NOT NULL, -- Usando TIMESTAMP para mayor precisión
  estado VARCHAR(20) DEFAULT 'pendiente', -- Estado del carrito (pendiente, pagado, cancelado)
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla CarritoCompras_Producto (Nueva tabla para detalle de productos)
CREATE TABLE CarritoCompras_Producto (
  id_carrito VARCHAR(10), -- Clave foránea de CarritoCompras
  id_producto VARCHAR(10), -- Clave foránea de Producto
  cantidad INT NOT NULL,
  FOREIGN KEY (id_carrito) REFERENCES CarritoCompras(id_carrito),
  FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- Tabla Pedido
CREATE TABLE Pedido (
  id_pedido VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'PED001'
  id_carrito VARCHAR(10), -- Clave foránea de CarritoCompras
  fecha_pedido TIMESTAMP NOT NULL, -- Usando TIMESTAMP para mayor precisión
  estado VARCHAR(50) DEFAULT 'pendiente', -- Estado del pedido (pendiente, enviado, entregado)
  fecha_entrega DATE, 
  FOREIGN KEY (id_carrito) REFERENCES CarritoCompras(id_carrito)
);

-- Tabla Pago
CREATE TABLE Pago (
  id_pago VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'PAY001'
  id_pedido VARCHAR(10), -- Clave foránea de Pedido
  metodo_pago VARCHAR(50) NOT NULL,
  monto DECIMAL(10, 2) NOT NULL,
  fecha TIMESTAMP NOT NULL, -- Usando TIMESTAMP para mayor precisión
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

-- Tabla Envio
CREATE TABLE Envio (
  id_envio VARCHAR(10) PRIMARY KEY, -- Ejemplo de ID: 'ENV001'
  id_pedido VARCHAR(10), -- Clave foránea de Pedido
  direccion VARCHAR(255),
  costo DECIMAL(10, 2),
  fecha TIMESTAMP, -- Usando TIMESTAMP para registrar la fecha y hora
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);


-- STORE PROCEDURES

-- AGREGAR 

DELIMITER //

CREATE PROCEDURE AgregarProveedor(
    IN p_id_empresa VARCHAR(10),
    IN p_nombre_empresa VARCHAR(100),
    IN p_direccion VARCHAR(255),
    IN p_telefono VARCHAR(20),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO Empresa (id_empresa, nombre_empresa, direccion, telefono, email) 
    VALUES (p_id_empresa, p_nombre_empresa, p_direccion, p_telefono, p_email);
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

CREATE PROCEDURE borrarProveedor(
    IN p_cod_emp VARCHAR(50)
)
BEGIN
    DELETE FROM empresa
    WHERE id_empresa = p_cod_emp;
END //

DELIMITER ;
