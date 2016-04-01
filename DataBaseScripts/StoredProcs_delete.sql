DELIMITER ;
USE iste432a;

-- medication delete 
DROP PROCEDURE IF EXISTS delete_medication;
DROP PROCEDURE IF EXISTS delete_contact_info;
DROP PROCEDURE IF EXISTS delete_address;
DROP PROCEDURE IF EXISTS delete_user;
DROP PROCEDURE IF EXISTS delete_insurance;

DROP PROCEDURE IF EXISTS delete_practice;
DROP PROCEDURE IF EXISTS delete_patient;
DROP PROCEDURE IF EXISTS delete_physician;
DROP PROCEDURE IF EXISTS delete_physicianPatient;
DROP PROCEDURE IF EXISTS delete_patientPhysician;

DELIMITER //
-- medication delete
CREATE PROCEDURE delete_medication
	(IN _medicationID int(11))
	BEGIN
		DELETE FROM Medication
		WHERE MedicationID = _medicationID;
	END //
	
-- contactinfo delete 
CREATE PROCEDURE delete_contact_info
	(IN _contactID int(11))
	BEGIN
		-- delte contact
		DELETE FROM ContactInfo
		WHERE ContactID = _contactID;
	END //	


-- address delete 
CREATE PROCEDURE delete_address
	(IN _addressID varchar(10))
	BEGIN
		-- delte addr
		DELETE FROM Address
		WHERE AddressID = _addressID;
	END //


-- user delete 	
CREATE PROCEDURE delete_user
	(IN _userID int(11))
	BEGIN
		-- delte med
		DELETE FROM `User`
		WHERE UserID = _userID;
	END //


-- user insurance 	
CREATE PROCEDURE delete_insurance
	(IN _insuranceID int(11))
	BEGIN
		-- delte med
		DELETE FROM Insurance
		WHERE InsuranceID = _insuranceID;
	END //

   
CREATE PROCEDURE delete_practice(IN prctID INT(11))
BEGIN
	DELETE FROM Practice WHERE PracticeID = prctID;
END//

CREATE PROCEDURE delete_patient(IN patID VARCHAR(15))
BEGIN
	DELETE FROM Patient WHERE PatientID = patID;
END//

CREATE PROCEDURE delete_physician(IN physID VARCHAR(15))
BEGIN
	DELETE FROM Physician WHERE PhysicianID = physID;
END//

CREATE PROCEDURE delete_physicianPatient(IN physID VARCHAR(15))
BEGIN
	DELETE FROM PatientPhysician WHERE PhysicianID = physID;
END//

CREATE PROCEDURE delete_patientPhysician(IN patID VARCHAR(15))
BEGIN
	DELETE FROM PatientPhysician WHERE PatientID = patID;
END//

DELIMITER ;
