# TODO:

# - update privileges on qaAdmin, or create new user to do inserts
# - insert innodb status data with db1 connection
# - remove records older than 30 days on script execution

import argparse
import time
import getpass
import pymysql


parser = argparse.ArgumentParser()

parser.add_argument('--host', help='db2\'s host ip address')
parser.add_argument('--user', help='user to login to db2 as')
parser.add_argument('--password', help='password to login to db2 with')
parser.add_argument('--database', help='database connect to for db2', default='qanda')

args = parser.parse_args()

if args.host is None:
	args.host = input("Host: ")

if args.user is None:
	args.user = input("Username: ")

if args.password is None:
	args.password = getpass.getpass()

def get_db1_info():
	with open("DBINFO.ini", "r") as f:
		conn_info = [line.rstrip().split("=")[1] for line in f.readlines()]
		conn_info[1] = int(conn_info[1])
	return conn_info

db1_info = get_db1_info()
db2_info = [args.host, 3306, args.user, args.password, args.database]

def connect(conn_info):
	"""
	Expects a list of the form:
	[str(host), int(port), str(username), str(password), str(database_name)]
	"""
	return pymysql.connect(
		host=conn_info[0],
		port=conn_info[1],
		user=conn_info[2],
		passwd=conn_info[3],
		db=conn_info[4]
	)

def get_status_data(conn_info, like_string):
	"""
		Returns a list of the results of the query
		"show status like like_string" run using
		the connection obtained from the info in
		conn_info.
	"""
	rows = []
	conn = connect(conn_info)
	cur = conn.cursor()
	cur.execute("show status like '{}';".format(like_string))

	for row in cur:
		rows.append(row)

	cur.close()
	conn.close()

	return rows

def get_aborted_status_data():
	return get_status_data(db2_info, "%aborted%")

def get_innodb_status_data():
	return get_status_data(db2_info, "%innodb%")

def insert_aborted_status_info():
	data = get_aborted_status_data()
	timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
	query = "INSERT INTO Aborts (accessed_at, aborted_clients, aborted_connects) values ('{}', '{}', '{}');".format(timestamp, data[0][1], data[1][1])
	conn = connect(db1_info)
	cur = conn.cursor()
	cur.execute(query)
	conn.commit()
	cur.close()
	conn.close()
