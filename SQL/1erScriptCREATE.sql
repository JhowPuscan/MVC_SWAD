-- MySQL Script generated by MySQL Workbench
-- Wed Sep 11 22:19:19 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------

Drop SCHEMA `BDCamas`;
CREATE SCHEMA IF NOT EXISTS `BDCamas` DEFAULT CHARACTER SET utf8 ;
USE `BDCamas` ;

-- -----------------------------------------------------
-- Table `BDCamas`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Categorias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(245) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `BDCamas`.`EstadosProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`EstadosProducto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(245) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `BDCamas`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Proveedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `empresa` VARCHAR(245) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `direccion` VARCHAR(245) NOT NULL,
  `correo` VARCHAR(100) NULL,
  `ruc` VARCHAR(11) NOT NULL unique,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(245) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `precioCompra` DOUBLE NOT NULL,
  `precioVenta` DOUBLE NOT NULL,
  `idCategoria` INT NOT NULL,
  `idEstado` INT NOT NULL,
  `idProveedor` INT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Productos_Categorias_idx` (`idCategoria` ASC) VISIBLE,
  INDEX `fk_Productos_EstadosProducto1_idx` (`idEstado` ASC) VISIBLE,
  INDEX `fk_Productos_Proveedores1_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `fk_Productos_Categorias`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `BDCamas`.`Categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_EstadosProducto1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `BDCamas`.`EstadosProducto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Productos_Proveedores1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `BDCamas`.`Proveedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`Imagenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Imagenes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idProducto` INT NOT NULL,
  `img` TEXT NULL,
  `esPrincipal` BOOLEAN DEFAULT FALSE,
  PRIMARY KEY (`id`),
    CONSTRAINT `fk_Productos_IMAGEN`
    FOREIGN KEY (`idProducto`)
    REFERENCES `BDCamas`.`Productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `BDCamas`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(245) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`EstadosEmpleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`EstadosEmpleado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(245) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`Empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Empleados` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dni` CHAR(10) NOT NULL,
  `nombres` VARCHAR(245) NOT NULL,
  `apePaterno` VARCHAR(245) NOT NULL,
  `apeMaterno` VARCHAR(245) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `contra` VARCHAR(245) NOT NULL,
  `telefono` VARCHAR(15) NULL,
  `idRol` INT NOT NULL,
  `idEstado` INT NOT NULL, 
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Usuarios_Roles1_idx` (`idRol` ASC) VISIBLE,
  INDEX `fk_Usuarios_EstadosUsuario1_idx` (`idEstado` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE,
  CONSTRAINT `fk_Usuarios_Roles1`
    FOREIGN KEY (`idRol`)
    REFERENCES `BDCamas`.`Roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuarios_EstadosUsuario1`
    FOREIGN KEY (`idEstado`)
    REFERENCES `BDCamas`.`EstadosEmpleado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
  CREATE TABLE IF NOT EXISTS `BDCamas`.`IntentosSession` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idEmpleado` int NOT NULL,
  `ip` varchar(20) NOT NULL,
  `cantidad` int NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hora` time NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE ,
    CONSTRAINT `fk_Usuarios_Session1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `BDCamas`.`Empleados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `BDCamas`.`HistorialSesion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idEmpleado` INT NOT NULL,
  `ip`VARCHAR(15) NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
CONSTRAINT `fk_Usuarios_Session`
FOREIGN KEY (`idEmpleado`)
REFERENCES `BDCamas`.`Empleados` (`id`)
ON DELETE CASCADE
ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `BDCamas`.`Stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Stock` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idProducto` INT NOT NULL,
  `ubicacion` VARCHAR(245) NOT NULL,
  `cantidad` INT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Stock_Productos1_idx` (`idProducto` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Stock_Productos1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `BDCamas`.`Productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(245) NOT NULL,
  `apePaterno` VARCHAR(245) NOT NULL,
  `apeMaterno` VARCHAR(245) NOT NULL,
  `dni` VARCHAR(10) NULL,
  `telefono` VARCHAR(9) NULL,
  `correo` VARCHAR(100) NULL,
  `contra` VARCHAR(245) NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `BDCamas`.`MetodoPago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`MetodoPago` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(145) NOT NULL,
  `descripcion` VARCHAR(245) NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`TipoComprobante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`TipoComprobante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(145) NOT NULL,
  `descripcion` VARCHAR(245) NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`Comprobante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Comprobante` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `monto` DOUBLE NOT NULL,
  `fecha` DATE  NOT NULL,
  `hora` TIME  NOT NULL ,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  `idTipoComprobante` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comprobante_TipoComprobante1_idx` (`idTipoComprobante` ASC) VISIBLE,
  CONSTRAINT `fk_Comprobante_TipoComprobante1`
    FOREIGN KEY (`idTipoComprobante`)
    REFERENCES `BDCamas`.`TipoComprobante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Ventas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `impuesto` double null,
  `total` DOUBLE NULL,
  `descuento` DOUBLE NULL,
  `idMetodoPago` INT NOT NULL,
  `horaVenta` TIME  NOT NULL ,
  `idComprobante` INT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  INDEX `fk_Ventas_Clientes1_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_Ventas_Usuarios1_idx` (`idEmpleado` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Ventas_MetodoPago1_idx` (`idMetodoPago` ASC) VISIBLE,
  INDEX `fk_Ventas_Comprobante1_idx` (`idComprobante` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Clientes1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `BDCamas`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_Usuarios1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `BDCamas`.`Empleados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_MetodoPago1`
    FOREIGN KEY (`idMetodoPago`)
    REFERENCES `BDCamas`.`MetodoPago` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ventas_Comprobante1`
    FOREIGN KEY (`idComprobante`)
    REFERENCES `BDCamas`.`Comprobante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`DetallesVenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`DetallesVenta` (
  `idVenta` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  INDEX `fk_Detalles_Venta_Ventas1_idx` (`idVenta` ASC) VISIBLE,
  PRIMARY KEY (`idVenta`),
  INDEX `fk_DetallesVenta_Productos1_idx` (`idProducto` ASC) VISIBLE,
  CONSTRAINT `fk_Detalles_Venta_Ventas1`
    FOREIGN KEY (`idVenta`)
    REFERENCES `BDCamas`.`Ventas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetallesVenta_Productos1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `BDCamas`.`Productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`Direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Direcciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `direccion` TEXT NOT NULL,
  `distrito` TEXT NOT NULL,
  `referencia` TEXT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Direcciones_Clientes1_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Direcciones_Clientes1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `BDCamas`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`EstadosEnvio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`EstadosEnvio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(245) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`Transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Transporte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(245) NOT NULL,
  `modelo` VARCHAR(245) NOT NULL,
  `marca` VARCHAR(245) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`Envios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Envios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idEmpleado` INT NOT NULL,
  `idTransporte` INT NOT NULL,
  `idVenta` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `horaEntrega` TIME  NOT NULL ,
  `horaSalida` TIME  NOT NULL ,
  `idEstadoEnvio` INT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Envios_Usuarios1_idx` (`idEmpleado` ASC) VISIBLE,
  INDEX `fk_Envios_Ventas1_idx` (`idVenta` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Envios_EstadosEnvio1_idx` (`idEstadoEnvio` ASC) VISIBLE,
  INDEX `fk_Envios_Transporte1_idx` (`idTransporte` ASC) VISIBLE,
  CONSTRAINT `fk_Envios_Usuarios1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `BDCamas`.`Empleados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Envios_Ventas1`
    FOREIGN KEY (`idVenta`)
    REFERENCES `BDCamas`.`Ventas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Envios_EstadosEnvio1`
    FOREIGN KEY (`idEstadoEnvio`)
    REFERENCES `BDCamas`.`EstadosEnvio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Envios_Transporte1`
    FOREIGN KEY (`idTransporte`)
    REFERENCES `BDCamas`.`Transporte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`EstadosCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`EstadosCompra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(245) NOT NULL,
  `descripcion` VARCHAR(245) NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`ProveedorContacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`ProveedorContacto` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(245) NOT NULL,
  `telefono` VARCHAR(11) NOT NULL,
  `idProveedor` INT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ProveedorContacto_Proveedores1_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `fk_ProveedorContacto_Proveedores1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `BDCamas`.`Proveedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`Compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`Compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `total` DOUBLE NULL,
  `idEmpleado` INT NOT NULL,
  `idEstadoCompra` INT NOT NULL,
  `idProveedor` INT UNSIGNED NOT NULL,
  `horaCompra` TIME  NOT NULL ,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  `idComprobante` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Compras_Usuarios1_idx` (`idEmpleado` ASC) VISIBLE,
  INDEX `fk_Compras_Estado1_idx` (`idEstadoCompra` ASC) VISIBLE,
  INDEX `fk_Compras_ProveedorContacto1_idx` (`idProveedor` ASC) VISIBLE,
  INDEX `fk_Compras_Comprobante1_idx` (`idComprobante` ASC) VISIBLE,
  CONSTRAINT `fk_Compras_Usuarios1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `BDCamas`.`Empleados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compras_Estado1`
    FOREIGN KEY (`idEstadoCompra`)
    REFERENCES `BDCamas`.`EstadosCompra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compras_ProveedorContacto1`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `BDCamas`.`ProveedorContacto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Compras_Comprobante1`
    FOREIGN KEY (`idComprobante`)
    REFERENCES `BDCamas`.`Comprobante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDCamas`.`DetallesCompra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BDCamas`.`DetallesCompra` (
  `idCompra` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `fechaCreación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usuarioCreador` INT NOT NULL,
  `fechaModificación` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuarioModificador` INT NOT NULL,
  INDEX `fk_DetalllesCompra_Productos1_idx` (`idProducto` ASC) VISIBLE,
  INDEX `fk_DetallesCompra_Compras1_idx` (`idCompra` ASC) VISIBLE,
  CONSTRAINT `fk_DetalllesCompra_Productos1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `BDCamas`.`Productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetallesCompra_Compras1`
    FOREIGN KEY (`idCompra`)
    REFERENCES `BDCamas`.`Compras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


