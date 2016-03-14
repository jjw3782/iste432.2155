-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema MedicalSystems
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `MedicalSystems` ;

-- -----------------------------------------------------
-- Schema MedicalSystems
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MedicalSystems` DEFAULT CHARACTER SET utf8 ;
USE `MedicalSystems` ;

-- -----------------------------------------------------
-- Table `MedicalSystems`.`Medication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`Medication` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`Medication` (
  `MedicationID` INT NOT NULL AUTO_INCREMENT,
  `TradeName` VARCHAR(256) NOT NULL,
  `GenericName` VARCHAR(256) NOT NULL,
  `GenericCategory` VARCHAR(100) NOT NULL,
  `TherapeuticCategory` VARCHAR(100) NOT NULL,
  `CounselingPoints` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`MedicationID`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `MedicalSystems`.`ContactInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`ContactInfo` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`ContactInfo` (
  `ContactID` INT NOT NULL AUTO_INCREMENT,
  `Phone` CHAR(10) NULL DEFAULT NULL,
  `Email` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`ContactID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`Address` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`Address` (
  `AddressID` VARCHAR(10) NOT NULL,
  `Street` VARCHAR(30) NOT NULL,
  `City` VARCHAR(30) NOT NULL,
  `State` VARCHAR(2) NOT NULL,
  `Zip` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`Insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`Insurance` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`Insurance` (
  `InsuranceID` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  `ContactID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`InsuranceID`),
  INDEX `AddressID` (`AddressID` ASC),
  INDEX `ContactID_idx` (`ContactID` ASC),
  CONSTRAINT `Insurance_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `MedicalSystems`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Insurance_ContactID`
    FOREIGN KEY (`ContactID`)
    REFERENCES `MedicalSystems`.`ContactInfo` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`Practice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`Practice` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`Practice` (
  `PracticeID` INT NOT NULL,
  `Name` VARCHAR(256) NULL DEFAULT NULL,
  `ContactID` INT NULL DEFAULT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`PracticeID`),
  INDEX `ContactID_idx` (`ContactID` ASC),
  INDEX `AddressID_idx` (`AddressID` ASC),
  CONSTRAINT `ContactID`
    FOREIGN KEY (`ContactID`)
    REFERENCES `MedicalSystems`.`ContactInfo` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `MedicalSystems`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`User` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`User` (
  `UserID` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(256) NOT NULL,
  `AccountType` CHAR(3) NOT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`Physician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`Physician` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`Physician` (
  `PhysicianID` VARCHAR(15) NOT NULL,
  `Name` VARCHAR(125) NULL DEFAULT NULL,
  `Specialty` VARCHAR(125) NULL DEFAULT NULL,
  `NewPatient` TINYINT(1) NULL DEFAULT NULL,
  `PracticeID` INT NULL DEFAULT NULL,
  `InsuranceID` VARCHAR(10) NULL DEFAULT NULL,
  `UserID` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`PhysicianID`),
  INDEX `InsuranceID_idx` (`InsuranceID` ASC),
  INDEX `UserID_idx` (`UserID` ASC),
  CONSTRAINT `Physician_InsuranceID`
    FOREIGN KEY (`InsuranceID`)
    REFERENCES `MedicalSystems`.`Insurance` (`InsuranceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Physician_UserID`
    FOREIGN KEY (`UserID`)
    REFERENCES `MedicalSystems`.`User` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Physician_PracticeID`
    FOREIGN KEY (`PracticeID`)
    REFERENCES `MedicalSystems`.`Pracice` (`PracticeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`Patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`Patient` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`Patient` (
  `PatientID` VARCHAR(15) NOT NULL,
  `UserID` VARCHAR(50) NULL DEFAULT NULL,
  `Name` VARCHAR(75) NULL DEFAULT NULL,
  `SSN` CHAR(9) NULL DEFAULT NULL,
  `MedicareID` CHAR(10) NULL DEFAULT NULL,
  `Weight` INT NULL DEFAULT NULL,
  `DOB` DATE NULL DEFAULT NULL,
  `PhysicianID` VARCHAR(15) NULL DEFAULT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  `InsuranceID` VARCHAR(10) NULL DEFAULT NULL,
  `ContactID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  INDEX `PhysicianID` (`PhysicianID` ASC),
  CONSTRAINT `Patient_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `MedicalSystems`.`Physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `MedicalSystems`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient_InsuranceID`
    FOREIGN KEY (`InsuranceID`)
    REFERENCES `MedicalSystems`.`Insurance` (InsuranceID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient_ContactID`
    FOREIGN KEY (`ContactID`)
    REFERENCES `MedicalSystems`.`Contact` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`PatientPhysician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`PatientPhysician` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`PatientPhysician` (
  `PatientID` VARCHAR(15) NOT NULL,
  `PhysicianID` VARCHAR(15) NOT NULL,
  INDEX `PatientID` (`PatientID` ASC),
  INDEX `PhysicianID` (`PhysicianID` ASC),
  CONSTRAINT `PatientPhysician_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `MedicalSystems`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PatientPhysician_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `MedicalSystems`.`Physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`Messages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`Messages` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`Messages` (
  `MessageID` INT NOT NULL,
  `PatientID` VARCHAR(15) NULL DEFAULT NULL,
  `PhysicianID` VARCHAR(15) NULL DEFAULT NULL,
  `Subject` VARCHAR(100) NULL DEFAULT NULL,
  `Body` VARCHAR(1000) NULL DEFAULT NULL,
  `Status` VARCHAR(10) NULL DEFAULT NULL,
  `Date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`MessageID`),
  INDEX `PatientID` (`PatientID` ASC),
  INDEX `PhysicianID` (`PhysicianID` ASC),
  CONSTRAINT `Messages_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `MedicalSystems`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Messages_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `MedicalSystems`.`Physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`AddressPatient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`AddressPatient` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`AddressPatient` (
  `PatientID` VARCHAR(15) NULL DEFAULT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  INDEX `PatientID` (`PatientID` ASC),
  INDEX `AddressID_idx` (`AddressID` ASC),
  CONSTRAINT `Address_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `MedicalSystems`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Address_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `MedicalSystems`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`Prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`Prescription` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`Prescription` (
  `PrescriptionID` INT NOT NULL,
  `MedicationID` INT NULL DEFAULT NULL,
  `PhysicianID` VARCHAR(15) NULL DEFAULT NULL,
  `PatientID` VARCHAR(15) NULL DEFAULT NULL,
  `Dosage` VARCHAR(50) NULL DEFAULT NULL,
  `Refills` INT NULL DEFAULT NULL,
  `Exp Date` DATE NULL DEFAULT NULL,
  `Frequency` VARCHAR(50) NULL DEFAULT NULL,
  `Route` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`),
  INDEX `PhysicianID` (`PhysicianID` ASC),
  INDEX `PatientID` (`PatientID` ASC),
  INDEX `MedicationID_idx` (`MedicationID` ASC),
  CONSTRAINT `Prescription_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `MedicalSystems`.`Physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Prescription_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `MedicalSystems`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Prescription_MedicationID`
    FOREIGN KEY (`MedicationID`)
    REFERENCES `MedicalSystems`.`Medication` (`MedicationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`Appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`Appointment` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`Appointment` (
  `AppointmentID` VARCHAR(10) NOT NULL,
  `PatientID` VARCHAR(15) NULL DEFAULT NULL,
  `PhysicianID` VARCHAR(15) NULL DEFAULT NULL,
  `InsuranceID` VARCHAR(10) NULL DEFAULT NULL,
  `Date` DATE NULL DEFAULT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  `Purpose` VARCHAR(50) NULL DEFAULT NULL,
  `Description` TEXT NULL DEFAULT NULL,
  `Status` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  INDEX `PatientID` (`PatientID` ASC),
  INDEX `PhysicianID` (`PhysicianID` ASC),
  INDEX `InsuranceID_idx` (`InsuranceID` ASC),
  INDEX `AddressID_idx` (`AddressID` ASC),
  CONSTRAINT `Appointment_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `MedicalSystems`.`Patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Appointment_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `MedicalSystems`.`Physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Appointment_InsuranceID`
    FOREIGN KEY (`InsuranceID`)
    REFERENCES `MedicalSystems`.`Insurance` (`InsuranceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Appointment_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `MedicalSystems`.`Address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MedicalSystems`.`PhysicianPractice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MedicalSystems`.`PhysicianPractice` ;

CREATE TABLE IF NOT EXISTS `MedicalSystems`.`PhysicianPractice` (
  `PracticeID` INT NULL,
  `PhysicianID` VARCHAR(15) NULL,
  INDEX `PhysicianID_idx` (`PhysicianID` ASC),
  INDEX `PracticeID_idx` (`PracticeID` ASC),
  CONSTRAINT `PhysicianPractice_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `MedicalSystems`.`Physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PhysicianPractice_PracticeID`
    FOREIGN KEY (`PracticeID`)
    REFERENCES `MedicalSystems`.`Practice` (`PracticeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
