-- MySQL Script generated by MySQL Workbench
-- mar 15 nov 2022 12:32:50
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BDBlog
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `BDBlog` ;

-- -----------------------------------------------------
-- Schema BDBlog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BDBlog` DEFAULT CHARACTER SET utf8 ;
USE `BDBlog` ;

-- -----------------------------------------------------
-- Table `BDBlog`.`perfil`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDBlog`.`perfil` ;

CREATE TABLE IF NOT EXISTS `BDBlog`.`perfil` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Pais` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDBlog`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDBlog`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `BDBlog`.`Usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `fechacreacion` DATE NULL,
  `perfil_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Usuario_perfil_idx` (`perfil_id` ASC) ,
  CONSTRAINT `fk_Usuario_perfil`
    FOREIGN KEY (`perfil_id`)
    REFERENCES `BDBlog`.`perfil` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDBlog`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDBlog`.`Categoria` ;

CREATE TABLE IF NOT EXISTS `BDBlog`.`Categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDBlog`.`Articulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDBlog`.`Articulo` ;

CREATE TABLE IF NOT EXISTS `BDBlog`.`Articulo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(45) NULL,
  `Contenido` TEXT NULL,
  `fechacreacion` DATE NULL,
  `Usuario_id` INT NOT NULL,
  `Categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Articulo_Usuario1_idx` (`Usuario_id` ASC),
  INDEX `fk_Articulo_Categoria1_idx` (`Categoria_id` ASC),
  CONSTRAINT `fk_Articulo_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `BDBlog`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Articulo_Categoria1`
    FOREIGN KEY (`Categoria_id`)
    REFERENCES `BDBlog`.`Categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDBlog`.`Foto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDBlog`.`Foto` ;

CREATE TABLE IF NOT EXISTS `BDBlog`.`Foto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `path` VARCHAR(45) NULL,
  `Articulo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Foto_Articulo1_idx` (`Articulo_id` ASC) ,
  CONSTRAINT `fk_Foto_Articulo1`
    FOREIGN KEY (`Articulo_id`)
    REFERENCES `BDBlog`.`Articulo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BDBlog`.`Votos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BDBlog`.`Votos` ;

CREATE TABLE IF NOT EXISTS `BDBlog`.`Votos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Articulo_id` INT NOT NULL,
  `Usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Articulo_has_Usuario_Usuario1_idx` (`Usuario_id` ASC) ,
  INDEX `fk_Articulo_has_Usuario_Articulo1_idx` (`Articulo_id` ASC) ,
  CONSTRAINT `fk_Articulo_has_Usuario_Articulo1`
    FOREIGN KEY (`Articulo_id`)
    REFERENCES `BDBlog`.`Articulo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Articulo_has_Usuario_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `BDBlog`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `BDBlog`.`perfil`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDBlog`;
