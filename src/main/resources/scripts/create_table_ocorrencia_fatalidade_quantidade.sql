-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cenipa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cenipa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cenipa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cenipa` ;

-- -----------------------------------------------------
-- Table `cenipa`.`ocorrencia_fatalidade_quantidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cenipa`.`ocorrencia_fatalidade_quantidade` (
  `ocorrencia_fatalidade_quantidade_tipo` INT NULL,
  `ocorrencia_fatalidade_quantidade_qtd` TEXT NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
