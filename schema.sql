DROP DATABASE Mail;
CREATE DATABASE Mail;
 
use Mail;

CREATE TABLE User (
    id INT NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(25) NOT NULL,
    lastname VARCHAR(25) NOT NULL,
    password VARCHAR(15) NOT NULL,
    username VARCHAR(15) NOT NULL,
    PRIMARY KEY(id)
    )ENGINE=MyISAM AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8;
    
CREATE TABLE Message (
    id INT NOT NULL AUTO_INCREMENT,
    body VARCHAR(3000) NOT NULL,
    subject VARCHAR(1000) NOT NULL,
    user_id INT,
    recipient_ids VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
    )ENGINE=MyISAM AUTO_INCREMENT=2000 DEFAULT CHARSET=utf8;

CREATE TABLE Message_read (
    id INT AUTO_INCREMENT,
    message_id INT,
    reader_id INT,
    date DATETIME NOT NULL,
    PRIMARY KEY(id)
    )ENGINE=MyISAM AUTO_INCREMENT=3000 DEFAULT CHARSET=utf8;
    
INSERT INTO User(firstname, lastname, password,username) VALUES('Ashley','Walker','Passw0rd','ash007');
INSERT INTO User(firstname, lastname, password,username) VALUES('Brian','Spectre','Passw0rd','spec10');
INSERT INTO User(firstname, lastname, password,username) VALUES('James','Mason','Passw0rd','jmason');


INSERT INTO Message(body, subject, user_id, recipient_ids) VALUES('Yow! When can I get my money?', 'Greetings', 1000, '1001');
INSERT INTO Message_read(message_id,reader_id,date) VALUES(2000,1001, STR_TO_DATE('12/18/2014 1:10:26 PM', '%c/%e/%Y %r'));

INSERT INTO Message(body, subject, user_id, recipient_ids) VALUES('I dont have it as yet', 'Greetings', 1001, '1000');
INSERT INTO Message_read(message_id,reader_id,date) VALUES(2001,1000, STR_TO_DATE('12/18/2014 1:22:26 PM', '%c/%e/%Y %r'));

INSERT INTO Message(body, subject, user_id, recipient_ids) VALUES('I need to buy a new laptop?', 'Greetings', 1000, '1001');
INSERT INTO Message_read(message_id,reader_id,date) VALUES(2002,1001, STR_TO_DATE('12/18/2015 1:36:26 PM', '%c/%e/%Y %r'));

INSERT INTO Message(body, subject, user_id, recipient_ids) VALUES('I will repay you in four days.', 'Greetings', 1001, '1000');
INSERT INTO Message_read(message_id,reader_id,date) VALUES(2003,1000, STR_TO_DATE('12/18/2015 1:53:26 PM', '%c/%e/%Y %r'));

DELETE FROM Message WHERE id = 2002;
DELETE FROM Message_read WHERE id=3001;

SELECT * FROM Message JOIN Message_read ON message.id = Message_read.message_id WHERE message_read.reader_id = 1000 ORDER BY date;

SELECT * FROM Message JOIN Message_read ON message.id = Message_read.message_id;

SELECT * FROM Message JOIN Message_read ;

SELECT * FROM Message;
SELECT * FROM Message_read ORDER BY date;

SELECT last_insert_id() FROM Message;