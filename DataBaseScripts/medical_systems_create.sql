SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

USE `iste432a` ;

-- -----------------------------------------------------
-- Table `iste432a`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`address` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`address` (
  `AddressID` VARCHAR(10) NOT NULL,
  `Street` VARCHAR(30) NOT NULL,
  `City` VARCHAR(30) NOT NULL,
  `State` VARCHAR(2) NOT NULL,
  `Zip` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`AddressID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `iste432a`.`contactinfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`contactinfo` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`contactinfo` (
  `ContactID` INT(11) NOT NULL AUTO_INCREMENT,
  `Phone` CHAR(10) NULL DEFAULT NULL,
  `Email` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`ContactID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `iste432a`.`insurance`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`insurance` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`insurance` (
  `InsuranceID` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  `ContactID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`InsuranceID`),
  INDEX `AddressID` (`AddressID` ASC),
  INDEX `ContactID_idx` (`ContactID` ASC),
  CONSTRAINT `Insurance_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `iste432a`.`address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Insurance_ContactID`
    FOREIGN KEY (`ContactID`)
    REFERENCES `iste432a`.`contactinfo` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `iste432a`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`user` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`user` (
  `UserID` VARCHAR(50) NOT NULL,
  `Password` VARCHAR(256) NOT NULL,
  `AccountType` CHAR(3) NOT NULL,
  PRIMARY KEY (`UserID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `iste432a`.`practice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`practice` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`practice` (
  `PracticeID` INT(11) NOT NULL,
  `Name` VARCHAR(256) NULL DEFAULT NULL,
  `ContactID` INT(11) NULL DEFAULT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`PracticeID`),
  INDEX `ContactID_idx` (`ContactID` ASC),
  INDEX `AddressID_idx` (`AddressID` ASC),
  CONSTRAINT `AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `iste432a`.`address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ContactID`
    FOREIGN KEY (`ContactID`)
    REFERENCES `iste432a`.`contactinfo` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `iste432a`.`physician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`physician` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`physician` (
  `PhysicianID` VARCHAR(15) NOT NULL,
  `Name` VARCHAR(125) NULL DEFAULT NULL,
  `Specialty` VARCHAR(125) NULL DEFAULT NULL,
  `NewPatient` TINYINT(1) NULL DEFAULT NULL,
  `InsuranceID` VARCHAR(10) NULL DEFAULT NULL,
  `UserID` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`PhysicianID`),
  INDEX `InsuranceID_idx` (`InsuranceID` ASC),
  INDEX `UserID_idx` (`UserID` ASC),
  CONSTRAINT `Physician_InsuranceID`
    FOREIGN KEY (`InsuranceID`)
    REFERENCES `iste432a`.`insurance` (`InsuranceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Physician_UserID`
    FOREIGN KEY (`UserID`)
    REFERENCES `iste432a`.`user` (`UserID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iste432a`.`patient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`patient` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`patient` (
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
    REFERENCES `iste432a`.`address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient_ContactID`
    FOREIGN KEY (`ContactID`)
    REFERENCES `iste432a`.`contact` (`ContactID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient_InsuranceID`
    FOREIGN KEY (`InsuranceID`)
    REFERENCES `iste432a`.`insurance` (`InsuranceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `iste432a`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `iste432a`.`addresspatient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`addresspatient` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`addresspatient` (
  `PatientID` VARCHAR(15) NULL DEFAULT NULL,
  `AddressID` VARCHAR(10) NULL DEFAULT NULL,
  INDEX `PatientID` (`PatientID` ASC),
  INDEX `AddressID_idx` (`AddressID` ASC),
  CONSTRAINT `Address_AddressID`
    FOREIGN KEY (`AddressID`)
    REFERENCES `iste432a`.`address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Address_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `iste432a`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `iste432a`.`appointment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`appointment` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`appointment` (
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
    REFERENCES `iste432a`.`address` (`AddressID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Appointment_InsuranceID`
    FOREIGN KEY (`InsuranceID`)
    REFERENCES `iste432a`.`insurance` (`InsuranceID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Appointment_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `iste432a`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Appointment_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `iste432a`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `iste432a`.`medication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`medication` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`medication` (
  `MedicationID` INT(11) NOT NULL AUTO_INCREMENT,
  `TradeName` VARCHAR(256) NOT NULL,
  `GenericName` VARCHAR(256) NOT NULL,
  `GenericCategory` VARCHAR(125) NOT NULL,
  `TherapeuticCategory` VARCHAR(125) NOT NULL,
  `CounselingPoints` TEXT NOT NULL,
  PRIMARY KEY (`MedicationID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iste432a`.`messages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`messages` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`messages` (
  `MessageID` INT(11) NOT NULL AUTO_INCREMENT,
  `Sender` VARCHAR(15) NULL DEFAULT NULL,
  `Recipient` VARCHAR(15) NULL DEFAULT NULL,
  `Subject` VARCHAR(100) NULL DEFAULT NULL,
  `Body` VARCHAR(1000) NULL DEFAULT NULL,
  `Status` VARCHAR(10) NULL DEFAULT NULL,
  `Date` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`MessageID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `iste432a`.`patientphysician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`patientphysician` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`patientphysician` (
  `PatientID` VARCHAR(15) NOT NULL,
  `PhysicianID` VARCHAR(15) NOT NULL,
  INDEX `PatientID` (`PatientID` ASC),
  INDEX `PhysicianID` (`PhysicianID` ASC),
  CONSTRAINT `PatientPhysician_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `iste432a`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PatientPhysician_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `iste432a`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iste432a`.`physicianpractice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`physicianpractice` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`physicianpractice` (
  `PracticeID` INT(11) NULL DEFAULT NULL,
  `PhysicianID` VARCHAR(15) NULL DEFAULT NULL,
  INDEX `PhysicianID_idx` (`PhysicianID` ASC),
  INDEX `PracticeID_idx` (`PracticeID` ASC),
  CONSTRAINT `PhysicianPractice_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `iste432a`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PhysicianPractice_PracticeID`
    FOREIGN KEY (`PracticeID`)
    REFERENCES `iste432a`.`practice` (`PracticeID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `iste432a`.`prescription`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `iste432a`.`prescription` ;

CREATE TABLE IF NOT EXISTS `iste432a`.`prescription` (
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
    REFERENCES `iste432a`.`medication` (`MedicationID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Prescription_PatientID`
    FOREIGN KEY (`PatientID`)
    REFERENCES `iste432a`.`patient` (`PatientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Prescription_PhysicianID`
    FOREIGN KEY (`PhysicianID`)
    REFERENCES `iste432a`.`physician` (`PhysicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
