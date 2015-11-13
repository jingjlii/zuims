-- MySQL Script generated by MySQL Workbench
-- Sat Nov 14 00:26:39 2015
-- Model: New Model    Version: 1.0
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `phoneid` VARCHAR(11) NOT NULL,
  `gender` TINYINT NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `photo` BLOB NOT NULL,
  `memo` TEXT NOT NULL,
  PRIMARY KEY (`phoneid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User_type` (
  `utid` INT NOT NULL,
  `ut_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`utid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vip_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Vip_level` (
  `vlid` INT NOT NULL,
  `vl_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`vlid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User2User_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User2User_type` (
  `user2user_type_phoneid` VARCHAR(11) NOT NULL,
  `user2user_type_utid` INT NOT NULL,
  PRIMARY KEY (`user2user_type_phoneid`, `user2user_type_utid`),
  INDEX `user2user_type_utid_idx` (`user2user_type_utid` ASC),
  CONSTRAINT `user2user_type_phoneid`
    FOREIGN KEY (`user2user_type_phoneid`)
    REFERENCES `mydb`.`User` (`phoneid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user2user_type_utid`
    FOREIGN KEY (`user2user_type_utid`)
    REFERENCES `mydb`.`User_type` (`utid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invitation_code`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invitation_code` (
  `code` VARCHAR(12) NOT NULL,
  `available` TINYINT NOT NULL,
  `expired_date` DATETIME NOT NULL,
  `invitation_code_utid` INT NOT NULL,
  PRIMARY KEY (`code`),
  INDEX `invitation_code_utid_idx` (`invitation_code_utid` ASC),
  CONSTRAINT `invitation_code_utid`
    FOREIGN KEY (`invitation_code_utid`)
    REFERENCES `mydb`.`User_type` (`utid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User_type2vip_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User_type2vip_level` (
  `days` INT NOT NULL,
  `user_type2vip_level_utid` INT NOT NULL,
  `user_type2vip_level_vlid` INT NOT NULL,
  PRIMARY KEY (`user_type2vip_level_utid`, `user_type2vip_level_vlid`),
  INDEX `user_type2vip_level_vlid_idx` (`user_type2vip_level_vlid` ASC),
  CONSTRAINT `user_type2vip_level_utid`
    FOREIGN KEY (`user_type2vip_level_utid`)
    REFERENCES `mydb`.`User_type` (`utid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_type2vip_level_vlid`
    FOREIGN KEY (`user_type2vip_level_vlid`)
    REFERENCES `mydb`.`Vip_level` (`vlid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User2Vip_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User2Vip_level` (
  `user2vip_level_phoneid` VARCHAR(11) NOT NULL,
  `user2vip_level_vlid` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`user2vip_level_phoneid`, `user2vip_level_vlid`),
  INDEX `user2vip_level_vlid_idx` (`user2vip_level_vlid` ASC),
  CONSTRAINT `user2vip_level_phoneid`
    FOREIGN KEY (`user2vip_level_phoneid`)
    REFERENCES `mydb`.`User` (`phoneid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user2vip_level_vlid`
    FOREIGN KEY (`user2vip_level_vlid`)
    REFERENCES `mydb`.`Vip_level` (`vlid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
