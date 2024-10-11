
# Eliminando objetos si ya existen
DROP DATABASE IF EXISTS bdProyectoVentas;
CREATE DATABASE bdProyectoVentas;
USE bdProyectoVentas;


CREATE TABLE Usuario (
    id_email VARCHAR(100) PRIMARY KEY,
    contraseña VARCHAR(255) NOT NULL
);

-- Población inicial de Usuario
INSERT INTO Usuario (id_email, contraseña)
VALUES 
('jperez@gmail.com', '123qwe'),
('mgomez@gmail.com', '123qwe');


CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(9) NOT NULL,
    email VARCHAR(100) NOT NULL,
    dni VARCHAR(8) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL,
    CONSTRAINT fk_usuario FOREIGN KEY (email) REFERENCES Usuario(id_email)
);

-- Población inicial de Cliente
INSERT INTO Cliente (nombre, direccion, telefono, email, dni, contraseña)
VALUES 
('Juan Pérez', '123 Malecon, Barranco', '987654321', 'jperez@gmail.com', '12345678', '123qwe'),
('María Gómez', '456 Calle Mercado Central, Santa Anita', '123456789', 'mgomez@gmail.com', '87654321', '123qwe');



CREATE TABLE Empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
);


-- Población inicial de Empresa
INSERT INTO Empresa (nombre_empresa, direccion, telefono, email) 
VALUES 
('Fashion Supplier', '123 Calle Moda, Lima', '123456789', 'contacto@fashionsupplier.com'),
('Urban Wear', '456 Avenida Estilo, Lima', '987654321', 'ventas@urbanwear.com');



CREATE TABLE Marca (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    marca_producto VARCHAR(100) NOT NULL,
    descripcion TEXT
);

-- Población inicial de Marca
INSERT INTO Marca (marca_producto, descripcion) 
VALUES 
('Nike', 'Marca deportiva internacional'),
('Adidas', 'Marca de ropa y calzado deportivo'),
('Puma', 'Marca de ropa deportiva y urbana');




CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    id_empresa INT,
    id_marca INT,
    CONSTRAINT fk_empresa FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa),
    CONSTRAINT fk_marca FOREIGN KEY (id_marca) REFERENCES Marca(id_marca)
);

-- Población inicial de Producto
INSERT INTO Producto (nombre_producto, descripcion, precio, stock, id_empresa, id_marca)
VALUES 
('Zapatillas Air Max', 'Zapatillas deportivas para correr', 150.00, 30, 1, 1),
('Camiseta Dry-Fit', 'Camiseta de alto rendimiento para entrenamientos', 35.50, 100, 1, 2),
('Pantalón Jogger', 'Pantalón estilo casual y urbano', 60.00, 50, 2, 3);



CREATE TABLE CarritoCompras (
    id_carrito INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    productos TEXT,  -- Se puede usar un formato JSON para almacenar múltiples productos
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);
CREATE TABLE Pedido (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_carrito INT,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR(50),
    fecha_entrega DATE,
    CONSTRAINT fk_carrito FOREIGN KEY (id_carrito) REFERENCES CarritoCompras(id_carrito)
);
CREATE TABLE Pago (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    metodo_pago VARCHAR(50) NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT fk_pedido FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);
CREATE TABLE Envio (
    id_envio INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    direccion VARCHAR(255) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    fecha DATE NOT NULL,
    CONSTRAINT fk_pedido_envio FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);
CREATE TABLE FacturaBoleta (
    id_documento INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    tipo_documento ENUM('Factura', 'Boleta') NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_pedido_factura FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);






SELECT p.nombre_producto, p.precio, m.marca_producto
FROM Producto p
JOIN Empresa e ON p.id_empresa = e.id_empresa
JOIN Marca m ON p.id_marca = m.id_marca
WHERE e.nombre_empresa = 'Nombre de la Empresa';


SELECT p.id_pedido, p.fecha_pedido, p.estado, pb.tipo_documento, pb.total
FROM Pedido p
JOIN CarritoCompras c ON p.id_carrito = c.id_carrito
JOIN Cliente cl ON c.id_cliente = cl.id_cliente
JOIN FacturaBoleta pb ON p.id_pedido = pb.id_pedido
WHERE cl.id_cliente = 1;
