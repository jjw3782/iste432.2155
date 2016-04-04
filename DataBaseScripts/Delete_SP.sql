DROP PROCEDURE IF EXISTS 'delete_messages'
CREATE PROCEDURE delete_messages(IN messageid INT(11))
BEGIN
	DELETE * FROM messages WHERE MessageID = messageid;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'delete_prescription'
CREATE PROCEDURE delete_prescription(IN prescriptionid INT(11))
BEGIN
	DELETE * FROM prescription WHERE PrescriptionID = prescriptionid;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'delete_appointment'
CREATE PROCEDURE delete_appointment(IN appointmentid VARCHAR(10))
BEGIN
	DELETE * FROM appointment WHERE AppointmentID = appointmentid;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'delete_addresspatient'
CREATE PROCEDURE delete_addresspatient(IN address_id VARCHAR(10))
BEGIN
	DELETE * FROM addresspatient WHERE AddressID = address_id;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'delete_patientaddress'
CREATE PROCEDURE delete_patientaddress(IN patient_id VARCHAR(15))
BEGIN
	DELETE * FROM addresspatient WHERE PatientID = patient_id;
END
DELIMITER \\