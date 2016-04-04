DROP PROCEDURE IF EXISTS 'select_contactinfo'
CREATE PROCEDURE select_contactinfo(IN contactid INT(11))
BEGIN
	SELECT * FROM contactinfo WHERE ContactID = contactid;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'select_insurance'
CREATE PROCEDURE select_insurance(IN insuranceid VARCHAR(10))
BEGIN
	SELECT * FROM insurance WHERE InsuranceID = insuranceid;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'select_patient'
CREATE PROCEDURE select_patient(IN patientid VARCHAR(15))
BEGIN
	SELECT * FROM patient WHERE PatientID = patientid;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'select_prescription'
CREATE PROCEDURE select_prescription(IN prescriptionid INT(11))
BEGIN
	SELECT * FROM prescription WHERE PrescriptionID = prescriptionid;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'select_patientphysician'
CREATE PROCEDURE select_patientphysician(IN patient_id VARCHAR(15))
BEGIN
	SELECT * FROM patientphysician WHERE PatientID = patient_id;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'select_physicianpatient'
CREATE PROCEDURE select_physicianpatient(IN physician_id VARCHAR(15))
BEGIN
	SELECT * FROM patientphysician WHERE PhysicianID = physician_id;
END
DELIMITER \\