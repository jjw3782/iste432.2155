DELIMITER ;
USE iste432a;

-- medication Insert 
DROP PROCEDURE IF EXISTS InsertMedication;
DROP PROCEDURE IF EXISTS InsertContactInfo;
DROP PROCEDURE IF EXISTS InsertAddress;
DROP PROCEDURE IF EXISTS InsertUser;
DROP PROCEDURE IF EXISTS InsertInsurance;

DELIMITER //
-- medication Insert
CREATE PROCEDURE InsertMedication
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
CREATE PROCEDURE InsertContactInfo
	(IN _contactID int(11),
	IN _phone char(10),
	IN _email varchar(30))
	BEGIN
		-- create contact
		INSERT INTO `contactinfo`(`ContactID`, `Phone`, `Email`) 
		VALUES (_contactID,_phone,_email);
	END //	


-- address Insert 
CREATE PROCEDURE InsertAddress
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
CREATE PROCEDURE InsertUser
	(IN _userID varchar(50),
	IN _password varchar(256),
	IN _accountType char(3))
	BEGIN
		-- create user
		INSERT INTO `user`(`UserID`, `Password`, `AccountType`) 
		VALUES (_userID,_password,_accountType);
	END //


-- user insurance 	
CREATE PROCEDURE InsertInsurance
	(IN _insuranceID varchar(10),
	IN _name varchar(30),
	IN _addressID varchar(10),
	IN _contactID int(11))
	BEGIN
		-- create ins
		INSERT INTO `insurance`(`InsuranceID`, `Name`, `AddressID`, `ContactID`) 
		VALUES (_insuranceID,_name,_addressID,_contactID);
	END //

DELIMITER ;
