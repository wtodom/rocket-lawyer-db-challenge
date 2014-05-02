# TODO:

# - create user2 (only needs select privileges)
# - update privileges on qaAdmin, or create new user to do inserts
# - get conn info from prompt
# - get conn info from command line
# - get data from show status: "show status like '%aborted%';" on db2
# - get data from show status: "show status like '%innodb%';" on db2
# - remove records older than 30 days on script execution

import pymysql


def get_db1_info():
	with open("DBINFO.ini", "r") as f:
		conn_info = [line.rstrip().split("=")[1] for line in f.readlines()]
		conn_info[1] = int(conn_info[1])
	return conn_info
