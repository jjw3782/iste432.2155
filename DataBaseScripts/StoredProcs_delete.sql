DELIMITER ;
USE iste432a;

-- medication delete 
DROP PROCEDURE IF EXISTS DeleteMedication;
DROP PROCEDURE IF EXISTS DeleteContactInfo;
DROP PROCEDURE IF EXISTS DeleteAddress;
DROP PROCEDURE IF EXISTS DeleteUser;
DROP PROCEDURE IF EXISTS DeleteInsurance;

DELIMITER //
-- medication delete
CREATE PROCEDURE DeleteMedication
	(IN _medicationID int(11))
	BEGIN
		DELETE FROM Medication
		WHERE MedicationID = _medicationID;
	END //
	
-- contactinfo delete 
CREATE PROCEDURE DeleteContactInfo
	(IN _contactID int(11))
	BEGIN
		-- delte contact
		DELETE FROM ContactInfo
		WHERE ContactID = _contactID;
	END //	


-- address delete 
CREATE PROCEDURE DeleteAddress
	(IN _addressID varchar(10))
	BEGIN
		-- delte addr
		DELETE FROM Address
		WHERE AddressID = _addressID;
	END //


-- user delete 	
CREATE PROCEDURE DeleteUser
	(IN _userID int(11))
	BEGIN
		-- delte med
		DELETE FROM `User`
		WHERE UserID = _userID;
	END //


-- user insurance 	
CREATE PROCEDURE DeleteInsurance
	(IN _insuranceID int(11))
	BEGIN
		-- delte med
		DELETE FROM Insurance
		WHERE InsuranceID = _insuranceID;
	END //

DELIMITER ;