INSERT INTO `BDBlog`.`perfil` (`id`, `Nombre`, `Apellido`, `Pais`, `Direccion`) VALUES (DEFAULT, 'RONY YEISON', 'ARDIANO VELASQUEZ', 'GUATEMALA', 'CIUDAD');
INSERT INTO `BDBlog`.`perfil` (`id`, `Nombre`, `Apellido`, `Pais`, `Direccion`) VALUES (DEFAULT, 'MARLON ROBERTO ', 'OROZCO VEL??SQUEZ', 'HONDURAS', 'CIUDAD');
INSERT INTO `BDBlog`.`perfil` (`id`, `Nombre`, `Apellido`, `Pais`, `Direccion`) VALUES (DEFAULT, 'LEVIS AMILCAR', 'VELASQUEZ BARRIOS', 'COSTA RICA', 'CIUDAD');
INSERT INTO `BDBlog`.`perfil` (`id`, `Nombre`, `Apellido`, `Pais`, `Direccion`) VALUES (DEFAULT, 'EDELINDA FABIOLA ', 'DIAZ FUENTES', 'GUATEMALA', 'CIUDAD');
INSERT INTO `BDBlog`.`perfil` (`id`, `Nombre`, `Apellido`, `Pais`, `Direccion`) VALUES (DEFAULT, 'ANGEL LEONEL', 'ALVARADO', 'HONDURAS', 'CIUDAD');
INSERT INTO `BDBlog`.`perfil` (`id`, `Nombre`, `Apellido`, `Pais`, `Direccion`) VALUES (DEFAULT, 'LUCIA', 'ALVARADO', 'GUATEMALA', 'CIUDAD');
INSERT INTO `BDBlog`.`perfil` (`id`, `Nombre`, `Apellido`, `Pais`, `Direccion`) VALUES (DEFAULT, 'KARINA', 'DE LEON', 'HONDURAS', 'CIUDAD');
INSERT INTO `BDBlog`.`perfil` (`id`, `Nombre`, `Apellido`, `Pais`, `Direccion`) VALUES (DEFAULT, 'JORGE', 'DE LEON', 'GUATEMALA', 'CIUDAD');
INSERT INTO `BDBlog`.`perfil` (`id`, `Nombre`, `Apellido`, `Pais`, `Direccion`) VALUES (DEFAULT, 'SONIA', 'FUENTES', 'COSTA RICA', 'CIUDAD');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDBlog`.`Usuario`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDBlog`;
INSERT INTO `BDBlog`.`Usuario` (`id`, `usuario`, `password`, `fechacreacion`, `perfil_id`) VALUES (DEFAULT, 'US1', '123', '2013-08-01', 1);
INSERT INTO `BDBlog`.`Usuario` (`id`, `usuario`, `password`, `fechacreacion`, `perfil_id`) VALUES (DEFAULT, 'US2', '456', '2013-08-23', 2);
INSERT INTO `BDBlog`.`Usuario` (`id`, `usuario`, `password`, `fechacreacion`, `perfil_id`) VALUES (DEFAULT, 'US3', '789', '2013-09-14', 3);
INSERT INTO `BDBlog`.`Usuario` (`id`, `usuario`, `password`, `fechacreacion`, `perfil_id`) VALUES (DEFAULT, 'US4', 'ABC', '2013-09-25', 4);
INSERT INTO `BDBlog`.`Usuario` (`id`, `usuario`, `password`, `fechacreacion`, `perfil_id`) VALUES (DEFAULT, 'US5', 'DFG', '2013-10-13', 5);
INSERT INTO `BDBlog`.`Usuario` (`id`, `usuario`, `password`, `fechacreacion`, `perfil_id`) VALUES (DEFAULT, 'US6', '12222', '2013-11-12', 6);
INSERT INTO `BDBlog`.`Usuario` (`id`, `usuario`, `password`, `fechacreacion`, `perfil_id`) VALUES (DEFAULT, 'US8', '12345', '2013-12-25', 7);
INSERT INTO `BDBlog`.`Usuario` (`id`, `usuario`, `password`, `fechacreacion`, `perfil_id`) VALUES (DEFAULT, 'US9', 'DFFV', '2014-01-02', 8);
INSERT INTO `BDBlog`.`Usuario` (`id`, `usuario`, `password`, `fechacreacion`, `perfil_id`) VALUES (DEFAULT, 'US10', 'AAAA', '2014-02-14', 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDBlog`.`Categoria`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDBlog`;
INSERT INTO `BDBlog`.`Categoria` (`id`, `Categoria`) VALUES (DEFAULT, 'Programaci??n');
INSERT INTO `BDBlog`.`Categoria` (`id`, `Categoria`) VALUES (DEFAULT, 'Linux');
INSERT INTO `BDBlog`.`Categoria` (`id`, `Categoria`) VALUES (DEFAULT, 'Desarrollo Web');
INSERT INTO `BDBlog`.`Categoria` (`id`, `Categoria`) VALUES (DEFAULT, 'Servidores');
INSERT INTO `BDBlog`.`Categoria` (`id`, `Categoria`) VALUES (DEFAULT, 'Posicionamiento Internet');
INSERT INTO `BDBlog`.`Categoria` (`id`, `Categoria`) VALUES (DEFAULT, 'Redes');
INSERT INTO `BDBlog`.`Categoria` (`id`, `Categoria`) VALUES (DEFAULT, 'HTML');
INSERT INTO `BDBlog`.`Categoria` (`id`, `Categoria`) VALUES (DEFAULT, 'CSS');

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDBlog`.`Articulo`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDBlog`;
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 1', 'Texto1', '2013-01-01', 1, 1);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 2', 'Texto2', '2013-01-01', 1, 2);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 3', 'Texto 3', '2013-01-05', 2, 1);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 4', 'Texto 4', '2013-01-21', 2, 3);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 5', 'Texto 5', '2013-01-29', 2, 4);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 6', 'Texto 6', '2013-02-01', 1, 2);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 7', 'Texto 7', '2013-02-15', 3, 5);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 8', 'Texto 8', '2013-02-21', 6, 3);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 9', 'Texto 9', '2013-02-21', 7, 5);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'ARt??culo 10', 'Texto 10', '2013-03-02', 4, 1);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 11', 'Texto 11', '2013-03-05', 5, 8);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 12', 'Texto 12', '2013-03-18', 2, 4);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 13', 'Texto 13', '2013-04-19', 1, 5);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 14', 'Texto 14', '2013-08-01', 2, 1);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 15', 'Texto 15', '2013-09-12', 3, 3);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 16', 'Texto 16', '2014-01-01', 2, 1);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'Art??culo 17', 'Texto 17', '2014-01-05', 5, 2);
INSERT INTO `BDBlog`.`Articulo` (`id`, `Titulo`, `Contenido`, `fechacreacion`, `Usuario_id`, `Categoria_id`) VALUES (DEFAULT, 'ARt??culo ', 'Texto 18', '2014-02-01', 2, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDBlog`.`Foto`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDBlog`;
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto1', 1);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto2', 2);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto3', 3);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto5', 8);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto4', 2);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto5', 16);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto6', 12);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto8', 14);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto9', 12);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto10', 12);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto11', 11);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto14', 12);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto15', 5);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto16', 4);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto12', 3);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto17', 8);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto19', 8);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto20', 8);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto21', 10);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto22', 10);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto23', 10);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto24', 11);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto25', 10);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto26', 10);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto30', 15);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto23', 17);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto21', 14);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto264', 17);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto234', 14);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto12323', 1);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto1', 2);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto1', 3);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto23', 12);
INSERT INTO `BDBlog`.`Foto` (`id`, `path`, `Articulo_id`) VALUES (DEFAULT, '/home/web/foto134', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `BDBlog`.`Votos`
-- -----------------------------------------------------
START TRANSACTION;
USE `BDBlog`;
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 1, 2);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 1, 1);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 1, 3);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 1, 4);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 2, 1);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 2, 2);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 3, 3);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 3, 4);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 3, 5);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 4, 7);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 4, 1);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 15, 6);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 16, 2);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 16, 1);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 16, 7);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 15, 7);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 16, 1);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 16, 2);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 16, 3);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 17, 2);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 14, 2);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 13, 2);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 13, 1);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 13, 3);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 13, 5);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 13, 4);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 10, 1);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 10, 2);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 10, 3);
INSERT INTO `BDBlog`.`Votos` (`id`, `Articulo_id`, `Usuario_id`) VALUES (DEFAULT, 9, 1);

COMMIT;

