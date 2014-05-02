Rocket Lawyer Junior DB Code Challenge
=============

Two coding challenges assigned as part of the Junior Database Administrator interview
process.


## Challenge 1 - Schema Design


##### Schema Diagram:

![schema](http://i.imgur.com/hcdVvtG.png)


#### Explanation

Users consist of a username, a password stored as a bcrypt hash, and a boolean flag
indicating whether or not they are active. If implemented, passwords could be
encrypted and decrypted using the bcrypt library for Python, available
[here](https://pypi.python.org/pypi/bcrypt/1.0.2).

Questions are stored as the question itself, a timestamp of when it was submitted,
and a link to the user that submitted the question.

Optionally, users can add attachments to questions which are stored as blobs and are
linked to their respective question.

Answers and answer attachments are modeled very similarly to questions, with the only
differences being an additional field in the answer linking it to a question and that
answer attachments are obviously linked to answers rather than questions.

The initial MySQL user used to create the db and tables was called "qaAdmin" and was
granted all privileges. The grants look like this:

	mysql> show grants for 'qaAdmin'@'localhost';
	+----------------------------------------------------------------------------------------------------------------+
	| Grants for qaAdmin@localhost                                                                                   |
	+----------------------------------------------------------------------------------------------------------------+
	| GRANT USAGE ON *.* TO 'qaAdmin'@'localhost' IDENTIFIED BY PASSWORD '*ABA46B1C52BAD8D6222352F40FBA75C4F1B70881' |
	| GRANT ALL PRIVILEGES ON `qanda`.* TO 'qaAdmin'@'localhost'                                                     |
	+----------------------------------------------------------------------------------------------------------------+

## Challenge 2 - Scripting


#### Users and Grants

A new user was created for retrieving the status data and was only granted the select
privilege. It's grants look like this:

	mysql> show grants for Logger;
	+------------------------------------------------------+
	| Grants for Logger@localhost                          |
	+------------------------------------------------------+
	| GRANT USAGE ON *.* TO 'Logger'@'%'                   |
	| GRANT SELECT ON `qanda`.`innodbinfo` TO 'Logger'@'%' |
	| GRANT SELECT ON `qanda`.`aborts` TO 'Logger'@'%'     |
	+------------------------------------------------------+

The qaAdmin user was used to do inserts into the database, but in a production
environment you may want to create a new user that only had insert and delete
privileges on the two relevant tables for security reasons.


#### Setup

Make a file called "DBINFO.ini" and include the following data, replacing it with
your information:

	host_ip=my_db_host
	port=my_db_port
	user=my_db_user
	passwd=my_db_password
	db=my_db_name

Once that's done you'll need to make sure you have PyMySQL installed. If you don't,
you can get it via pip (included by default in Python 3.4, or get it
[here](http://www.pip-installer.org/en/latest/) for previous versions),
[pypi](https://pypi.python.org/pypi/PyMySQL), or
[github](https://github.com/PyMySQL/PyMySQL).


#### Usage

Run the script with python3 like this:

	python3 dbmonitor.py

There are a five available command-line arguments:

	host_ip*
	port
	user*
	passwd*
	db

Options with an asterisk are semi-optional - you will be prompted for them
if they aren't provided. By default, `port` is assigned to 3306 and `db` is
"qanda" (the values I used locally during development).

Use the `-h` or `--help` flag for more information about command-line arguments.