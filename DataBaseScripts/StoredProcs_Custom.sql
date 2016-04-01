DELIMITER ;
USE iste432a;

DROP PROCEDURE IF EXISTS get_all_messages_by_user;
DROP PROCEDURE IF EXISTS get_message_by_messageID;
DROP PROCEDURE IF EXISTS get_message_where_subject_contains;
DROP PROCEDURE IF EXISTS update_message_status;
DROP PROCEDURE IF EXISTS get_all_messages_by_user;
DROP PROCEDURE IF EXISTS get_users_where_username_like;

DELIMITER \\

-- get all messages by user for Jon
CREATE PROCEDURE get_all_messages_by_user(
IN userID varchar(50))
BEGIN
   SELECT * FROM messages
   WHERE Sender = userID OR Recipient = userID;
END \\

-- get message by message id for Jon
CREATE PROCEDURE get_message_by_messageID(
IN msgID int(11))
BEGIN
   SELECT * FROM messages
   WHERE MessageID = msgID;
END \\

-- get message where subject contains for Jon
CREATE PROCEDURE get_message_where_subject_contains(
IN find varchar(100),
IN userID varchar(50))
BEGIN
   SELECT * FROM messages
   WHERE Subject LIKE CONCAT('%', find, '%')
   AND (Sender = userID OR Recipient = userID);   
END \\

-- update mesg status for jon
CREATE PROCEDURE update_message_status(
IN msgID int(11),
IN status varchar(10),
OUT success TINYINT(1))
BEGIN
   UPDATE messages
   SET Status = status
   WHERE MessageID = msgID;   
   
   IF ROW_COUNT() > 0 THEN
      SET success = 1;
   ELSE 
      SET success = 0;
   END IF;
   
END \\


-- find users for jon
CREATE PROCEDURE get_users_where_username_like(
IN find varchar(50))
BEGIN
   SELECT PatientID as ID, Name FROM patient
   WHERE Name LIKE CONCAT('%', find, '%')
   UNION
   SELECT PhysicianID as ID, Name FROM physician
   WHERE Name LIKE CONCAT('%', find, '%');   
END \\

DELIMITER ;