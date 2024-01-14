-- CreateTable
CREATE TABLE `productos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(20) NOT NULL,
    `stock` INTEGER NOT NULL DEFAULT 0,
    `precio` DECIMAL(12, 2) NOT NULL,
    `categoria` VARCHAR(20) NULL,
    `fecha_actualizacion` TIMESTAMP(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `compras` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fecha` TIMESTAMP(0) NOT NULL,
    `proveedor` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `linea_compras` (
    `id_compra` INTEGER NOT NULL,
    `linea` INTEGER NOT NULL,
    `id_producto` INTEGER NOT NULL,
    `cantidad` INTEGER NOT NULL,
    `precio_unitario` DECIMAL(12, 2) NOT NULL,

    PRIMARY KEY (`linea`, `id_compra`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ventas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fecha` TIMESTAMP(0) NOT NULL,
    `cliente` VARCHAR(50) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `linea_ventas` (
    `id_venta` INTEGER NOT NULL,
    `linea` INTEGER NOT NULL,
    `id_producto` INTEGER NOT NULL,
    `cantidad` INTEGER NOT NULL,
    `precio_unitario` DECIMAL(12, 2) NOT NULL,

    PRIMARY KEY (`linea`, `id_venta`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `linea_compras` ADD CONSTRAINT `linea_compras_id_compra_fkey` FOREIGN KEY (`id_compra`) REFERENCES `compras`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `linea_compras` ADD CONSTRAINT `linea_compras_id_producto_fkey` FOREIGN KEY (`id_producto`) REFERENCES `productos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `linea_ventas` ADD CONSTRAINT `linea_ventas_id_venta_fkey` FOREIGN KEY (`id_venta`) REFERENCES `ventas`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `linea_ventas` ADD CONSTRAINT `linea_ventas_id_producto_fkey` FOREIGN KEY (`id_producto`) REFERENCES `productos`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
