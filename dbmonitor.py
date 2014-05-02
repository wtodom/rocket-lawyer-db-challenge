"""
Dependencies:
	bcrypt - https://pypi.python.org/pypi/bcrypt/1.0.2
		Usage:
			>>> import bcrypt
			>>> password = b"super secret password"
			>>> # Hash a password for the first time, with a randomly-generated salt
			>>> hashed = bcrypt.hashpw(password, bcrypt.gensalt())
			>>> # Check that a unhashed password matches one that has previously been
			>>> #   hashed
			>>> if bcrypt.hashpw(password, hashed) == hashed:
			...     print("It Matches!")
			... else:
			...     print("It Does not Match :(")

"""

import bcrypt
import pymysql


def get_db1_info():
	with open("DBINFO.ini", "r") as f:
		conn_info = [line.rstrip().split("=")[1] for line in f.readlines()]
		conn_info[1] = int(conn_info[1])
	return conn_info

