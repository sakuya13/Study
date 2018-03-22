SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `Username` CHAR(30) NOT NULL,
  `Password` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Profile` VARCHAR(45) NULL,
  PRIMARY KEY (`Username`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Post` (
  `ID` INT NOT NULL,
  `Text` TEXT NULL,
  `WhenPosted` TIMESTAMP NULL,
  `Username` VARCHAR(45) NULL,
  `User_Username` CHAR(30) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Post_User1_idx` (`User_Username` ASC),
  CONSTRAINT `fk_Post_User1`
    FOREIGN KEY (`User_Username`)
    REFERENCES `mydb`.`User` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comment` (
  `Id` INT NOT NULL,
  `PostId` INT NULL,
  `Text` VARCHAR(45) NULL,
  `WhenPosted` TIMESTAMP NULL,
  `Username` VARCHAR(45) NULL,
  `User_Username` CHAR(30) NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_table2_table1_idx` (`Text` ASC),
  INDEX `fk_Comment_User1_idx` (`User_Username` ASC),
  CONSTRAINT `fk_table2_table1`
    FOREIGN KEY (`Text`)
    REFERENCES `mydb`.`Post` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_User1`
    FOREIGN KEY (`User_Username`)
    REFERENCES `mydb`.`User` (`Username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
