DROP PROCEDURE IF EXISTS 'insert_messages'
CREATE PROCEDURE insert_messages(IN messid INT(11), IN send VARCHAR(15), IN receive VARCHAR(15), IN subj VARCHAR(100), IN bod VARCHAR(1000), IN stat VARCHAR(10), IN dat DATETIME)
BEGIN
	INSERT INTO messages (MessageID, Sender, Receiver, Subject, Body, Status, Date)
	VALUES (messid, send, receive, subj, bod, stat, dat);
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'insert_addresspatient'
CREATE PROCEDURE insert_addresspatient(IN patid VARCHAR(15), IN addrid VARCHAR(10))
BEGIN
	INSERT INTO addresspatient (PatientID, AddressID) VALUES (patid, addrid);
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'insert_prescription'
CREATE PROCEDURE insert_prescription(IN prescid INT(11), IN medid INT(11), IN phys_id VARCHAR(15), IN pat_id VARCHAR(15), IN dos VARCHAR(50), IN refi INT(11), IN expdat DATE, IN freq VARCHAR(50), IN rout VARCHAR(50))
BEGIN
	INSERT INTO prescription (PrescriptionID, MedicationID, PhysicianID, PatientID, Dosage, Refills, ExpDate, Frequency, Route)
	VALUES (prescid, medid, phys_id, pat_id, dos, refi, expdat, freq, rout);
END
DELIMITER \\

DROP PROCEDURE IF EXISTS 'insert_appointment'
CREATE PROCEDURE insert_appointment(IN apptid VARCHAR(10), IN patId VARCHAR(15), IN physid VARCHAR(15), IN insurid VARCHAR(10), IN dat DATE, IN addr_id VARCHAR(10), IN purp VARCHAR(50), IN descr TEXT, IN status VARCHAR(15))
BEGIN
	INSERT INTO appointment (AppointmentID, PatientID, PhysicianID, InsuranceID, Date, 	AddressID, Purpose, Description, Status)
	VALUES (apptid, patId, physid, insurid, dat, addr_id, purp, descr, status);
END
DELIMITER \\