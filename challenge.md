## Junior DB Code challenge

Thank you for your interest in the Junior DBA position at RocketLawyer. In order to proceed with the interview process we would like you to complete the following challenges. Please complete both challenges. Submit the code/models for both challenges at the same time.

### BONUS:
- Check your code, model, and any other files into a public github repo for submission
- Write a README.md describing your application in git.

### Challenge 1 - Schema Design

- Create a new MySQL database server (prefered on Unix)
- In that MySQL server, create a new schema and a new MySQL user
- In that schema create a model that we can use to ask questions and track answers to those questions
- Model should include:
	- A user authentication system
	- A way to track conversations
	- #### BONUS:
		- A way to add attachments to a conversation
- Submit a MySQL dump of the schema as well as the “show grants for” the user(s) you created
	- can be combined with the submission of the second challenge

#### DO NOT CREATE A WEB APP FOR THIS SCHEMA
- We are just looking for the table structure and grants

### Challenge 2 - Scripting

In your choice of scripting language (Python, Ruby or Bash) write a stand alone application.

That application should do the following:

- In the database server you created above, create a new schema, database user and a table described below. This will be referred to as database 1 below.
- Read the connection information from a config or ini file to connect to a database, call this database 1
- Prompt for a database host, user and password. Call this database 2
	- Database 1 and 2 can be the same server for this challenge, but the connection information needs to be provided in both the ini/config and the prompts
- Allow those parameters for connection 2 to be passed on the command line instead of prompting. If one value is left out of the command line the script should prompt for it.
- Connect to database 2 and run a "show status like '%aborted'%;"
- Connect to database 1 and store the values from the the show status into a table.
- Allow for this script to be ran multiple times and store the values without overwriting any values
- Bonus:
	- Store the values from a “show status like ‘%innodb%’;”
	- When ran remove any record from the table older than 30 days
	- Provide a dump file of the database after running a few times

Submit all your code and sql scripts. Don’t forget about the Bonus sections including the first one before the challenges.