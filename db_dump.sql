-- MySQL dump 10.13  Distrib 5.6.16, for osx10.7 (x86_64)
--
-- Host: localhost    Database: qanda
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Aborts`
--

DROP TABLE IF EXISTS `Aborts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Aborts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessed_at` datetime NOT NULL,
  `aborted_clients` varchar(11) NOT NULL,
  `aborted_connects` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Aborts`
--

LOCK TABLES `Aborts` WRITE;
/*!40000 ALTER TABLE `Aborts` DISABLE KEYS */;
INSERT INTO `Aborts` VALUES (1,'2014-05-02 11:00:33','3','11'),(4,'2014-05-02 11:05:13','3','11'),(5,'2014-05-02 11:05:24','3','11'),(6,'2014-05-02 11:38:59','3','11'),(7,'2014-05-02 11:39:27','3','11'),(8,'2014-05-02 11:39:40','3','11'),(9,'2014-05-02 11:40:20','3','11'),(10,'2014-05-02 12:21:09','3','11'),(11,'2014-05-02 12:49:07','3','11');
/*!40000 ALTER TABLE `Aborts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Answer_Attachments`
--

DROP TABLE IF EXISTS `Answer_Attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answer_Attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment` blob NOT NULL,
  `answerID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answerID` (`answerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answer_Attachments`
--

LOCK TABLES `Answer_Attachments` WRITE;
/*!40000 ALTER TABLE `Answer_Attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answer_Attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Answers`
--

DROP TABLE IF EXISTS `Answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` text NOT NULL,
  `date_submitted` datetime NOT NULL,
  `submitted_by` int(11) NOT NULL,
  `questionID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submitted_by` (`submitted_by`),
  KEY `questionID` (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answers`
--

LOCK TABLES `Answers` WRITE;
/*!40000 ALTER TABLE `Answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InnoDBInfo`
--

DROP TABLE IF EXISTS `InnoDBInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InnoDBInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accessed_at` datetime NOT NULL,
  `buffer_pool_dump_status` varchar(50) NOT NULL,
  `buffer_pool_load_status` varchar(50) NOT NULL,
  `buffer_pool_pages_data` varchar(11) NOT NULL,
  `buffer_pool_bytes_data` varchar(11) NOT NULL,
  `buffer_pool_pages_dirty` varchar(11) NOT NULL,
  `buffer_pool_bytes_dirty` varchar(11) NOT NULL,
  `buffer_pool_pages_flushed` varchar(11) NOT NULL,
  `buffer_pool_pages_free` varchar(11) NOT NULL,
  `buffer_pool_pages_misc` varchar(11) NOT NULL,
  `buffer_pool_pages_total` varchar(11) NOT NULL,
  `buffer_pool_read_ahead_rnd` varchar(11) NOT NULL,
  `buffer_pool_read_ahead` varchar(11) NOT NULL,
  `buffer_pool_read_ahead_evicted` varchar(11) NOT NULL,
  `buffer_pool_read_requests` varchar(11) NOT NULL,
  `buffer_pool_reads` varchar(11) NOT NULL,
  `buffer_pool_wait_free` varchar(11) NOT NULL,
  `buffer_pool_write_requests` varchar(11) NOT NULL,
  `data_fsyncs` varchar(11) NOT NULL,
  `data_pending_fsyncs` varchar(11) NOT NULL,
  `data_pending_reads` varchar(11) NOT NULL,
  `data_pending_writes` varchar(11) NOT NULL,
  `data_read` varchar(11) NOT NULL,
  `data_reads` varchar(11) NOT NULL,
  `data_writes` varchar(11) NOT NULL,
  `data_written` varchar(11) NOT NULL,
  `dblwr_pages_written` varchar(11) NOT NULL,
  `dblwr_writes` varchar(11) NOT NULL,
  `have_atomic_builtins` varchar(10) NOT NULL,
  `log_waits` varchar(11) NOT NULL,
  `log_write_requests` varchar(11) NOT NULL,
  `log_writes` varchar(11) NOT NULL,
  `os_log_fsyncs` varchar(11) NOT NULL,
  `os_log_pending_fsyncs` varchar(11) NOT NULL,
  `os_log_pending_writes` varchar(11) NOT NULL,
  `os_log_written` varchar(11) NOT NULL,
  `page_size` varchar(11) NOT NULL,
  `pages_created` varchar(11) NOT NULL,
  `pages_read` varchar(11) NOT NULL,
  `pages_written` varchar(11) NOT NULL,
  `row_lock_current_waits` varchar(11) NOT NULL,
  `row_lock_time` varchar(11) NOT NULL,
  `row_lock_time_avg` varchar(11) NOT NULL,
  `row_lock_time_max` varchar(11) NOT NULL,
  `row_lock_waits` varchar(11) NOT NULL,
  `rows_deleted` varchar(11) NOT NULL,
  `rows_inserted` varchar(11) NOT NULL,
  `rows_read` varchar(11) NOT NULL,
  `rows_updated` varchar(11) NOT NULL,
  `num_open_files` varchar(11) NOT NULL,
  `truncated_status_writes` varchar(11) NOT NULL,
  `available_undo_logs` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InnoDBInfo`
--

LOCK TABLES `InnoDBInfo` WRITE;
/*!40000 ALTER TABLE `InnoDBInfo` DISABLE KEYS */;
INSERT INTO `InnoDBInfo` VALUES (4,'2014-05-02 11:39:27','not started','not started','387','6340608','17','278528','297','7804','0','8191','0','0','0','7670','321','0','1915','257','0','0','0','7442432','336','304','9916928','297','18','ON','0','249','120','139','0','0','175104','16384','67','320','297','0','0','0','0','0','3','10','13698','0','15','0','128'),(5,'2014-05-02 11:39:40','not started','not started','393','6438912','15','245760','315','7798','0','8191','0','0','0','7792','322','0','1977','269','0','0','0','7458816','337','320','10513920','315','19','ON','0','261','125','145','0','0','181760','16384','72','321','315','0','0','0','0','0','3','12','13716','0','15','0','128'),(6,'2014-05-02 11:40:20','not started','not started','397','6504448','2','32768','341','7794','0','8191','0','0','0','7967','322','0','2047','282','0','0','0','7458816','337','339','11376640','341','20','ON','0','273','131','152','0','0','192000','16384','76','321','341','0','0','0','0','0','3','14','13740','0','15','0','128'),(7,'2014-05-02 12:21:09','not started','not started','399','6537216','15','245760','345','7792','0','8191','0','0','0','8094','322','0','2098','293','0','0','0','7458816','337','350','11514880','345','21','ON','0','280','137','159','0','0','198656','16384','78','321','345','0','0','0','0','0','3','16','13760','0','15','0','128'),(8,'2014-05-02 12:49:07','not started','not started','400','6553600','2','32768','370','7791','0','8191','0','0','0','8223','322','0','2141','306','0','0','0','7458816','337','373','12340736','370','22','ON','0','286','143','166','0','0','204800','16384','79','321','370','0','0','0','0','0','3','18','13784','0','15','0','128');
/*!40000 ALTER TABLE `InnoDBInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question_Attachments`
--

DROP TABLE IF EXISTS `Question_Attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question_Attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attachment` blob NOT NULL,
  `questionID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `questionID` (`questionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question_Attachments`
--

LOCK TABLES `Question_Attachments` WRITE;
/*!40000 ALTER TABLE `Question_Attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question_Attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `date_submitted` datetime NOT NULL,
  `submitted_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `submitted_by` (`submitted_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` char(60) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-02 12:57:01
