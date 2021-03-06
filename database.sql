-- MySQL Script generated by MySQL Workbench
-- 09/26/16 22:45:01
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema delix
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `delix` ;

-- -----------------------------------------------------
-- Schema delix
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `delix` DEFAULT CHARACTER SET utf8 ;
USE `delix` ;

-- -----------------------------------------------------
-- Table `delix`.`sectores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`sectores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `esPrivado` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`grupo_de_mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`grupo_de_mesas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sectores_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_grupo_de_mesas_sectores1_idx` (`sectores_id` ASC),
  CONSTRAINT `fk_grupo_de_mesas_sectores1`
    FOREIGN KEY (`sectores_id`)
    REFERENCES `delix`.`sectores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`mesas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `grupo_de_mesas_id` INT NOT NULL,
  `capacidad` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mesas_grupo_de_mesas1_idx` (`grupo_de_mesas_id` ASC),
  CONSTRAINT `fk_mesas_grupo_de_mesas1`
    FOREIGN KEY (`grupo_de_mesas_id`)
    REFERENCES `delix`.`grupo_de_mesas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`usuario_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`usuario_tipo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario_tipo_id` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuarios_usuario_tipo1_idx` (`usuario_tipo_id` ASC),
  CONSTRAINT `fk_usuarios_usuario_tipo1`
    FOREIGN KEY (`usuario_tipo_id`)
    REFERENCES `delix`.`usuario_tipo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`pedido_estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`pedido_estado` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`pedidos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuarios_id` INT NOT NULL,
  `grupo_de_mesas_id` INT NOT NULL,
  `pedido_estado_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedidos_usuarios1_idx` (`usuarios_id` ASC),
  INDEX `fk_pedidos_grupo_de_mesas1_idx` (`grupo_de_mesas_id` ASC),
  INDEX `fk_pedidos_pedido_estado1_idx` (`pedido_estado_id` ASC),
  CONSTRAINT `fk_pedidos_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `delix`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_grupo_de_mesas1`
    FOREIGN KEY (`grupo_de_mesas_id`)
    REFERENCES `delix`.`grupo_de_mesas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedidos_pedido_estado1`
    FOREIGN KEY (`pedido_estado_id`)
    REFERENCES `delix`.`pedido_estado` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`proveedores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `razonSocial` VARCHAR(45) NULL,
  `mail` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`productos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `precio` DECIMAL NULL,
  `esFinal` TINYINT(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`rubros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`rubros` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`franjas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`franjas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `horaInicio` DATETIME NULL,
  `horaFin` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`reservas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `franjas_id` INT NOT NULL,
  `grupo_de_mesas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_reservas_franjas1_idx` (`franjas_id` ASC),
  INDEX `fk_reservas_grupo_de_mesas1_idx` (`grupo_de_mesas_id` ASC),
  CONSTRAINT `fk_reservas_franjas1`
    FOREIGN KEY (`franjas_id`)
    REFERENCES `delix`.`franjas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservas_grupo_de_mesas1`
    FOREIGN KEY (`grupo_de_mesas_id`)
    REFERENCES `delix`.`grupo_de_mesas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`solicitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`solicitudes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`recepciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`recepciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `solicitudes_id` INT NOT NULL,
  `precio` DECIMAL NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recepciones_solicitudes1_idx` (`solicitudes_id` ASC),
  CONSTRAINT `fk_recepciones_solicitudes1`
    FOREIGN KEY (`solicitudes_id`)
    REFERENCES `delix`.`solicitudes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`pagos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`pagos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pedidos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pagos_pedidos1_idx` (`pedidos_id` ASC),
  CONSTRAINT `fk_pagos_pedidos1`
    FOREIGN KEY (`pedidos_id`)
    REFERENCES `delix`.`pedidos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`platos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`platos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(1000) NULL,
  `precio` DECIMAL NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`promos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`promos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `porcentajeDescuento` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`rubros_por_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`rubros_por_proveedor` (
  `proveedores_id` INT NOT NULL,
  `rubros_id` INT NOT NULL,
  PRIMARY KEY (`proveedores_id`, `rubros_id`),
  INDEX `fk_proveedores_has_rubros_rubros1_idx` (`rubros_id` ASC),
  INDEX `fk_proveedores_has_rubros_proveedores1_idx` (`proveedores_id` ASC),
  CONSTRAINT `fk_proveedores_has_rubros_proveedores1`
    FOREIGN KEY (`proveedores_id`)
    REFERENCES `delix`.`proveedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedores_has_rubros_rubros1`
    FOREIGN KEY (`rubros_id`)
    REFERENCES `delix`.`rubros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`productos_por_rubros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`productos_por_rubros` (
  `productos_id` INT NOT NULL,
  `rubros_id` INT NOT NULL,
  PRIMARY KEY (`productos_id`, `rubros_id`),
  INDEX `fk_productos_has_rubros_rubros1_idx` (`rubros_id` ASC),
  INDEX `fk_productos_has_rubros_productos1_idx` (`productos_id` ASC),
  CONSTRAINT `fk_productos_has_rubros_productos1`
    FOREIGN KEY (`productos_id`)
    REFERENCES `delix`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_has_rubros_rubros1`
    FOREIGN KEY (`rubros_id`)
    REFERENCES `delix`.`rubros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`productos_por_promos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`productos_por_promos` (
  `productos_id` INT NOT NULL,
  `promos_id` INT NOT NULL,
  PRIMARY KEY (`productos_id`, `promos_id`),
  INDEX `fk_productos_has_promos_promos1_idx` (`promos_id` ASC),
  INDEX `fk_productos_has_promos_productos1_idx` (`productos_id` ASC),
  CONSTRAINT `fk_productos_has_promos_productos1`
    FOREIGN KEY (`productos_id`)
    REFERENCES `delix`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_productos_has_promos_promos1`
    FOREIGN KEY (`promos_id`)
    REFERENCES `delix`.`promos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`platos_por_promos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`platos_por_promos` (
  `platos_id` INT NOT NULL,
  `promos_id` INT NOT NULL,
  PRIMARY KEY (`platos_id`, `promos_id`),
  INDEX `fk_platos_has_promos_promos1_idx` (`promos_id` ASC),
  INDEX `fk_platos_has_promos_platos1_idx` (`platos_id` ASC),
  CONSTRAINT `fk_platos_has_promos_platos1`
    FOREIGN KEY (`platos_id`)
    REFERENCES `delix`.`platos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_platos_has_promos_promos1`
    FOREIGN KEY (`promos_id`)
    REFERENCES `delix`.`promos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`productos_por_solicitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`productos_por_solicitudes` (
  `solicitudes_id` INT NOT NULL,
  `productos_id` INT NOT NULL,
  PRIMARY KEY (`solicitudes_id`, `productos_id`),
  INDEX `fk_solicitudes_has_productos_productos1_idx` (`productos_id` ASC),
  INDEX `fk_solicitudes_has_productos_solicitudes1_idx` (`solicitudes_id` ASC),
  CONSTRAINT `fk_solicitudes_has_productos_solicitudes1`
    FOREIGN KEY (`solicitudes_id`)
    REFERENCES `delix`.`solicitudes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_solicitudes_has_productos_productos1`
    FOREIGN KEY (`productos_id`)
    REFERENCES `delix`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`comandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`comandas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pedidos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comandas_pedidos1_idx` (`pedidos_id` ASC),
  CONSTRAINT `fk_comandas_pedidos1`
    FOREIGN KEY (`pedidos_id`)
    REFERENCES `delix`.`pedidos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`platos_por_comandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`platos_por_comandas` (
  `comandas_id` INT NOT NULL,
  `platos_id` INT NOT NULL,
  PRIMARY KEY (`comandas_id`, `platos_id`),
  INDEX `fk_comandas_has_platos_platos1_idx` (`platos_id` ASC),
  INDEX `fk_comandas_has_platos_comandas1_idx` (`comandas_id` ASC),
  CONSTRAINT `fk_comandas_has_platos_comandas1`
    FOREIGN KEY (`comandas_id`)
    REFERENCES `delix`.`comandas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comandas_has_platos_platos1`
    FOREIGN KEY (`platos_id`)
    REFERENCES `delix`.`platos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`promos_por_comandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`promos_por_comandas` (
  `comandas_id` INT NOT NULL,
  `promos_id` INT NOT NULL,
  PRIMARY KEY (`comandas_id`, `promos_id`),
  INDEX `fk_comandas_has_promos_promos1_idx` (`promos_id` ASC),
  INDEX `fk_comandas_has_promos_comandas1_idx` (`comandas_id` ASC),
  CONSTRAINT `fk_comandas_has_promos_comandas1`
    FOREIGN KEY (`comandas_id`)
    REFERENCES `delix`.`comandas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comandas_has_promos_promos1`
    FOREIGN KEY (`promos_id`)
    REFERENCES `delix`.`promos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`productos_por_comandas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`productos_por_comandas` (
  `comandas_id` INT NOT NULL,
  `productos_id` INT NOT NULL,
  PRIMARY KEY (`comandas_id`, `productos_id`),
  INDEX `fk_comandas_has_productos_productos1_idx` (`productos_id` ASC),
  INDEX `fk_comandas_has_productos_comandas1_idx` (`comandas_id` ASC),
  CONSTRAINT `fk_comandas_has_productos_comandas1`
    FOREIGN KEY (`comandas_id`)
    REFERENCES `delix`.`comandas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comandas_has_productos_productos1`
    FOREIGN KEY (`productos_id`)
    REFERENCES `delix`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `delix`.`productos_por_recepciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `delix`.`productos_por_recepciones` (
  `recepciones_id` INT NOT NULL,
  `productos_id` INT NOT NULL,
  PRIMARY KEY (`recepciones_id`, `productos_id`),
  INDEX `fk_recepciones_has_productos_productos1_idx` (`productos_id` ASC),
  INDEX `fk_recepciones_has_productos_recepciones1_idx` (`recepciones_id` ASC),
  CONSTRAINT `fk_recepciones_has_productos_recepciones1`
    FOREIGN KEY (`recepciones_id`)
    REFERENCES `delix`.`recepciones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recepciones_has_productos_productos1`
    FOREIGN KEY (`productos_id`)
    REFERENCES `delix`.`productos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
