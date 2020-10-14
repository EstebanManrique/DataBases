-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema EXAMEN2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema EXAMEN2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `EXAMEN2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `EXAMEN2` ;

-- -----------------------------------------------------
-- Table `EXAMEN2`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXAMEN2`.`CATEGORIA` (
  `nombrec` INT NOT NULL,
  `descrip` VARCHAR(250) NOT NULL,
  `encarg` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`nombrec`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EXAMEN2`.`PLATO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXAMEN2`.`PLATO` (
  `nombrep` VARCHAR(60) NOT NULL,
  `descrip` VARCHAR(250) NOT NULL,
  `nivel` VARCHAR(30) NOT NULL,
  `foto` VARCHAR(400) NOT NULL,
  `precio` DECIMAL(5,2) NOT NULL,
  `categoria` INT NULL,
  PRIMARY KEY (`nombrep`),
  INDEX `fk_PLATO_CATEGORIA_idx` (`categoria` ASC) VISIBLE,
  CONSTRAINT `fk_PLATO_CATEGORIA`
    FOREIGN KEY (`categoria`)
    REFERENCES `EXAMEN2`.`CATEGORIA` (`nombrec`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EXAMEN2`.`INGRED`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXAMEN2`.`INGRED` (
  `nombrei` VARCHAR(60) NOT NULL,
  `unidades` VARCHAR(30) NOT NULL,
  `almacen` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`nombrei`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `EXAMEN2`.`PLATO_UTILIZA_INGRED`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `EXAMEN2`.`PLATO_UTILIZA_INGRED` (
  `nombrep` VARCHAR(60) NOT NULL,
  `nombrei` VARCHAR(60) NOT NULL,
  `cantidad` INT(5) NOT NULL,
  PRIMARY KEY (`nombrep`, `nombrei`),
  INDEX `fk_PLATO_UTILIZA_INGRED_INGRED1_idx` (`nombrei` ASC) VISIBLE,
  CONSTRAINT `fk_PLATO_UTILIZA_INGRED_PLATO1`
    FOREIGN KEY (`nombrep`)
    REFERENCES `EXAMEN2`.`PLATO` (`nombrep`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PLATO_UTILIZA_INGRED_INGRED1`
    FOREIGN KEY (`nombrei`)
    REFERENCES `EXAMEN2`.`INGRED` (`nombrei`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
