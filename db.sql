CREATE TABLE `Transacciones`(
    `id_transaccion` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `transaccion_metodo` ENUM('Paypal.Bitcoin', 'Visa') NOT NULL DEFAULT 'Efectivo',
    `transaccion_fecha` DATETIME NOT NULL,
    `transaccion_total` BIGINT NOT NULL,
    `id_pedido_fk` BIGINT NOT NULL
);
CREATE TABLE `Pedidos`(
    `id_pedido` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `pedido_estado` ENUM('Procesado', 'Completado') NOT NULL DEFAULT 'Pediente',
    `detallepedido_id` BIGINT NOT NULL,
    `cliente_id` BIGINT NOT NULL
);
CREATE TABLE `Clientes`(
    `id_cliente` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente_nombre` VARCHAR(50) NOT NULL,
    `cliente_correoelectronico` VARCHAR(50) NOT NULL,
    `cliente_telefono` VARCHAR(50) NOT NULL,
    `id_direccion_fk` BIGINT NOT NULL
);
CREATE TABLE `Direccion`(
    `id_direccion` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `direccion_calle` VARCHAR(50) NOT NULL,
    `direccion_carrera` VARCHAR(50) NOT NULL,
    `direccion_numero` VARCHAR(50) NOT NULL,
    `id_barrio_fk` BIGINT NOT NULL
);
CREATE TABLE `Barrios`(
    `id_barrio` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `barrio_nombre` VARCHAR(50) NOT NULL,
    `id_ciudad_fk` BIGINT NOT NULL
);
CREATE TABLE `Ciudades`(
    `id_ciudad` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ciudad_nombre` VARCHAR(50) NOT NULL,
    `id_nacionalidad_fk` BIGINT NOT NULL
);
CREATE TABLE `Nacionalidad`(
    `id_nacionalidad` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `pais_nombre` VARCHAR(255) NOT NULL
);
CREATE TABLE `Autores`(
    `id_autor` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `autor_nombre` VARCHAR(255) NOT NULL,
    `autor_fecha_nacimiento` DATE NOT NULL,
    `id_nacionalidad_fk` BIGINT NOT NULL
);
CREATE TABLE `Propiedad`(
    `id_propiedad` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_autor_fk` BIGINT NOT NULL,
    `id_libro_fk` BIGINT NOT NULL
);
CREATE TABLE `Libros`(
    `id_libro` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `libro_titulo` VARCHAR(50) NOT NULL,
    `libro_precio` VARCHAR(50) NOT NULL,
    `libro_editorial` VARCHAR(50) NOT NULL,
    `libro_categoria` ENUM(
        'Fantasy',
        'Love',
        'Action',
        'Adventure'
    ) NOT NULL DEFAULT 'ninguno',
    `libros_ISBN` VARCHAR(255) NOT NULL,
    `libro_fechapublicacion` DATE NOT NULL,
    `libro_stock` INT NOT NULL
);
ALTER TABLE
    `Libros` ADD UNIQUE `libros_libros_isbn_unique`(`libros_ISBN`);
CREATE TABLE `DetallePedido`(
    `id_detalle_pedido` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `detalle_pedido_cantidad` INT NOT NULL,
    `id_pedido_fk` BIGINT NOT NULL,
    `id_libro_fk` BIGINT NOT NULL
);
ALTER TABLE
    `Barrios` ADD CONSTRAINT `barrios_id_ciudad_fk_foreign` FOREIGN KEY(`id_ciudad_fk`) REFERENCES `Ciudades`(`id_ciudad`);
ALTER TABLE
    `Pedidos` ADD CONSTRAINT `pedidos_pedido_estado_foreign` FOREIGN KEY(`pedido_estado`) REFERENCES `Transacciones`(`id_transaccion`);
ALTER TABLE
    `Autores` ADD CONSTRAINT `autores_id_nacionalidad_fk_foreign` FOREIGN KEY(`id_nacionalidad_fk`) REFERENCES `Nacionalidad`(`id_nacionalidad`);
ALTER TABLE
    `Clientes` ADD CONSTRAINT `clientes_id_cliente_foreign` FOREIGN KEY(`id_cliente`) REFERENCES `Direccion`(`id_direccion`);
ALTER TABLE
    `Clientes` ADD CONSTRAINT `clientes_cliente_nombre_foreign` FOREIGN KEY(`cliente_nombre`) REFERENCES `Pedidos`(`cliente_id`);
ALTER TABLE
    `Barrios` ADD CONSTRAINT `barrios_id_ciudad_fk_foreign` FOREIGN KEY(`id_ciudad_fk`) REFERENCES `Direccion`(`id_barrio_fk`);
ALTER TABLE
    `Propiedad` ADD CONSTRAINT `propiedad_id_autor_fk_foreign` FOREIGN KEY(`id_autor_fk`) REFERENCES `Autores`(`id_autor`);
ALTER TABLE
    `DetallePedido` ADD CONSTRAINT `detallepedido_id_pedido_fk_foreign` FOREIGN KEY(`id_pedido_fk`) REFERENCES `Pedidos`(`id_pedido`);
ALTER TABLE
    `DetallePedido` ADD CONSTRAINT `detallepedido_detalle_pedido_cantidad_foreign` FOREIGN KEY(`detalle_pedido_cantidad`) REFERENCES `Libros`(`id_libro`);
ALTER TABLE
    `Ciudades` ADD CONSTRAINT `ciudades_id_nacionalidad_fk_foreign` FOREIGN KEY(`id_nacionalidad_fk`) REFERENCES `Nacionalidad`(`id_nacionalidad`);
ALTER TABLE
    `Libros` ADD CONSTRAINT `libros_libro_precio_foreign` FOREIGN KEY(`libro_precio`) REFERENCES `Propiedad`(`id_propiedad`);
