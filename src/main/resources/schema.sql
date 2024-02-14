-- MySQL Script generated by MySQL Workbench
-- Wed Feb  7 17:40:22 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema incallup
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema incallup
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `incallup` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `incallup` ;

-- -----------------------------------------------------
-- Table `incallup`.`tbl_admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `incallup`.`tbl_admin` (
  `idAdmin` INT NOT NULL AUTO_INCREMENT,
  `admin_username` VARCHAR(45) NOT NULL,
  `admin_password` VARCHAR(45) NOT NULL,
  `admin_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idAdmin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `idAdmin_UNIQUE` ON `incallup`.`tbl_admin` (`idAdmin` ASC) VISIBLE;

CREATE UNIQUE INDEX `username_UNIQUE` ON `incallup`.`tbl_admin` (`admin_username` ASC) VISIBLE;

CREATE INDEX `type` ON `incallup`.`tbl_admin` (`admin_type` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `incallup`.`tbl_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `incallup`.`tbl_category` (
  `idCategory` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `incallup`.`tbl_location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `incallup`.`tbl_location` (
  `idt_location` INT NOT NULL AUTO_INCREMENT,
  `location_name` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`idt_location`))
ENGINE = InnoDB
AUTO_INCREMENT = 14
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `name_UNIQUE` ON `incallup`.`tbl_location` (`location_name` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `incallup`.`tbl_promotion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `incallup`.`tbl_promotion` (
  `idPromotion` INT NOT NULL,
  `promotion_amount` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idPromotion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `incallup`.`tbl_verification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `incallup`.`tbl_verification` (
  `idVerification` INT NOT NULL AUTO_INCREMENT,
  `verification_type` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idVerification`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `verification_type_UNIQUE` ON `incallup`.`tbl_verification` (`verification_type` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `incallup`.`tbl_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `incallup`.`tbl_post` (
  `idpost` INT NOT NULL AUTO_INCREMENT,
  `post_title` VARCHAR(80) NOT NULL,
  `post_location_id` INT NOT NULL DEFAULT '0',
  `post_views` VARCHAR(45) NOT NULL DEFAULT '0',
  `post_date` DATETIME NOT NULL,
  `post_contact` VARCHAR(20) NOT NULL,
  `post_age` INT NOT NULL,
  `post_description` VARCHAR(500) NULL DEFAULT NULL,
  `post_category_id` INT NOT NULL DEFAULT '0',
  `post_verification_id` INT NOT NULL DEFAULT '0',
  `post_promotion_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idpost`),
  CONSTRAINT `category`
    FOREIGN KEY (`post_category_id`)
    REFERENCES `incallup`.`tbl_category` (`idCategory`),
  CONSTRAINT `location`
    FOREIGN KEY (`post_location_id`)
    REFERENCES `incallup`.`tbl_location` (`idt_location`),
  CONSTRAINT `promotion`
    FOREIGN KEY (`post_promotion_id`)
    REFERENCES `incallup`.`tbl_promotion` (`idPromotion`),
  CONSTRAINT `verification`
    FOREIGN KEY (`post_verification_id`)
    REFERENCES `incallup`.`tbl_verification` (`idVerification`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

CREATE UNIQUE INDEX `post_title_UNIQUE` ON `incallup`.`tbl_post` (`post_title` ASC) VISIBLE;

CREATE INDEX `location_idx` ON `incallup`.`tbl_post` (`post_location_id` ASC) VISIBLE;

CREATE INDEX `category_idx` ON `incallup`.`tbl_post` (`post_category_id` ASC) VISIBLE;

CREATE INDEX `promotion_idx` ON `incallup`.`tbl_post` (`post_promotion_id` ASC) VISIBLE;

CREATE INDEX `verification_idx` ON `incallup`.`tbl_post` (`post_verification_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
