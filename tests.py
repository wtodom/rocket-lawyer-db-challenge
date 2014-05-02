from dbmonitor import *

import unittest


class TestDBMonitor(unittest.TestCase):

	def test_get_db1_info(self):
		host_ip="127.0.01"
		port=3306
		user="qaAdmin"
		passwd="qaadminpass123"
		db="qanda"

		conn_info = get_db1_info()

		self.assertEqual(conn_info[0], host_ip)
		self.assertEqual(conn_info[1], port)
		self.assertEqual(conn_info[2], user)
		self.assertEqual(conn_info[3], passwd)
		self.assertEqual(conn_info[4], db)

	def test_get_db2_status(self):
		pass

	def test_get_db1_old_records(self):
		pass

if __name__ == '__main__':
	unittest.main()
