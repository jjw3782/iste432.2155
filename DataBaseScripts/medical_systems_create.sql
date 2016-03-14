-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema medicalsystems
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema medicalsystems
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `medicalsystems` ;

CREATE SCHEMA IF NOT EXISTS `medicalsystems` DEFAULT CHARACTER SET utf8 ;
USE `medicalsystems` ;

-- -----------------------------------------------------
-- Table `medicalsystems`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`address` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`address` (
  `AddressID` VARCHAR(10) NOT NULL,
  `Street` VARCHAR(30) NOT NULL,
  `City` VARCHAR(30) NOT NULL,
  `State` VARCHAR(2) NOT NULL,
  `Zip` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `medicalsystems`.`address` VALUES ('ADR0000001', '1 Lomb Memorial Dr.', 'Rochester', 'NY', '14623');
INSERT INTO `medicalsystems`.`address` VALUES ('ADR0000002', '504 Mt Hope Ave.', 'Rochester', 'NY', '14620');

-- -----------------------------------------------------
-- Table `medicalsystems`.`contactinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`contactinfo` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`contactinfo` (
  `ContactID` INT(11) NOT NULL AUTO_INCREMENT,
  `Phone` CHAR(10) NULL DEFAULT NULL,
  `Email` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`ContactID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `medicalsystems`.`contactinfo` VALUES (1, '2192015875', 'ehf5307@g.rit.edu');
INSERT INTO `medicalsystems`.`contactinfo` VALUES (2, '2192015875', 'ehcfitzgerald@gmail.com');

-- -----------------------------------------------------
-- Table `medicalsystems`.`insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`insurance` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`insurance` (
  `InsuranceID` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  `ContactID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`InsuranceID`),
  INDEX `AddressID` (`AddressID` ASC),
  INDEX `ContactID_idx` (`ContactID` ASC),
  CONSTRAINT `Insurance_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `medicalsystems`.`address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Insurance_ContactID`
    FOREIGN KEY (`ContactID`)
    REFERENCES `medicalsystems`.`contactinfo` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `medicalsystems`.`insurance` VALUES ('INS0000001', 'RIT Crappy Student Insurance', 'ADR0000001', '1');

-- -----------------------------------------------------
-- Table `medicalsystems`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`user` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`user` (
  `UserID` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(256) NOT NULL,
  `AccountType` CHAR(3) NOT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `medicalsystems`.`user` VALUES ('doctor1', 'password', 'PHY');
INSERT INTO `medicalsystems`.`user` VALUES ('patient1', 'password', 'PAT');

-- -----------------------------------------------------
-- Table `medicalsystems`.`practice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`practice` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`practice` (
  `PracticeID` INT(11) NOT NULL,
  `Name` VARCHAR(256) NULL DEFAULT NULL,
  `ContactID` INT(11) NULL DEFAULT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`PracticeID`),
  INDEX `ContactID_idx` (`ContactID` ASC),
  INDEX `AddressID_idx` (`AddressID` ASC),
  CONSTRAINT `AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `medicalsystems`.`address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ContactID`
    FOREIGN KEY (`ContactID`)
    REFERENCES `medicalsystems`.`contactinfo` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `medicalsystems`.`practice` VALUES (1, 'Test Practice', 1, 'ADR0000001');

-- -----------------------------------------------------
-- Table `medicalsystems`.`physician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`physician` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`physician` (
  `PhysicianID` VARCHAR(15) NOT NULL,
  `Name` VARCHAR(125) NULL DEFAULT NULL,
  `Specialty` VARCHAR(125) NULL DEFAULT NULL,
  `NewPatient` TINYINT(1) NULL DEFAULT NULL,
  `PracticeID` INT(11) NULL DEFAULT NULL,
  `InsuranceID` VARCHAR(10) NULL DEFAULT NULL,
  `UserID` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`PhysicianID`),
  INDEX `InsuranceID_idx` (`InsuranceID` ASC),
  INDEX `UserID_idx` (`UserID` ASC),
  INDEX `Physician_PracticeID` (`PracticeID` ASC),
  CONSTRAINT `Physician_InsuranceID`
    FOREIGN KEY (`InsuranceID`)
    REFERENCES `medicalsystems`.`insurance` (`InsuranceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Physician_PracticeID`
    FOREIGN KEY (`PracticeID`)
    REFERENCES `medicalsystems`.`pracice` (`PracticeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Physician_UserID`
    FOREIGN KEY (`UserID`)
    REFERENCES `medicalsystems`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `medicalsystems`.`physician` VALUES ('PHY000000000001', 'Dr. Mal Practice', 'Mortician', 1, 1, 'INS0000001', 'doctor1');


-- -----------------------------------------------------
-- Table `medicalsystems`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`patient` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`patient` (
  `PatientID` VARCHAR(15) NOT NULL,
  `UserID` VARCHAR(50) NULL DEFAULT NULL,
  `Name` VARCHAR(75) NULL DEFAULT NULL,
  `SSN` CHAR(9) NULL DEFAULT NULL,
  `MedicareID` CHAR(10) NULL DEFAULT NULL,
  `Weight` INT(11) NULL DEFAULT NULL,
  `DOB` DATE NULL DEFAULT NULL,
  `PhysicianID` VARCHAR(15) NULL DEFAULT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  `InsuranceID` VARCHAR(10) NULL DEFAULT NULL,
  `ContactID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  INDEX `PhysicianID` (`PhysicianID` ASC),
  INDEX `Patient_AddressID` (`AddressID` ASC),
  INDEX `Patient_InsuranceID` (`InsuranceID` ASC),
  INDEX `Patient_ContactID` (`ContactID` ASC),
  CONSTRAINT `Patient_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `medicalsystems`.`address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient_ContactID`
    FOREIGN KEY (`ContactID`)
    REFERENCES `medicalsystems`.`contact` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient_InsuranceID`
    FOREIGN KEY (`InsuranceID`)
    REFERENCES `medicalsystems`.`insurance` (`InsuranceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `medicalsystems`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `medicalsystems`.`patient` VALUES ('PAT000000000001', 'patient1', 'Ted Fitzgerald', 'xxxxxxxxx', 'xxxxxxxxxx', 170, '1994-01-20', 'PHY000000000001', 'ADR0000002', 'INS0000001', 2);

-- -----------------------------------------------------
-- Table `medicalsystems`.`addresspatient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`addresspatient` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`addresspatient` (
  `PatientID` VARCHAR(15) NULL DEFAULT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  INDEX `PatientID` (`PatientID` ASC),
  INDEX `AddressID_idx` (`AddressID` ASC),
  CONSTRAINT `Address_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `medicalsystems`.`address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Address_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `medicalsystems`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `medicalsystems`.`addresspatient` VALUES ('PAT000000000001', 'ADR0000002');

-- -----------------------------------------------------
-- Table `medicalsystems`.`appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`appointment` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`appointment` (
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
  CONSTRAINT `Appointment_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `medicalsystems`.`address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Appointment_InsuranceID`
    FOREIGN KEY (`InsuranceID`)
    REFERENCES `medicalsystems`.`insurance` (`InsuranceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Appointment_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `medicalsystems`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Appointment_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `medicalsystems`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `medicalsystems`.`appointment` VALUES ('APT0000001', 'PAT000000000001', 'PHY000000000001', 'INS0000001', '2016-05-05', 'ADR0000001', 'Routine checkup', 'Just gonna check and make sure I am still alive', 'SCHEDULED');
-- -----------------------------------------------------
-- Table `medicalsystems`.`medication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`medication` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`medication` (
  `MedicationID` INT(11) NOT NULL AUTO_INCREMENT,
  `TradeName` VARCHAR(256) NOT NULL,
  `GenericName` VARCHAR(256) NOT NULL,
  `GenericCategory` VARCHAR(100) NOT NULL,
  `TherapeuticCategory` VARCHAR(100) NOT NULL,
  `CounselingPoints` VARCHAR(500) NOT NULL,
  PRIMARY KEY (`MedicationID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `medicalsystems`.`messages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`messages` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`messages` (
  `MessageID` INT(11) NOT NULL,
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
    REFERENCES `medicalsystems`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Messages_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `medicalsystems`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `medicalsystems`.`patientphysician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`patientphysician` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`patientphysician` (
  `PatientID` VARCHAR(15) NOT NULL,
  `PhysicianID` VARCHAR(15) NOT NULL,
  INDEX `PatientID` (`PatientID` ASC),
  INDEX `PhysicianID` (`PhysicianID` ASC),
  CONSTRAINT `PatientPhysician_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `medicalsystems`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PatientPhysician_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `medicalsystems`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;




-- -----------------------------------------------------
-- Table `medicalsystems`.`physicianpractice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`physicianpractice` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`physicianpractice` (
  `PracticeID` INT(11) NULL DEFAULT NULL,
  `PhysicianID` VARCHAR(15) NULL DEFAULT NULL,
  INDEX `PhysicianID_idx` (`PhysicianID` ASC),
  INDEX `PracticeID_idx` (`PracticeID` ASC),
  CONSTRAINT `PhysicianPractice_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `medicalsystems`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PhysicianPractice_PracticeID`
    FOREIGN KEY (`PracticeID`)
    REFERENCES `medicalsystems`.`practice` (`PracticeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `medicalsystems`.`prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medicalsystems`.`prescription` ;

CREATE TABLE IF NOT EXISTS `medicalsystems`.`prescription` (
  `PrescriptionID` INT(11) NOT NULL,
  `MedicationID` INT(11) NULL DEFAULT NULL,
  `PhysicianID` VARCHAR(15) NULL DEFAULT NULL,
  `PatientID` VARCHAR(15) NULL DEFAULT NULL,
  `Dosage` VARCHAR(50) NULL DEFAULT NULL,
  `Refills` INT(11) NULL DEFAULT NULL,
  `Exp Date` DATE NULL DEFAULT NULL,
  `Frequency` VARCHAR(50) NULL DEFAULT NULL,
  `Route` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`PrescriptionID`),
  INDEX `PhysicianID` (`PhysicianID` ASC),
  INDEX `PatientID` (`PatientID` ASC),
  INDEX `MedicationID_idx` (`MedicationID` ASC),
  CONSTRAINT `Prescription_MedicationID`
    FOREIGN KEY (`MedicationID`)
    REFERENCES `medicalsystems`.`medication` (`MedicationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Prescription_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `medicalsystems`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Prescription_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `medicalsystems`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
