DELIMITER ;
USE iste432a;

DROP PROCEDURE IF EXISTS select_appointment;
DROP PROCEDURE IF EXISTS select_messages;
DROP PROCEDURE IF EXISTS select_user;
DROP PROCEDURE IF EXISTS select_address;
DROP PROCEDURE IF EXISTS select_medication;
DROP PROCEDURE IF EXISTS select_refillrequest;


DELIMITER //


CREATE PROCEDURE select_appointment(IN apptID VARCHAR(10))
BEGIN
	SELECT * FROM appointment WHERE AppointmentID = apptID;
END//


CREATE PROCEDURE select_messages(IN msgID INT(11))
BEGIN
	SELECT * FROM messages WHERE MessageID = msgID;
END//

CREATE PROCEDURE select_user(IN usrID INT)
BEGIN
	SELECT * FROM `user` WHERE UserID = usrID;
END//

CREATE PROCEDURE select_address(IN addrID VARCHAR(10))
BEGIN
	SELECT * FROM address WHERE AddressID = addrID;
END//

CREATE PROCEDURE select_medication(IN medID INT(11))
BEGIN
	SELECT * FROM medication WHERE MedicationID = medID;
END//

CREATE PROCEDURE select_refillrequest(IN prescriptionID INT(11), IN dateCreated DATE)
BEGIN
	SELECT * FROM refillrequest WHERE PrescriptionID = prescriptionID AND DateCreated = dateCreated;
END//

DELIMITER ;