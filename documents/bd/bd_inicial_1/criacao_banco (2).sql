-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema portal_atenas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portal_atenas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portal_atenas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `portal_atenas` ;

-- -----------------------------------------------------
-- Table `portal_atenas`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_atenas`.`perfil` (
  `codperfil` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(70) NULL,
  PRIMARY KEY (`codperfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_atenas`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_atenas`.`usuario` (
  `codusuario` VARCHAR(20) NOT NULL,
  `nome` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(100) NULL,
  `codperfil` INT NOT NULL,
  PRIMARY KEY (`codusuario`),
  INDEX `fk_usuario_perfil1_idx` (`codperfil` ASC),
  CONSTRAINT `fk_usuario_perfil1`
    FOREIGN KEY (`codperfil`)
    REFERENCES `portal_atenas`.`perfil` (`codperfil`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_atenas`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_atenas`.`turma` (
  `codturma` VARCHAR(10) NOT NULL,
  `descricao` VARCHAR(100) NULL,
  PRIMARY KEY (`codturma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_atenas`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_atenas`.`curso` (
  `codcurso` INT NOT NULL,
  `nome` VARCHAR(70) NULL,
  PRIMARY KEY (`codcurso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_atenas`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_atenas`.`disciplina` (
  `coddisciplina` VARCHAR(10) NOT NULL,
  `nome` VARCHAR(100) NULL,
  `codcurso` INT NOT NULL,
  PRIMARY KEY (`coddisciplina`),
  INDEX `fk_disciplina_curso1_idx` (`codcurso` ASC),
  CONSTRAINT `fk_disciplina_curso1`
    FOREIGN KEY (`codcurso`)
    REFERENCES `portal_atenas`.`curso` (`codcurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_atenas`.`semestre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_atenas`.`semestre` (
  `codsemestre` VARCHAR(6) NOT NULL,
  `descricao` VARCHAR(70) NULL,
  PRIMARY KEY (`codsemestre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_atenas`.`turma_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_atenas`.`turma_disciplina` (
  `codsemestre` VARCHAR(6) NOT NULL,
  `codturma` VARCHAR(10) NOT NULL,
  `coddisciplina` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`codsemestre`, `codturma`, `coddisciplina`),
  INDEX `fk_turma_disciplina_semestre1_idx` (`codsemestre` ASC),
  INDEX `fk_turma_disciplina_turma1_idx` (`codturma` ASC),
  INDEX `fk_turma_disciplina_disciplina1_idx` (`coddisciplina` ASC),
  CONSTRAINT `fk_turma_disciplina_semestre1`
    FOREIGN KEY (`codsemestre`)
    REFERENCES `portal_atenas`.`semestre` (`codsemestre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_disciplina_turma1`
    FOREIGN KEY (`codturma`)
    REFERENCES `portal_atenas`.`turma` (`codturma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_disciplina_disciplina1`
    FOREIGN KEY (`coddisciplina`)
    REFERENCES `portal_atenas`.`disciplina` (`coddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_atenas`.`aluno_turmat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_atenas`.`aluno_turmat` (
  `codusuario` VARCHAR(20) NOT NULL,
  `codsemestre` VARCHAR(6) NOT NULL,
  `codturma` VARCHAR(10) NOT NULL,
  `coddisciplina` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`codusuario`, `codsemestre`, `codturma`, `coddisciplina`),
  INDEX `fk_aluno_turmat_turma_disciplina1_idx` (`codsemestre` ASC, `codturma` ASC, `coddisciplina` ASC),
  CONSTRAINT `fk_aluno_turmat_usuario1`
    FOREIGN KEY (`codusuario`)
    REFERENCES `portal_atenas`.`usuario` (`codusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_turmat_turma_disciplina1`
    FOREIGN KEY (`codsemestre` , `codturma` , `coddisciplina`)
    REFERENCES `portal_atenas`.`turma_disciplina` (`codsemestre` , `codturma` , `coddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portal_atenas`.`professor_turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portal_atenas`.`professor_turma` (
  `usuario_codusuario` VARCHAR(20) NOT NULL,
  `turma_disciplina_codsemestre` VARCHAR(6) NOT NULL,
  `turma_disciplina_codturma` VARCHAR(10) NOT NULL,
  `turma_disciplina_coddisciplina` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`usuario_codusuario`, `turma_disciplina_codsemestre`, `turma_disciplina_codturma`, `turma_disciplina_coddisciplina`),
  INDEX `fk_professor_turma_turma_disciplina1_idx` (`turma_disciplina_codsemestre` ASC, `turma_disciplina_codturma` ASC, `turma_disciplina_coddisciplina` ASC),
  CONSTRAINT `fk_professor_turma_usuario1`
    FOREIGN KEY (`usuario_codusuario`)
    REFERENCES `portal_atenas`.`usuario` (`codusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_turma_turma_disciplina1`
    FOREIGN KEY (`turma_disciplina_codsemestre` , `turma_disciplina_codturma` , `turma_disciplina_coddisciplina`)
    REFERENCES `portal_atenas`.`turma_disciplina` (`codsemestre` , `codturma` , `coddisciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
