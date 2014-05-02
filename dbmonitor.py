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

def insert_innodb_status_info():
	data = get_innodb_status_data()
	timestamp = time.strftime('%Y-%m-%d %H:%M:%S')
	query = """
			INSERT INTO InnoDBInfo (accessed_at,buffer_pool_dump_status,buffer_pool_load_status,buffer_pool_pages_data,buffer_pool_bytes_data,buffer_pool_pages_dirty,buffer_pool_bytes_dirty,buffer_pool_pages_flushed,buffer_pool_pages_free,buffer_pool_pages_misc,buffer_pool_pages_total,buffer_pool_read_ahead_rnd,buffer_pool_read_ahead,buffer_pool_read_ahead_evicted,buffer_pool_read_requests,buffer_pool_reads,buffer_pool_wait_free,buffer_pool_write_requests,data_fsyncs,data_pending_fsyncs,data_pending_reads,data_pending_writes,data_read,data_reads,data_writes,data_written,dblwr_pages_written,dblwr_writes,have_atomic_builtins,log_waits,log_write_requests,log_writes,os_log_fsyncs,os_log_pending_fsyncs,os_log_pending_writes,os_log_written,page_size,pages_created,pages_read,pages_written,row_lock_current_waits,row_lock_time,row_lock_time_avg,row_lock_time_max,row_lock_waits,rows_deleted,rows_inserted,rows_read,rows_updated,num_open_files,truncated_status_writes,available_undo_logs)
			VALUES ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}');
			""".format(timestamp,data[0][1],data[1][1],data[2][1],data[3][1],data[4][1],data[5][1],data[6][1],data[7][1],data[8][1],data[9][1],data[10][1],data[11][1],data[12][1],data[13][1],data[14][1],data[15][1],data[16][1],data[17][1],data[18][1],data[19][1],data[20][1],data[21][1],data[22][1],data[23][1],data[24][1],data[25][1],data[26][1],data[27][1],data[28][1],data[29][1],data[30][1],data[31][1],data[32][1],data[33][1],data[34][1],data[35][1],data[36][1],data[37][1],data[38][1],data[39][1],data[40][1],data[41][1],data[42][1],data[43][1],data[44][1],data[45][1],data[46][1],data[47][1],data[48][1],data[49][1],data[50][1])
	conn = connect(db1_info)
	cur = conn.cursor()
	cur.execute(query)
	conn.commit()
	cur.close()
	conn.close()
