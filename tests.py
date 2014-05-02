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

	def test_connect(self):
		query = "SELECT 1 + 1;"
		expected = 2

		conn_info = ["127.0.0.1", 3306, "qaAdmin", "qaadminpass123", "qanda"]
		conn = connect(conn_info)
		cur = conn.cursor()
		cur.execute(query)
		res = cur.fetchone()[0]

		cur.close()
		conn.close()

		self.assertEqual(res, expected)

	def test_get_status_data(self):
		conn_info = ["127.0.0.1", 3306, "qaAdmin", "qaadminpass123", "qanda"]
		data = get_status_data(conn_info, "%aborted%")

		self.assertEqual(len(data), 2)
		self.assertTrue(data[0][0] == "Aborted_clients")
		self.assertTrue(data[1][0] == "Aborted_connects")

	def test_get_db2_status(self):
		pass

	def test_get_db1_old_records(self):
		pass

if __name__ == '__main__':
	unittest.main()
