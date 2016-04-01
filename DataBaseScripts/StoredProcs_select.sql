DELIMITER ;
USE iste432a;

DROP PROCEDURE IF EXISTS select_appointment;
DROP PROCEDURE IF EXISTS select_messages;
DROP PROCEDURE IF EXISTS select_user;
DROP PROCEDURE IF EXISTS select_address;
DROP PROCEDURE IF EXISTS select_medication;


DELIMITER //


CREATE PROCEDURE select_appointment(IN apptID VARCHAR(10))
BEGIN
	SELECT * FROM Appointment WHERE AppointmentID = apptID;
END//


CREATE PROCEDURE select_messages(IN msgID INT(11))
BEGIN
	SELECT * FROM Messages WHERE MessageID = msgID;
END//

CREATE PROCEDURE select_user(IN usrID INT)
BEGIN
	SELECT * FROM `User` WHERE UserID = usrID;
END//

CREATE PROCEDURE select_address(IN addrID VARCHAR(10))
BEGIN
	SELECT * FROM Address WHERE AddressID = addrID;
END//

CREATE PROCEDURE select_medication(IN medID INT(11))
BEGIN
	SELECT * FROM Medication WHERE MedicationID = medID;
END//

DELIMITER ;