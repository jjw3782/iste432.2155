DELIMITER ;
USE iste432a;
-- ted
DROP PROCEDURE IF EXISTS delete_medication;
DROP PROCEDURE IF EXISTS delete_contact_info;
DROP PROCEDURE IF EXISTS delete_address;
DROP PROCEDURE IF EXISTS delete_user;
DROP PROCEDURE IF EXISTS delete_insurance;

--gary
DROP PROCEDURE IF EXISTS delete_practice;
DROP PROCEDURE IF EXISTS delete_patient;
DROP PROCEDURE IF EXISTS delete_physician;
DROP PROCEDURE IF EXISTS delete_physicianPatient;
DROP PROCEDURE IF EXISTS delete_patientPhysician;

-- custom
DROP PROCEDURE IF EXISTS delete_refillrequest;

DELIMITER //
-- medication delete
CREATE PROCEDURE delete_medication
	(IN _medicationID int(11))
	BEGIN
		DELETE FROM medication
		WHERE MedicationID = _medicationID;
	END //
	
-- contactinfo delete 
CREATE PROCEDURE delete_contact_info
	(IN _contactID int(11)

	BEGIN
		-- delte contact
		DELETE FROM contactInfo
		WHERE ContactID = _contactID;
	END //	


-- address delete 
CREATE PROCEDURE delete_address
	(IN _addressID varchar(10))
	BEGIN
		-- delte addr
		DELETE FROM address
		WHERE AddressID = _addressID;
	END //


-- user delete 	
CREATE PROCEDURE delete_user
	(IN _userID int(11))
	BEGIN
		-- delte med
		DELETE FROM `user`
		WHERE UserID = _userID;
	END //


-- user insurance 	
CREATE PROCEDURE delete_insurance
	(IN _insuranceID int(11))
	BEGIN
		-- delte med
		DELETE FROM insurance
		WHERE InsuranceID = _insuranceID;
	END //

   
CREATE PROCEDURE delete_practice(IN prctID INT(11))
BEGIN
	DELETE FROM practice WHERE PracticeID = prctID;
END//

CREATE PROCEDURE delete_patient(IN patID VARCHAR(15))
BEGIN
	DELETE FROM patient WHERE PatientID = patID;
END//

CREATE PROCEDURE delete_physician(IN physID VARCHAR(15))
BEGIN
	DELETE FROM physician WHERE PhysicianID = physID;
END//

CREATE PROCEDURE delete_physicianPatient(IN physID VARCHAR(15))
BEGIN
	DELETE FROM patientphysician WHERE PhysicianID = physID;
END//

CREATE PROCEDURE delete_patientPhysician(IN patID VARCHAR(15))
BEGIN
	DELETE FROM patientphysician WHERE PatientID = patID;
END//

CREATE PROCEDURE delete_refillrequest(IN prescriptionID INT(11), IN dateCreated DATE)
BEGIN
	DELETE FROM refillrequest WHERE PrescriptionID = prescriptionID AND DateCreated = dateCreated;
END//
DELIMITER ;
