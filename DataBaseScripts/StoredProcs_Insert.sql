DELIMITER ;
USE iste432a;

-- medication Insert 
DROP PROCEDURE IF EXISTS insert_medication;
DROP PROCEDURE IF EXISTS insert_contact_info;
DROP PROCEDURE IF EXISTS insert_address;
DROP PROCEDURE IF EXISTS insert_user;
DROP PROCEDURE IF EXISTS insert_insurance;
DROP PROCEDURE IF EXISTS insert_practice;
DROP PROCEDURE IF EXISTS insert_patient;
DROP PROCEDURE IF EXISTS insert_physician;
DROP PROCEDURE IF EXISTS insert_patientPhysician;

DELIMITER //
-- medication Insert
CREATE PROCEDURE insert_medication
	(IN _medicationID int(11),
	IN _tradeName varchar(256),
	IN _genericName varchar(256),
	IN _genericCategory varchar(125),
	IN _therapeuticCategory varchar(125),
	IN _counselingPoints text)
	BEGIN
		-- create 
		INSERT INTO `medication`(`MedicationID`, `TradeName`, `GenericName`, `GenericCategory`, `TherapeuticCategory`, `CounselingPoints`) 
		VALUES (_medicationID,_tradeName,_genericName,_genericCategory,_therapeuticCategory,_counselingPoints);
	END //
	
-- contactinfo Insert 
CREATE PROCEDURE insert_contact_info
	(IN _contactID int(11),
	IN _phone char(10),
	IN _email varchar(30))
	BEGIN
		-- create contact
		INSERT INTO `contactinfo`(`ContactID`, `Phone`, `Email`) 
		VALUES (_contactID,_phone,_email);
	END //	


-- address Insert 
CREATE PROCEDURE insert_address
	(IN _addressID varchar(10),
	IN _street varchar(30),
	IN _city varchar(30),
	IN _state varchar(2),
	IN _zip varchar(5))
	BEGIN
		-- create addr
		INSERT INTO `address`(`AddressID`, `Street`, `City`, `State`, `Zip`) 
		VALUES (_addressID,_street,_city,_state,_zip);
	END //


-- user Insert 	
CREATE PROCEDURE insert_user
	(IN _userID varchar(50),
	IN _password varchar(256),
	IN _accountType char(3))
	BEGIN
		-- create user
		INSERT INTO `user`(`UserID`, `Password`, `AccountType`) 
		VALUES (_userID,_password,_accountType);
	END //


-- user insurance 	
CREATE PROCEDURE insert_insurance
	(IN _insuranceID varchar(10),
	IN _name varchar(30),
	IN _addressID varchar(10),
	IN _contactID int(11))
	BEGIN
		-- create ins
		INSERT INTO `insurance`(`InsuranceID`, `Name`, `AddressID`, `ContactID`) 
		VALUES (_insuranceID,_name,_addressID,_contactID);
	END //

 -- insert practice
   CREATE PROCEDURE insert_practice(IN prctID INT(11), IN prName VARCHAR(256), IN conID INT(11), IN addrID VARCHAR(10))
BEGIN
	INSERT INTO Practice (PracticeID, Name, ContactID, AddressID)
	VALUES (prctID, prName, conID, addrID);
END//


-- insert patient
CREATE PROCEDURE insert_patient(IN patID VARCHAR(15), IN usrID VARCHAR(50), IN pname VARCHAR(75), IN soc CHAR(9), IN medID CHAR(10), IN pWeight INT(11), IN birth DATE, IN physID VARCHAR(15), IN addrID VARCHAR(10), IN insID VARCHAR(10), IN conID INT(11))
BEGIN
	INSERT INTO Patient (PatientID, UserID, Name, SSN, MedicareID, Weight, DOB, PhysicianID, AddressID, InsuranceID, ContactID)
	VALUES (patID, usrID, pname, soc, medID, pWeight, birth, physID, addrID, insID, conID);
END//


--insert physician
CREATE PROCEDURE insert_physician(IN physID VARCHAR(15), IN phName VARCHAR(125), IN spec VARCHAR(125), IN newPat TINYINT(1), IN insID VARCHAR(10), usrID VARCHAR(50))
BEGIN
	INSERT INTO Physician (PhysicianID, Name, Specialty, NewPatient, InsuranceID, UserID)
	VALUES (physID, phName, spec, newPat, insID, usrID);
END//

-- insert patient physician
CREATE PROCEDURE insert_patientPhysician(IN patID VARCHAR(15), IN physID VARCHAR(15))
BEGIN
	INSERT INTO PatientPhysician (PatientID, PhysicianID) 
	VALUES (patID, physID);
END//
DELIMITER ;
