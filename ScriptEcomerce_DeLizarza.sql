CREATE DATABASE NexDrop;
USE NexDrop;

CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE proveedores (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100),
    direccion VARCHAR(200)
);

CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    id_categoria INT,
    id_proveedor INT
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefono VARCHAR(20)
);

CREATE TABLE metodos_pago (
    id_metodo INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    id_cliente INT,
    id_metodo INT,
    total DECIMAL(10,2) NOT NULL
);

CREATE TABLE detalle_venta (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL
);


ALTER TABLE productos
ADD CONSTRAINT fk_productos_categoria
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria);

ALTER TABLE productos
ADD CONSTRAINT fk_productos_proveedor
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor);

ALTER TABLE ventas
ADD CONSTRAINT fk_ventas_cliente
FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente);

ALTER TABLE ventas
ADD CONSTRAINT fk_ventas_metodo
FOREIGN KEY (id_metodo) REFERENCES metodos_pago(id_metodo);

ALTER TABLE detalle_venta
ADD CONSTRAINT fk_detalle_venta_venta
FOREIGN KEY (id_venta) REFERENCES ventas(id_venta);

ALTER TABLE detalle_venta
ADD CONSTRAINT fk_detalle_venta_producto
FOREIGN KEY (id_producto) REFERENCES productos(id_producto);


