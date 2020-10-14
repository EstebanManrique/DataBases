-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TAREA8_COMPAAEREA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TAREA8_COMPAAEREA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TAREA8_COMPAAEREA` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `TAREA8_COMPAAEREA` ;

-- -----------------------------------------------------
-- Table `TAREA8_COMPAAEREA`.`BASE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TAREA8_COMPAAEREA`.`BASE` (
  `Número de Base` INT(6) NOT NULL,
  `Dirección` VARCHAR(145) NOT NULL,
  `Capacidad Aviones` INT(3) NOT NULL,
  `Capacidad Empleados` INT(3) NOT NULL,
  PRIMARY KEY (`Número de Base`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TAREA8_COMPAAEREA`.`AVION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TAREA8_COMPAAEREA`.`AVION` (
  `Código Avión` VARCHAR(30) NOT NULL,
  `Modelo` VARCHAR(30) NOT NULL,
  `Base Asignada` INT(6) NOT NULL,
  PRIMARY KEY (`Código Avión`),
  INDEX `fk_AVION_BASE1_idx` (`Base Asignada` ASC),
  CONSTRAINT `fk_AVION_BASE1`
    FOREIGN KEY (`Base Asignada`)
    REFERENCES `TAREA8_COMPAAEREA`.`BASE` (`Número de Base`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TAREA8_COMPAAEREA`.`VUELO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TAREA8_COMPAAEREA`.`VUELO` (
  `# de vuelo` VARCHAR(7) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Origen` VARCHAR(45) NOT NULL,
  `Destino` VARCHAR(45) NOT NULL,
  `Hora de salida` TIME NOT NULL,
  `Código Avión` VARCHAR(30) NOT NULL,
  `# horas de vuelo generadas` INT(2) NOT NULL,
  PRIMARY KEY (`# de vuelo`, `Fecha`),
  INDEX `fk_VUELO_AVION1_idx` (`Código Avión` ASC),
  CONSTRAINT `fk_VUELO_AVION1`
    FOREIGN KEY (`Código Avión`)
    REFERENCES `TAREA8_COMPAAEREA`.`AVION` (`Código Avión`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TAREA8_COMPAAEREA`.`EMPLEADO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TAREA8_COMPAAEREA`.`EMPLEADO` (
  `Código Empleado` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(60) NOT NULL,
  `Apellidos` VARCHAR(60) NOT NULL,
  `Base` INT(6) NOT NULL,
  `Piloto/Cabina` CHAR(1) NOT NULL,
  PRIMARY KEY (`Código Empleado`),
  INDEX `fk_EMPLEADO_BASE1_idx` (`Base` ASC),
  CONSTRAINT `fk_EMPLEADO_BASE1`
    FOREIGN KEY (`Base`)
    REFERENCES `TAREA8_COMPAAEREA`.`BASE` (`Número de Base`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TAREA8_COMPAAEREA`.`EMPLEADO_PARTICIPA_VUELO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TAREA8_COMPAAEREA`.`EMPLEADO_PARTICIPA_VUELO` (
  `# de tripulación` INT(10) NOT NULL,
  `Código Empleado` VARCHAR(10) NOT NULL,
  `Número de vuelo` VARCHAR(7) NOT NULL,
  `Código Avión` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`# de tripulación`),
  INDEX `fk_EMPLEADO_PARTICIPA_VUELO_EMPLEADO_idx` (`Código Empleado` ASC),
  INDEX `fk_EMPLEADO_PARTICIPA_VUELO_VUELO1_idx` (`Número de vuelo` ASC),
  INDEX `fk_EMPLEADO_PARTICIPA_VUELO_AVION1_idx` (`Código Avión` ASC),
  CONSTRAINT `fk_EMPLEADO_PARTICIPA_VUELO_EMPLEADO`
    FOREIGN KEY (`Código Empleado`)
    REFERENCES `TAREA8_COMPAAEREA`.`EMPLEADO` (`Código Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_PARTICIPA_VUELO_VUELO1`
    FOREIGN KEY (`Número de vuelo`)
    REFERENCES `TAREA8_COMPAAEREA`.`VUELO` (`# de vuelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_PARTICIPA_VUELO_AVION1`
    FOREIGN KEY (`Código Avión`)
    REFERENCES `TAREA8_COMPAAEREA`.`AVION` (`Código Avión`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
