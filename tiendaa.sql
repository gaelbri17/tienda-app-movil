DROP DATABASE IF EXISTS tiendaa;


CREATE DATABASE tiendaa;

USE tiendaa;



CREATE TABLE administrador (
  id_administrador int(10) UNSIGNED NOT NULL,
  nombre_administrador varchar(50) NOT NULL,
  apellido_administrador varchar(50) NOT NULL,
  correo_administrador varchar(100) NOT NULL,
  alias_administrador varchar(25) NOT NULL,
  clave_administrador varchar(100) NOT NULL,
  fecha_registro datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE categoria (
  id_categoria int(10) UNSIGNED NOT NULL,
  nombre_categoria varchar(50) NOT NULL,
  descripcion_categoria varchar(250) DEFAULT NULL,
  imagen_categoria varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO categoria (
  id_categoria, 
  nombre_categoria, 
  descripcion_categoria, 
  imagen_categoria
) VALUES
(1, 'Refrescos', 'Bebidas gaseosas como Coca-Cola, Pepsi, etc.', 'refrescos.jpg'),
(2, 'Jugos', 'Jugos naturales y concentrados de frutas', 'jugos.jpg'),
(3, 'Aguas', 'Agua embotellada y con sabores', 'aguas.jpg'),
(4, 'Energéticas', 'Bebidas energéticas como Red Bull, Monster, etc.', 'energeticas.jpg'),
(5, 'Cerveza', 'Cervezas de diversas marcas y tipos', 'cerveza.jpg'),
(6, 'Vinos', 'Vinos tintos, blancos y rosados', 'vinos.jpg'),
(7, 'Licores', 'Licores y destilados como whisky, ron, etc.', 'licores.jpg'),
(8, 'Tés', 'Tés fríos y calientes de diferentes sabores', 'tes.jpg'),
(9, 'Café', 'Café en diversas presentaciones', 'cafe.jpg'),
(10, 'Bebidas isotónicas', 'Bebidas deportivas para rehidratación', 'isotonicas.jpg');

CREATE TABLE cliente (
  id_cliente int(10) UNSIGNED NOT NULL,
  nombre_cliente varchar(50) NOT NULL,
  apellido_cliente varchar(50) NOT NULL,
  dui_cliente varchar(10) NOT NULL,
  correo_cliente varchar(100) NOT NULL,
  telefono_cliente varchar(9) NOT NULL,
  direccion_cliente varchar(250) NOT NULL,
  nacimiento_cliente date NOT NULL,
  clave_cliente varchar(100) NOT NULL,
  estado_cliente tinyint(1) NOT NULL DEFAULT 1,
  fecha_registro date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



CREATE TABLE detalle_pedido (
  id_detalle int(10) UNSIGNED NOT NULL,
  id_producto int(10) UNSIGNED NOT NULL,
  cantidad_producto smallint(6) UNSIGNED NOT NULL,
  precio_producto decimal(5,2) UNSIGNED NOT NULL,
  id_pedido int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO detalle_pedido (
  id_detalle, 
  id_producto, 
  cantidad_producto, 
  precio_producto, 
  id_pedido
) VALUES
(1, 1, 2, 1.50, 1),
(2, 2, 1, 1.75, 1),
(3, 3, 3, 0.99, 2),
(4, 4, 1, 2.50, 2),
(5, 5, 4, 1.25, 3),
(6, 1, 2, 1.50, 4),
(7, 3, 2, 0.99, 5),
(8, 6, 1, 3.00, 5),
(9, 2, 5, 1.75, 6),
(10, 7, 3, 2.00, 7);


CREATE TABLE pedido (
  id_pedido int(10) UNSIGNED NOT NULL,
  id_cliente int(10) UNSIGNED NOT NULL,
  direccion_pedido varchar(250) NOT NULL,
  estado_pedido enum('Pendiente','Finalizado','Entregado','Anulado') NOT NULL,
  fecha_registro date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO pedido (
  id_pedido, 
  id_cliente, 
  direccion_pedido, 
  estado_pedido, 
  fecha_registro
) VALUES
(1, 2, 'Av. Siempre Viva 742', 'Pendiente', '2024-08-01'),
(2, 3, 'Calle Falsa 123', 'Finalizado', '2024-08-02'),
(3, 4, 'Calle Luna 456', 'Entregado', '2024-08-03'),
(4, 5, 'Calle Sol 789', 'Pendiente', '2024-08-04'),
(5, 6, 'Av. Libertad 101', 'Anulado', '2024-08-05'),
(6, 7, 'Calle Justicia 202', 'Entregado', '2024-08-06'),
(7, 8, 'Calle Esperanza 303', 'Finalizado', '2024-08-07'),
(8, 9, 'Av. Revolución 404', 'Pendiente', '2024-08-08'),
(9, 10, 'Calle Victoria 505', 'Finalizado', '2024-08-09'),
(10, 11, 'Calle Patria 606', 'Entregado', '2024-08-10');




CREATE TABLE producto (
  id_producto int(10) UNSIGNED NOT NULL,
  nombre_producto varchar(50) NOT NULL,
  descripcion_producto varchar(250) NOT NULL,
  precio_producto decimal(5,2) NOT NULL,
  existencias_producto int(10) UNSIGNED NOT NULL,
  imagen_producto varchar(25) NOT NULL,
  id_categoria int(10) UNSIGNED NOT NULL,
  estado_producto tinyint(1) NOT NULL,
  id_administrador int(10) UNSIGNED NOT NULL,
  fecha_registro date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



INSERT INTO producto (
  id_producto, 
  nombre_producto, 
  descripcion_producto, 
  precio_producto, 
  existencias_producto, 
  imagen_producto, 
  id_categoria, 
  estado_producto, 
  id_administrador, 
  fecha_registro
) VALUES
(1, 'Coca-Cola', 'Refresco gaseoso sabor cola', 1.25, 100, 'coca_cola.jpg', 1, 1, 1, '2024-08-01'),
(2, 'Pepsi', 'Refresco gaseoso sabor cola', 1.20, 150, 'pepsi.jpg', 1, 1, 1, '2024-08-02'),
(3, 'Fanta Naranja', 'Refresco gaseoso sabor naranja', 1.30, 80, 'fanta_naranja.jpg', 1, 1, 1, '2024-08-03'),
(4, 'Sprite', 'Refresco gaseoso sabor limón', 1.25, 90, 'sprite.jpg', 1, 1, 1, '2024-08-04'),
(5, 'Red Bull', 'Bebida energética', 2.00, 70, 'red_bull.jpg', 4, 1, 1, '2024-08-05'),
(6, 'Monster', 'Bebida energética', 2.50, 50, 'monster.jpg', 4, 1, 1, '2024-08-06'),
(7, 'Agua Pura', 'Agua embotellada', 0.80, 200, 'agua_pura.jpg', 3, 1, 1, '2024-08-07'),
(8, 'Agua Perrier', 'Agua mineral con gas', 1.75, 60, 'perrier.jpg', 3, 1, 1, '2024-08-08'),
(9, 'Gatorade', 'Bebida isotónica sabor naranja', 1.50, 120, 'gatorade.jpg', 10, 1, 1, '2024-08-09'),
(10, 'Powerade', 'Bebida isotónica sabor uva', 1.50, 110, 'powerade.jpg', 10, 1, 1, '2024-08-10');


ALTER TABLE administrador
  ADD PRIMARY KEY (id_administrador),
  ADD UNIQUE KEY correo_usuario (correo_administrador),
  ADD UNIQUE KEY alias_usuario (alias_administrador);


ALTER TABLE categoria
  ADD PRIMARY KEY (id_categoria),
  ADD UNIQUE KEY nombre_categoria (nombre_categoria);


ALTER TABLE cliente
  ADD PRIMARY KEY (id_cliente),
  ADD UNIQUE KEY dui_cliente (dui_cliente),
  ADD UNIQUE KEY correo_cliente (correo_cliente);


ALTER TABLE detalle_pedido
  ADD PRIMARY KEY (id_detalle),
  ADD KEY id_producto (id_producto),
  ADD KEY id_pedido (id_pedido);


ALTER TABLE pedido
  ADD PRIMARY KEY (id_pedido),
  ADD KEY id_cliente (id_cliente);


ALTER TABLE producto
  ADD PRIMARY KEY (id_producto),
  ADD UNIQUE KEY nombre_producto (nombre_producto,id_categoria),
  ADD KEY id_categoria (id_categoria),
  ADD KEY id_usuario (id_administrador);


ALTER TABLE administrador
  MODIFY id_administrador int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE categoria
  MODIFY id_categoria int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

INSERT INTO cliente (
  id_cliente, 
  nombre_cliente, 
  apellido_cliente, 
  dui_cliente, 
  correo_cliente, 
  telefono_cliente, 
  direccion_cliente, 
  nacimiento_cliente, 
  clave_cliente, 
  estado_cliente, 
  fecha_registro
) VALUES 
(2, 'Juan', 'Pérez', '12345678-9', 'juan.perez@example.com', '123456789', 'Av. Siempre Viva 742', '1990-01-01', '12345', 1, '2024-08-01'),
(3, 'María', 'González', '98765432-1', 'maria.gonzalez@example.com', '987654321', 'Calle Falsa 123', '1988-05-10', '54321', 1, '2024-08-01'),
(4, 'Carlos', 'Ramírez', '11223344-5', 'carlos.ramirez@example.com', '112233445', 'Calle Luna 456', '1992-07-20', 'password1', 1, '2024-08-01'),
(5, 'Ana', 'López', '22334455-6', 'ana.lopez@example.com', '223344556', 'Calle Sol 789', '1995-11-30', 'password2', 1, '2024-08-01'),
(6, 'Luis', 'Fernández', '33445566-7', 'luis.fernandez@example.com', '334455667', 'Av. Libertad 101', '1985-04-15', 'password3', 1, '2024-08-01'),
(7, 'Laura', 'Martínez', '44556677-8', 'laura.martinez@example.com', '445566778', 'Calle Justicia 202', '1993-09-25', 'password4', 1, '2024-08-01'),
(8, 'David', 'Gómez', '55667788-9', 'david.gomez@example.com', '556677889', 'Calle Esperanza 303', '1987-03-14', 'password5', 1, '2024-08-01'),
(9, 'Sofía', 'Hernández', '66778899-0', 'sofia.hernandez@example.com', '667788990', 'Av. Revolución 404', '1991-06-06', 'password6', 1, '2024-08-01'),
(10, 'Miguel', 'Ruiz', '77889900-1', 'miguel.ruiz@example.com', '778899001', 'Calle Victoria 505', '1989-12-12', 'password7', 1, '2024-08-01'),
(11, 'Elena', 'Vargas', '88990011-2', 'elena.vargas@example.com', '889900112', 'Calle Patria 606', '1994-08-18', 'password8', 1, '2024-08-01');

ALTER TABLE cliente MODIFY id_cliente int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE cliente
  MODIFY id_cliente int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE detalle_pedido
  MODIFY id_detalle int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE pedido
  MODIFY id_pedido int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE producto
  MODIFY id_producto int(10) UNSIGNED NOT NULL AUTO_INCREMENT;



ALTER TABLE detalle_pedido
  ADD CONSTRAINT detalle_pedido_ibfk_1 FOREIGN KEY (id_producto) REFERENCES producto (id_producto) ON UPDATE CASCADE,
  ADD CONSTRAINT detalle_pedido_ibfk_2 FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido) ON UPDATE CASCADE;


ALTER TABLE pedido
  ADD CONSTRAINT pedido_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES `cliente` (id_cliente) ON UPDATE CASCADE;


ALTER TABLE producto
  ADD CONSTRAINT producto_ibfk_1 FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria) ON UPDATE CASCADE,
  ADD CONSTRAINT producto_ibfk_2 FOREIGN KEY (id_administrador) REFERENCES administrador (id_administrador) ON UPDATE CASCADE;
COMMIT;

SELECT nombre_categoria, ROUND((COUNT(id_producto) * 100.0 / (SELECT COUNT(id_producto) FROM producto)), 2) porcentaje
                FROM producto
                INNER JOIN categoria USING(id_categoria)
                GROUP BY nombre_categoria ORDER BY porcentaje DESC
                
                
SELECT 
                CONCAT(c.nombre_cliente, ' ', c.apellido_cliente) AS nombre_cliente, 
                COUNT(p.id_pedido) AS cantidad_de_pedidos
                FROM 
                    cliente c
                INNER JOIN 
                    pedido p ON c.id_cliente = p.id_cliente
                GROUP BY 
                    c.id_cliente
                ORDER BY 
                    cantidad_de_pedidos DESC
                LIMIT 5;

SELECT * FROM administrador;


