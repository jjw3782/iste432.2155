DROP PROCEDURE IF EXISTS 'update_messages'
CREATE PROCEDURE update_messages(IN messid INT(11), IN send VARCHAR(15), IN receive VARCHAR(15), IN subj VARCHAR(100), IN bod VARCHAR(1000), IN stat VARCHAR(10), IN dat DATETIME)
BEGIN
	UPDATE messages SET MessageID = messid, Sender = send, Receiver = receive, Subject = subj, Body = bod, Status = stat, Date = dat
	WHERE MessageID = messid;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'update_addresspatient'
CREATE PROCEDURE update_addresspatient(IN patid VARCHAR(15), IN addrid VARCHAR(10))
BEGIN
	UPDATE addresspatient SET PatientID = patid, AddressID = addrid
	WHERE AddressID = addrid;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'update_patientaddress'
CREATE PROCEDURE update_patientaddress(IN patient_id VARCHAR(15), IN address_id VARCHAR(10))
BEGIN
	UPDATE addresspatient SET PatientID = patient_id, AddressID = address_id
	WHERE PatientID = patient_id;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'update_prescription'
CREATE PROCEDURE update_prescription(IN prescid INT(11), IN medid INT(11), IN physID VARCHAR(15), IN patID VARCHAR(15), IN dos VARCHAR(50), IN refi INT(11), IN expdat DATE, IN freq VARCHAR(50), IN rout VARCHAR(50))
BEGIN
	UPDATE prescription SET PrescriptionID = prescid, MedicationID = medid, PhysicianID = physID, PatientID = patID, Dosage = dos, Refills = refi, ExpDate = expdat, Frequency = freq, Route = rout
	WHERE PrescriptionID = prescid;
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'update_appointment'
CREATE PROCEDURE update_appointment(IN apptid VARCHAR(10), IN patId VARCHAR(15), IN physId VARCHAR(15), IN insurid VARCHAR(10), IN datt DATE, IN addressid VARCHAR(10), IN purp VARCHAR(50), IN descr TEXT, IN status VARCHAR(15))
BEGIN
	UPDATE appointment SET AppointmentID = apptid, PatientID = patId, PhysicianID = physId, InsuranceID = insurid, Date = datt, AddressID = addressid, Purpose = purp, Description = descr, Status = status
	WHERE AppointmentID = apptid;
END
DELIMITER \\