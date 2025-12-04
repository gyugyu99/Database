-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`booking` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pet_id` INT NOT NULL,
  `guest_id` INT NOT NULL,
  `datetime` DATETIME NULL,
  `check_in_datetime` DATETIME NULL,
  `is_paid` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_booking_pet1_idx` (`pet_id` ASC) VISIBLE,
  INDEX `fk_booking_guest1_idx` (`guest_id` ASC) VISIBLE,
  CONSTRAINT `fk_booking_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `mydb`.`pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_guest1`
    FOREIGN KEY (`guest_id`)
    REFERENCES `mydb`.`guest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`guest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`guest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `booking_id` INT NOT NULL,
  `age` INT NULL,
  `num_of_people` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_guest_booking1_idx` (`booking_id` ASC) VISIBLE,
  CONSTRAINT `fk_guest_booking1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `mydb`.`booking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `age` INT NULL,
  `gender` ENUM('M', 'F') NULL,
  `types` VARCHAR(45) NULL,
  `guest_id` INT NOT NULL,
  `is_vaccinaed` TINYINT NULL,
  `notes` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pet_guest_idx` (`guest_id` ASC) VISIBLE,
  CONSTRAINT `fk_pet_guest`
    FOREIGN KEY (`guest_id`)
    REFERENCES `mydb`.`guest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `booking_id` INT NOT NULL,
  `max_poeple` INT NULL,
  `clean` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_room_booking1_idx` (`booking_id` ASC) VISIBLE,
  CONSTRAINT `fk_room_booking1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `mydb`.`booking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`service` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `booking_id` INT NOT NULL,
  `bath` VARCHAR(45) NULL,
  `walk` VARCHAR(45) NULL,
  `snacks` VARCHAR(45) NULL,
  `wine` VARCHAR(45) NULL,
  `pool_rental` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_service_booking1_idx` (`booking_id` ASC) VISIBLE,
  CONSTRAINT `fk_service_booking1`
    FOREIGN KEY (`booking_id`)
    REFERENCES `mydb`.`booking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
