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
-- Table `aeronave`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aeronave` (
  `codigo_ocorrencia2` INT NOT NULL,
  `aeronave_matricula` TEXT NULL DEFAULT NULL,
  `aeronave_operador_categoria` TEXT NULL DEFAULT NULL,
  `aeronave_tipo_veiculo` TEXT NULL DEFAULT NULL,
  `aeronave_fabricante` TEXT NULL DEFAULT NULL,
  `aeronave_modelo` TEXT NULL DEFAULT NULL,
  `aeronave_tipo_icao` TEXT NULL DEFAULT NULL,
  `aeronave_motor_tipo` TEXT NULL DEFAULT NULL,
  `aeronave_motor_quantidade` TEXT NULL DEFAULT NULL,
  `aeronave_pmd` INT NULL DEFAULT NULL,
  `aeronave_pmd_categoria` INT NULL DEFAULT NULL,
  `aeronave_assentos` INT NULL DEFAULT NULL,
  `aeronave_ano_fabricacao` INT NULL DEFAULT NULL,
  `aeronave_pais_fabricante` TEXT NULL DEFAULT NULL,
  `aeronave_pais_registro` TEXT NULL DEFAULT NULL,
  `aeronave_registro_categoria` TEXT NULL DEFAULT NULL,
  `aeronave_registro_segmento` TEXT NULL DEFAULT NULL,
  `aeronave_voo_origem` TEXT NULL DEFAULT NULL,
  `aeronave_voo_destino` TEXT NULL DEFAULT NULL,
  `aeronave_fase_operacao` TEXT NULL DEFAULT NULL,
  `aeronave_tipo_operacao` TEXT NULL DEFAULT NULL,
  `aeronave_nivel_dano` TEXT NULL DEFAULT NULL,
  `aeronave_fatalidades_total` INT NULL DEFAULT NULL,
  PRIMARY KEY (`codigo_ocorrencia2`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `fator_contribuinte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fator_contribuinte` (
  `codigo_ocorrencia3` INT NOT NULL,
  `fator_nome` TEXT NULL DEFAULT NULL,
  `fator_aspecto` TEXT NULL DEFAULT NULL,
  `fator_condicionante` TEXT NULL DEFAULT NULL,
  `fator_area` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`codigo_ocorrencia3`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ocorrencia_tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocorrencia_tipo` (
  `codigo_ocorrencia1` INT NOT NULL,
  `ocorrencia_tipo` TEXT NULL DEFAULT NULL,
  `ocorrencia_tipo_categoria` TEXT NULL DEFAULT NULL,
  `taxonomia_tipo_icao` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`codigo_ocorrencia1`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `recomendacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `recomendacao` (
  `codigo_ocorrencia4` INT NOT NULL,
  `recomendacao_numero` TEXT NULL DEFAULT NULL,
  `recomendacao_dia_assinatura` TEXT NULL DEFAULT NULL,
  `recomendacao_dia_encaminhamento` TEXT NULL DEFAULT NULL,
  `recomendacao_dia_feedback` TEXT NULL DEFAULT NULL,
  `recomendacao_conteudo` TEXT NULL DEFAULT NULL,
  `recomendacao_status` TEXT NULL DEFAULT NULL,
  `recomendacao_destinatario_sigla` TEXT NULL DEFAULT NULL,
  `recomendacao_destinatario` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`codigo_ocorrencia4`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ocorrencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocorrencia` (
  `codigo_ocorrencia` INT NOT NULL,
  `codigo_ocorrencia1` INT NULL DEFAULT NULL,
  `codigo_ocorrencia2` INT NULL DEFAULT NULL,
  `codigo_ocorrencia3` INT NULL DEFAULT NULL,
  `codigo_ocorrencia4` INT NULL DEFAULT NULL,
  `ocorrencia_classificacao` TEXT NULL DEFAULT NULL,
  `ocorrencia_latitude` TEXT NULL DEFAULT NULL,
  `ocorrencia_longitude` TEXT NULL DEFAULT NULL,
  `ocorrencia_cidade` TEXT NULL DEFAULT NULL,
  `ocorrencia_uf` TEXT NULL DEFAULT NULL,
  `ocorrencia_pais` TEXT NULL DEFAULT NULL,
  `ocorrencia_aerodromo` TEXT NULL DEFAULT NULL,
  `ocorrencia_dia` TEXT NULL DEFAULT NULL,
  `ocorrencia_hora` TEXT NULL DEFAULT NULL,
  `investigacao_aeronave_liberada` TEXT NULL DEFAULT NULL,
  `investigacao_status` TEXT NULL DEFAULT NULL,
  `divulgacao_relatorio_numero` TEXT NULL DEFAULT NULL,
  `divulgacao_relatorio_publicado` TEXT NULL DEFAULT NULL,
  `divulgacao_dia_publicacao` TEXT NULL DEFAULT NULL,
  `total_recomendacoes` INT NULL DEFAULT NULL,
  `total_aeronaves_envolvidas` INT NULL DEFAULT NULL,
  `ocorrencia_saida_pista` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`codigo_ocorrencia`),
  INDEX `codigo_ocorrencia1_idx` (`codigo_ocorrencia1` ASC) VISIBLE,
  INDEX `codigo_ocorrencia2_idx` (`codigo_ocorrencia2` ASC) VISIBLE,
  INDEX `codigo_ocorrencia3_idx` (`codigo_ocorrencia3` ASC) VISIBLE,
  INDEX `codigo_ocorrencia4_idx` (`codigo_ocorrencia4` ASC) VISIBLE,
  CONSTRAINT `codigo_ocorrencia1`
    FOREIGN KEY (`codigo_ocorrencia1`)
    REFERENCES `ocorrencia_tipo` (`codigo_ocorrencia1`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_ocorrencia2`
    FOREIGN KEY (`codigo_ocorrencia2`)
    REFERENCES `aeronave` (`codigo_ocorrencia2`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_ocorrencia3`
    FOREIGN KEY (`codigo_ocorrencia3`)
    REFERENCES `fator_contribuinte` (`codigo_ocorrencia3`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `codigo_ocorrencia4`
    FOREIGN KEY (`codigo_ocorrencia4`)
    REFERENCES `recomendacao` (`codigo_ocorrencia4`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ocorrencia_fatalidade_quantidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ocorrencia_fatalidade_quantidade` (
  `ocorrencia_fatalidade_quantidade_tipo` INT NULL,
  `ocorrencia_fatalidade_quantidade_qtd` TEXT NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
