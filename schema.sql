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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-02 12:32:04
