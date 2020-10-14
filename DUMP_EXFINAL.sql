-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EXAMEN_FINAL
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EXAMEN_FINAL
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EXAMEN_FINAL` DEFAULT CHARACTER SET utf8 ;
USE `EXAMEN_FINAL` ;

-- -----------------------------------------------------
-- Table `EXAMEN_FINAL`.`CONDUCTOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXAMEN_FINAL`.`CONDUCTOR` (
  `ID_Empleado` VARCHAR(8) NOT NULL,
  `Nombre` VARCHAR(35) NOT NULL,
  `Apellidos` VARCHAR(65) NOT NULL,
  `Sexo` CHAR(1) NOT NULL,
  `Fecha_nacimiento` DATE NOT NULL,
  PRIMARY KEY (`ID_Empleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EXAMEN_FINAL`.`CLIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXAMEN_FINAL`.`CLIENTE` (
  `ID_Cliente` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(35) NOT NULL,
  `Apellidos` VARCHAR(65) NOT NULL,
  `Telefono` VARCHAR(10) NOT NULL,
  `Direccion_Registrada` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`ID_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EXAMEN_FINAL`.`ENVIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXAMEN_FINAL`.`ENVIO` (
  `no_envio` VARCHAR(12) NOT NULL,
  `Fecha_envio` DATETIME NOT NULL,
  `ID_Cliente` VARCHAR(10) NOT NULL,
  `ID_Emplado` VARCHAR(8) NOT NULL,
  `Direccion_Envio` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`no_envio`),
  INDEX `fk_ENVIO_CLIENTE1_idx` (`ID_Cliente` ASC) VISIBLE,
  INDEX `fk_ENVIO_CONDUCTOR1_idx` (`ID_Emplado` ASC) VISIBLE,
  CONSTRAINT `fk_ENVIO_CLIENTE1`
    FOREIGN KEY (`ID_Cliente`)
    REFERENCES `EXAMEN_FINAL`.`CLIENTE` (`ID_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENVIO_CONDUCTOR1`
    FOREIGN KEY (`ID_Emplado`)
    REFERENCES `EXAMEN_FINAL`.`CONDUCTOR` (`ID_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EXAMEN_FINAL`.`INTENTO_ENTREGA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXAMEN_FINAL`.`INTENTO_ENTREGA` (
  `no_envio` VARCHAR(12) NOT NULL,
  `no_intento` VARCHAR(45) NOT NULL,
  `Fecha_intento` DATETIME NOT NULL,
  `Razin_Falla` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`no_envio`, `no_intento`),
  CONSTRAINT `fk_INTENTO_ENTREGA_ENVIO1`
    FOREIGN KEY (`no_envio`)
    REFERENCES `EXAMEN_FINAL`.`ENVIO` (`no_envio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EXAMEN_FINAL`.`PRODUCTO_ENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXAMEN_FINAL`.`PRODUCTO_ENT` (
  `no_envio` VARCHAR(12) NOT NULL,
  `Nombre_Prod` VARCHAR(60) NOT NULL,
  `Cantidad` INT NOT NULL,
  `Descripcion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`no_envio`, `Nombre_Prod`),
  CONSTRAINT `fk_PRODUCTO_ENT_ENVIO`
    FOREIGN KEY (`no_envio`)
    REFERENCES `EXAMEN_FINAL`.`ENVIO` (`no_envio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
