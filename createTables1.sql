use qanda;

CREATE TABLE if not exists Users (
	id integer(11) NOT NULL auto_increment PRIMARY KEY,
	username varchar(20) NOT NULL UNIQUE,
	password char(60) NOT NULL,
	active tinyint(1) NOT NULL
) ENGINE = INNODB ;

CREATE TABLE if not exists Questions (
	id integer(11) NOT NULL auto_increment PRIMARY KEY,
	question text NOT NULL,
	date_submitted datetime NOT NULL,
    INDEX(submitted_by),
    submitted_by integer NOT NULL REFERENCES Users (id)
) ENGINE = INNODB ;

CREATE TABLE if not exists Question_Attachments (
	id integer(11) NOT NULL auto_increment PRIMARY KEY,
	attachment blob NOT NULL,
    INDEX(questionID),
	questionID int(11) NOT NULL REFERENCES Questions (id)
) ENGINE = INNODB ;

CREATE TABLE if not exists Answers (
	id integer(11) NOT NULL auto_increment PRIMARY KEY,
	answer text NOT NULL,
	date_submitted datetime NOT NULL,
    INDEX(submitted_by),
    submitted_by integer NOT NULL REFERENCES Users (id),
    INDEX(questionID),
    questionID integer NOT NULL REFERENCES Questions (id)
) ENGINE = INNODB ;

CREATE TABLE if not exists Answer_Attachments (
	id integer(11) NOT NULL auto_increment PRIMARY KEY,
	attachment blob NOT NULL,
    INDEX(answerID),
	answerID int(11) NOT NULL REFERENCES Answers (id)
) ENGINE = INNODB ;