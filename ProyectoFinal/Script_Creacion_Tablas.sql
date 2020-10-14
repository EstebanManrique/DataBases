-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PROYECTO_FINAL_TIENDA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PROYECTO_FINAL_TIENDA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PROYECTO_FINAL_TIENDA` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `PROYECTO_FINAL_TIENDA` ;

-- -----------------------------------------------------
-- Table `PROYECTO_FINAL_TIENDA`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO_FINAL_TIENDA`.`USUARIO` (
  `correo_electronico` VARCHAR(60) NOT NULL,
  `Nombre` VARCHAR(30) NOT NULL,
  `Apellidos` VARCHAR(50) NOT NULL,
  `Contraseña` VARCHAR(30) NOT NULL,
  `Direccion` VARCHAR(200) NULL,
  `Codigo_postal` VARCHAR(5) NULL,
  `Telefono` VARCHAR(10) NULL,
  `is_admin` CHAR(1) NOT NULL,
  PRIMARY KEY (`correo_electronico`, `Nombre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO_FINAL_TIENDA`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO_FINAL_TIENDA`.`CATEGORIA` (
  `Nombre_Cat` VARCHAR(25) NOT NULL,
  `Descripcion` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`Nombre_Cat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO_FINAL_TIENDA`.`INVENTARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO_FINAL_TIENDA`.`INVENTARIO` (
  `Clave_Producto` VARCHAR(10) NOT NULL,
  `Nombre_Producto` VARCHAR(45) NOT NULL,
  `Categoria_Producto` VARCHAR(25) NOT NULL,
  `Descripcion` VARCHAR(75) NOT NULL,
  `Color` VARCHAR(20) NOT NULL,
  `Talla` VARCHAR(2) NOT NULL,
  `Precio` DECIMAL(6,2) NOT NULL,
  `Fotografia` VARCHAR(150) NOT NULL,
  `Piezas_Disponibles` INT NOT NULL,
  PRIMARY KEY (`Clave_Producto`),
  INDEX `fk_INVENTARIO_CATEGORIA1_idx` (`Categoria_Producto` ASC),
  CONSTRAINT `fk_INVENTARIO_CATEGORIA1`
    FOREIGN KEY (`Categoria_Producto`)
    REFERENCES `PROYECTO_FINAL_TIENDA`.`CATEGORIA` (`Nombre_Cat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO_FINAL_TIENDA`.`CARRO_COMPRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO_FINAL_TIENDA`.`CARRO_COMPRA` (
  `correo_electronico` VARCHAR(60) NOT NULL,
  `Clave_Producto` VARCHAR(10) NOT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`correo_electronico`, `Clave_Producto`),
  INDEX `fk_CARRO_COMPRA_INVENTARIO1_idx` (`Clave_Producto` ASC),
  CONSTRAINT `fk_CARRO_COMPRA_INVENTARIO1`
    FOREIGN KEY (`Clave_Producto`)
    REFERENCES `PROYECTO_FINAL_TIENDA`.`INVENTARIO` (`Clave_Producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CARRO_COMPRA_USUARIO1`
    FOREIGN KEY (`correo_electronico`)
    REFERENCES `PROYECTO_FINAL_TIENDA`.`USUARIO` (`correo_electronico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO_FINAL_TIENDA`.`TRANSACCION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO_FINAL_TIENDA`.`TRANSACCION` (
  `No_Transaccion` INT NOT NULL AUTO_INCREMENT,
  `Correo_Cliente` VARCHAR(60) NOT NULL,
  `Nombre_cliente` VARCHAR(30) NOT NULL,
  `Fecha-Hora` DATETIME NOT NULL,
  `Forma_Pago` VARCHAR(20) NOT NULL,
  `Monto_total` DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (`No_Transaccion`),
  INDEX `fk_TRANSACCION_USUARIO1_idx` (`Correo_Cliente` ASC, `Nombre_cliente` ASC),
  CONSTRAINT `fk_TRANSACCION_USUARIO1`
    FOREIGN KEY (`Correo_Cliente` , `Nombre_cliente`)
    REFERENCES `PROYECTO_FINAL_TIENDA`.`USUARIO` (`correo_electronico` , `Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROYECTO_FINAL_TIENDA`.`PRODUCTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PROYECTO_FINAL_TIENDA`.`PRODUCTOS` (
  `Clave_Producto` VARCHAR(10) NOT NULL,
  `No_Transaccion` INT NOT NULL,
  `Cantidad` INT NOT NULL,
  PRIMARY KEY (`Clave_Producto`, `No_Transaccion`),
  INDEX `fk_PRODUCTOS_TRANSACCION1_idx` (`No_Transaccion` ASC),
  CONSTRAINT `fk_PRODUCTOS_INVENTARIO1`
    FOREIGN KEY (`Clave_Producto`)
    REFERENCES `PROYECTO_FINAL_TIENDA`.`INVENTARIO` (`Clave_Producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTOS_TRANSACCION1`
    FOREIGN KEY (`No_Transaccion`)
    REFERENCES `PROYECTO_FINAL_TIENDA`.`TRANSACCION` (`No_Transaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
