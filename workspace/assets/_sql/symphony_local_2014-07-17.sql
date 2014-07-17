-- MySQL dump 10.13  Distrib 5.6.17, for osx10.9 (x86_64)
--
-- Host: localhost    Database: symphony
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `sym_authors`
--

DROP TABLE IF EXISTS `sym_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','manager','developer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token_active` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `language` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_authors`
--

LOCK TABLES `sym_authors` WRITE;
/*!40000 ALTER TABLE `sym_authors` DISABLE KEYS */;
INSERT INTO `sym_authors` VALUES (1,'admin','PBKDF2v1|10000|053ffd1bffbdb2bb2faf|ANYXjyf8YLIxu0ZdcH5Jwwi4gAcvm4gISaylWfB71L9zWI9SA4kS1w==','Jonathan','Simcoe','jdsimcoe@gmail.com','2014-07-17 09:54:59','developer','yes',NULL,'no',NULL);
/*!40000 ALTER TABLE `sym_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_cache`
--

DROP TABLE IF EXISTS `sym_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expiry` (`expiry`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_cache`
--

LOCK TABLES `sym_cache` WRITE;
/*!40000 ALTER TABLE `sym_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_cachelite_references`
--

DROP TABLE IF EXISTS `sym_cachelite_references`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_cachelite_references` (
  `page` varchar(255) NOT NULL DEFAULT '',
  `sections` varchar(255) DEFAULT NULL,
  `entries` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`page`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_cachelite_references`
--

LOCK TABLES `sym_cachelite_references` WRITE;
/*!40000 ALTER TABLE `sym_cachelite_references` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_cachelite_references` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_elasticsearch_logs`
--

DROP TABLE IF EXISTS `sym_elasticsearch_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_elasticsearch_logs` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `keywords_raw` varchar(255) DEFAULT NULL,
  `sections` varchar(255) DEFAULT NULL,
  `page` int(11) NOT NULL,
  `results` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `keywords` (`keywords`),
  KEY `date` (`date`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_elasticsearch_logs`
--

LOCK TABLES `sym_elasticsearch_logs` WRITE;
/*!40000 ALTER TABLE `sym_elasticsearch_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_elasticsearch_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries`
--

DROP TABLE IF EXISTS `sym_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `modification_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`),
  KEY `modification_date` (`modification_date`),
  KEY `modification_date_gmt` (`modification_date_gmt`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries`
--

LOCK TABLES `sym_entries` WRITE;
/*!40000 ALTER TABLE `sym_entries` DISABLE KEYS */;
INSERT INTO `sym_entries` VALUES (1,1,1,'2014-07-16 09:36:46','2014-07-16 16:36:46','2014-07-16 09:36:46','2014-07-16 16:36:46'),(2,2,1,'2014-07-16 10:37:12','2014-07-16 17:37:12','2014-07-16 11:38:57','2014-07-16 18:38:57'),(3,3,1,'2014-07-16 10:57:30','2014-07-16 17:57:30','2014-07-16 10:57:30','2014-07-16 17:57:30'),(4,3,1,'2014-07-16 10:57:42','2014-07-16 17:57:42','2014-07-16 10:57:52','2014-07-16 17:57:52'),(5,2,1,'2014-07-16 11:42:29','2014-07-16 18:42:29','2014-07-16 11:42:29','2014-07-16 18:42:29'),(6,2,1,'2014-07-16 11:43:13','2014-07-16 18:43:13','2014-07-16 11:43:13','2014-07-16 18:43:13');
/*!40000 ALTER TABLE `sym_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_1`
--

DROP TABLE IF EXISTS `sym_entries_data_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_1`
--

LOCK TABLES `sym_entries_data_1` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_1` DISABLE KEYS */;
INSERT INTO `sym_entries_data_1` VALUES (1,1,'a-blueprint-for-your-life','A blueprint for your life');
/*!40000 ALTER TABLE `sym_entries_data_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_10`
--

DROP TABLE IF EXISTS `sym_entries_data_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_10`
--

LOCK TABLES `sym_entries_data_10` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_10` DISABLE KEYS */;
INSERT INTO `sym_entries_data_10` VALUES (4,2,'yes'),(5,5,'yes'),(6,6,'yes');
/*!40000 ALTER TABLE `sym_entries_data_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_11`
--

DROP TABLE IF EXISTS `sym_entries_data_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_11`
--

LOCK TABLES `sym_entries_data_11` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_11` DISABLE KEYS */;
INSERT INTO `sym_entries_data_11` VALUES (4,2,'no'),(5,5,'no'),(6,6,'no');
/*!40000 ALTER TABLE `sym_entries_data_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_12`
--

DROP TABLE IF EXISTS `sym_entries_data_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_12`
--

LOCK TABLES `sym_entries_data_12` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_12` DISABLE KEYS */;
INSERT INTO `sym_entries_data_12` VALUES (1,3,'typography','Typography'),(3,4,'analytics','Analytics');
/*!40000 ALTER TABLE `sym_entries_data_12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_13`
--

DROP TABLE IF EXISTS `sym_entries_data_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_13`
--

LOCK TABLES `sym_entries_data_13` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_13` DISABLE KEYS */;
INSERT INTO `sym_entries_data_13` VALUES (1,3,NULL,'\n'),(3,4,NULL,'\n');
/*!40000 ALTER TABLE `sym_entries_data_13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_2`
--

DROP TABLE IF EXISTS `sym_entries_data_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_2`
--

LOCK TABLES `sym_entries_data_2` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_2` DISABLE KEYS */;
INSERT INTO `sym_entries_data_2` VALUES (1,1,'5','5');
/*!40000 ALTER TABLE `sym_entries_data_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_3`
--

DROP TABLE IF EXISTS `sym_entries_data_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_3`
--

LOCK TABLES `sym_entries_data_3` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_3` DISABLE KEYS */;
INSERT INTO `sym_entries_data_3` VALUES (1,1,'blueprintneuelegacy_wide.png',585748,'image/png','a:3:{s:8:\"creation\";s:25:\"2014-07-16T09:36:46-07:00\";s:5:\"width\";i:2560;s:6:\"height\";i:1440;}');
/*!40000 ALTER TABLE `sym_entries_data_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_4`
--

DROP TABLE IF EXISTS `sym_entries_data_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`),
  FULLTEXT KEY `value_formatted` (`value_formatted`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_4`
--

LOCK TABLES `sym_entries_data_4` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_4` DISABLE KEYS */;
INSERT INTO `sym_entries_data_4` VALUES (4,2,'home','/home','/home'),(5,5,'about','/about','/about'),(6,6,'about-our-history','/about/our-history','/about/our-history');
/*!40000 ALTER TABLE `sym_entries_data_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_5`
--

DROP TABLE IF EXISTS `sym_entries_data_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_5`
--

LOCK TABLES `sym_entries_data_5` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_5` DISABLE KEYS */;
INSERT INTO `sym_entries_data_5` VALUES (4,2,'home','Home'),(5,5,'about','About'),(6,6,'our-history','Our History');
/*!40000 ALTER TABLE `sym_entries_data_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_6`
--

DROP TABLE IF EXISTS `sym_entries_data_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_6`
--

LOCK TABLES `sym_entries_data_6` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_6` DISABLE KEYS */;
INSERT INTO `sym_entries_data_6` VALUES (4,2,'home','home'),(5,5,'about','about'),(6,6,'our-history','our-history');
/*!40000 ALTER TABLE `sym_entries_data_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_7`
--

DROP TABLE IF EXISTS `sym_entries_data_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_7`
--

LOCK TABLES `sym_entries_data_7` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_7` DISABLE KEYS */;
INSERT INTO `sym_entries_data_7` VALUES (2,6,5);
/*!40000 ALTER TABLE `sym_entries_data_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_8`
--

DROP TABLE IF EXISTS `sym_entries_data_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_8`
--

LOCK TABLES `sym_entries_data_8` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_8` DISABLE KEYS */;
INSERT INTO `sym_entries_data_8` VALUES (4,2,1);
/*!40000 ALTER TABLE `sym_entries_data_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_9`
--

DROP TABLE IF EXISTS `sym_entries_data_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_9`
--

LOCK TABLES `sym_entries_data_9` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_9` DISABLE KEYS */;
INSERT INTO `sym_entries_data_9` VALUES (4,2,1),(5,5,2),(6,6,3);
/*!40000 ALTER TABLE `sym_entries_data_9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_extensions`
--

DROP TABLE IF EXISTS `sym_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_extensions`
--

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;
INSERT INTO `sym_extensions` VALUES (1,'association_output','enabled','1.0.0beta'),(2,'association_reference_field','enabled','0.1.0'),(3,'association_ui_editor','enabled','0.2.0'),(4,'association_ui_selector','enabled','1.0.0beta'),(5,'debugdevkit','enabled','1.3'),(6,'editor_for_symphony','enabled','0.3.1'),(7,'export_ensemble','enabled','2.0.3'),(8,'jit_image_manipulation','enabled','1.21'),(9,'maintenance_mode','enabled','1.7'),(10,'markdown','enabled','1.19'),(11,'profiledevkit','enabled','1.4'),(12,'selectbox_link_field','enabled','1.30'),(17,'block_user_agent','enabled','1.3'),(16,'association_field','enabled','0.5.3'),(18,'cacheabledatasource','enabled','2.1.0'),(19,'cachelite','enabled','1.2'),(20,'canofspam','enabled','2.0'),(22,'content_type_mappings','enabled','1.6.1'),(23,'datetime','enabled','3.3.1'),(24,'entry_url_field','enabled','1.3.0'),(25,'color_chooser_field','enabled','1.4'),(26,'image_upload','enabled','1.5'),(27,'globalparamloader','enabled','1.5'),(28,'globalresourceloader','enabled','1.1'),(29,'image_index_preview','enabled','1.4'),(30,'logsdevkit','enabled','1.1'),(31,'markdown_typography','enabled','2.2.0'),(32,'order_entries','enabled','2.1.3'),(33,'pagesfield','enabled','1.6.1'),(34,'reflectionfield','enabled','1.4.0'),(35,'remote_datasource','enabled','2.1.0'),(36,'repeating_date_field','enabled','1.2'),(37,'resave_entries','enabled','0.2'),(38,'save_and_return','enabled','1.8'),(39,'sitemap_xml','enabled','2.3'),(40,'tracker','enabled','1.2.1'),(41,'xmlfield','enabled','1.2.2'),(42,'xmlimporter','enabled','2.1.2');
/*!40000 ALTER TABLE `sym_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_extensions_delegates`
--

DROP TABLE IF EXISTS `sym_extensions_delegates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_extensions_delegates`
--

LOCK TABLES `sym_extensions_delegates` WRITE;
/*!40000 ALTER TABLE `sym_extensions_delegates` DISABLE KEYS */;
INSERT INTO `sym_extensions_delegates` VALUES (1,1,'/frontend/','DataSourcePreExecute','setOutputParameters'),(2,1,'/frontend/','DataSourcePostExecute','appendAssociatedEntries'),(3,1,'/backend/','AdminPagePreGenerate','buildEditor'),(4,1,'/blueprints/datasources/','DatasourcePreCreate','saveDataSource'),(5,1,'/blueprints/datasources/','DatasourcePreEdit','saveDataSource'),(6,3,'/backend/','InitaliseAdminPageHead','appendAssets'),(7,4,'/backend/','InitaliseAdminPageHead','appendAssets'),(8,5,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),(9,5,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),(77,6,'/backend/','InitaliseAdminPageHead','initaliseAdminPageHead'),(11,7,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(12,8,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(13,8,'/system/preferences/','Save','__SavePreferences'),(14,9,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(15,9,'/system/preferences/','Save','__SavePreferences'),(16,9,'/system/preferences/','CustomActions','__toggleMaintenanceMode'),(17,9,'/backend/','AppendPageAlert','__appendAlert'),(18,9,'/blueprints/pages/','AppendPageContent','__appendType'),(19,9,'/frontend/','FrontendPrePageResolve','__checkForMaintenanceMode'),(20,9,'/frontend/','FrontendParamsResolve','__addParam'),(21,11,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),(22,11,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),(35,17,'/frontend/','FrontendParamsPostResolve','frontendParamsPostResolve'),(36,17,'/system/preferences/','AddCustomPreferenceFieldsets','addCustomPreferenceFieldsets'),(37,17,'/system/preferences/','Save','save'),(38,18,'/frontend/','DataSourcePreExecute','dataSourcePreExecute'),(39,18,'/blueprints/datasources/','DatasourcePreCreate','dataSourceSave'),(40,18,'/blueprints/datasources/','DatasourcePreEdit','dataSourceSave'),(41,18,'/backend/','InitaliseAdminPageHead','initaliseAdminPageHead'),(42,18,'/publish/new/','EntryPostCreate','flushCache'),(43,18,'/publish/edit/','EntryPostEdit','flushCache'),(44,18,'/publish/','EntryPreDelete','flushCache'),(45,18,'/publish/','EntriesPostOrder','flushCache'),(46,18,'/frontend/','EventFinalSaveFilter','eventFinalSaveFilter'),(47,18,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),(48,18,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),(49,19,'/frontend/','FrontendPageResolved','intercept_page'),(50,19,'/frontend/','FrontendOutputPreGenerate','parse_page_data'),(51,19,'/frontend/','FrontendOutputPostGenerate','write_page_cache'),(52,19,'/system/preferences/','AddCustomPreferenceFieldsets','append_preferences'),(53,19,'/system/preferences/','Save','save_preferences'),(54,19,'/publish/new/','EntryPostCreate','entry_create'),(55,19,'/publish/edit/','EntryPreEdit','entry_edit'),(56,19,'/publish/','EntryPreDelete','entry_delete'),(57,19,'/blueprints/events/new/','AppendEventFilter','addFilterToEventEditor'),(58,19,'/blueprints/events/edit/','AppendEventFilter','addFilterToEventEditor'),(59,19,'/blueprints/events/new/','AppendEventFilterDocumentation','add_filter_documentation_to_event'),(60,19,'/blueprints/events/edit/','AppendEventFilterDocumentation','add_filter_documentation_to_event'),(61,19,'/frontend/','EventPreSaveFilter','processEventData'),(62,19,'/frontend/','EventPostSaveFilter','processPostSaveData'),(63,20,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),(64,20,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),(65,20,'/blueprints/events/new/','AppendEventFilterDocumentation','appendEventFilterDocumentation'),(66,20,'/blueprints/events/edit/','AppendEventFilterDocumentation','appendEventFilterDocumentation'),(67,20,'/frontend/','EventPreSaveFilter','eventPreSaveFilter'),(68,20,'/frontend/','EventPostSaveFilter','eventPostSaveFilter'),(71,22,'/frontend/','FrontendPreRenderHeaders','setContentType'),(72,22,'/system/preferences/','AddCustomPreferenceFieldsets','addCustomPreferenceFieldsets'),(73,22,'/system/preferences/','Save','save'),(74,22,'/backend/','AdminPagePreGenerate','__appendAssets'),(75,23,'/system/preferences/','AddCustomPreferenceFieldsets','__addPreferences'),(76,23,'/system/preferences/','Save','__savePreferences'),(78,24,'/publish/new/','EntryPostCreate','compileBackendFields'),(79,24,'/publish/edit/','EntryPostEdit','compileBackendFields'),(80,24,'/frontend/','EventPostSaveFilter','compileFrontendFields'),(81,27,'/frontend/','FrontendParamsResolve','addParam'),(82,27,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(83,28,'/frontend/','FrontendPageResolved','manipulatePageData'),(84,28,'/system/preferences/','AddCustomPreferenceFieldsets','preferences'),(85,29,'/backend/','InitaliseAdminPageHead','InitaliseAdminPageHead'),(86,30,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),(87,30,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),(88,32,'/backend/','InitaliseAdminPageHead','prepareIndex'),(89,32,'/backend/','AdminPagePreGenerate','adjustTable'),(90,32,'/backend/','AdminPagePostGenerate','resetPagination'),(91,33,'/blueprints/pages/','AppendPageContent','appendAssociationsDrawer'),(92,34,'/publish/new/','EntryPostCreate','compileBackendFields'),(93,34,'/publish/edit/','EntryPostEdit','compileBackendFields'),(94,34,'/frontend/','EventPostSaveFilter','compileFrontendFields'),(95,35,'/system/preferences/','AddCachingOpportunity','addCachingOpportunity'),(99,37,'/backend/','InitaliseAdminPageHead','InitaliseAdminPageHead'),(98,37,'/system/preferences/','AddCustomPreferenceFieldsets','AddCustomPreferenceFieldsets'),(106,38,'/publish/edit/','EntryPostEdit','entryPostEdit'),(105,38,'/backend/','AdminPagePreGenerate','appendElement'),(104,38,'/backend/','InitaliseAdminPageHead','appendJS'),(107,38,'/publish/new/','EntryPostCreate','entryPostEdit'),(108,39,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(109,39,'/backend/','InitaliseAdminPageHead','appendPageHead'),(110,40,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(111,40,'/system/preferences/','CustomActions','savePreferences'),(112,40,'/publish/new/','EntryPostCreate','parseEntryAction'),(113,40,'/publish/edit/','EntryPostEdit','parseEntryAction'),(114,40,'/publish/','EntryPostDelete','parseEntryAction'),(115,40,'/frontend/','EventPostSaveFilter','parseEventSave'),(116,40,'/blueprints/pages/','PagePostCreate','parsePageAction'),(117,40,'/blueprints/pages/','PagePostEdit','parsePageAction'),(118,40,'/blueprints/pages/','PagePreDelete','parsePageAction'),(119,40,'/blueprints/events/','EventPostCreate','parseEventAction'),(120,40,'/blueprints/events/','EventPostEdit','parseEventAction'),(121,40,'/blueprints/events/','EventPreDelete','parseEventAction'),(122,40,'/blueprints/datasources/','DatasourcePostCreate','parseDatasourceAction'),(123,40,'/blueprints/datasources/','DatasourcePostEdit','parseDatasourceAction'),(124,40,'/blueprints/datasources/','DatasourcePreDelete','parseDatasourceAction'),(125,40,'/blueprints/utilities/','UtilityPostCreate','parseUtilityAction'),(126,40,'/blueprints/utilities/','UtilityPostEdit','parseUtilityAction'),(127,40,'/blueprints/utilities/','UtilityPreDelete','parseUtilityAction'),(128,40,'/blueprints/sections/','SectionPostCreate','parseSectionAction'),(129,40,'/blueprints/sections/','SectionPostEdit','parseSectionAction'),(130,40,'/blueprints/sections/','SectionPreDelete','parseSectionAction'),(131,40,'/system/authors/','AuthorPostCreate','parseAuthorAction'),(132,40,'/system/authors/','AuthorPostEdit','parseAuthorAction'),(133,40,'/system/authors/','AuthorPreDelete','parseAuthorAction'),(134,40,'/system/extensions/','ExtensionPreEnable','parseExtensionAction'),(135,40,'/system/extensions/','ExtensionPreDisable','parseExtensionAction'),(136,40,'/system/extensions/','ExtensionPreUninstall','parseExtensionAction'),(137,40,'/system/preferences/','Save','parsePreferencesSave'),(138,40,'/login/','AuthorLoginFailure','parseLogin'),(139,40,'/login/','AuthorLoginSuccess','parseLogin'),(140,40,'/login/','AuthorPostPasswordResetSuccess','parsePasswordAction'),(141,40,'/login/','AuthorPostPasswordResetFailure','parsePasswordAction'),(142,40,'/login/','AuthorPostPasswordChange','parsePasswordAction'),(143,40,'/login/','AuthorPostPasswordResetRequest','parsePasswordAction'),(144,40,'/backend/','DashboardPanelRender','renderPanel'),(145,40,'/backend/','DashboardPanelOptions','dashboardPanelOptions'),(146,40,'/backend/','DashboardPanelTypes','dashboardPanelTypes'),(147,41,'/backend/','InitaliseAdminPageHead','initaliseAdminPageHead');
/*!40000 ALTER TABLE `sym_extensions_delegates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields`
--

DROP TABLE IF EXISTS `sym_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields`
--

LOCK TABLES `sym_fields` WRITE;
/*!40000 ALTER TABLE `sym_fields` DISABLE KEYS */;
INSERT INTO `sym_fields` VALUES (1,'Caption','caption','input',1,'yes',0,'main','yes'),(2,'Position','position','select',1,'no',1,'sidebar','yes'),(3,'Image','image','upload',1,'yes',2,'sidebar','yes'),(4,'Path','path','reflection',2,'no',0,'sidebar','yes'),(5,'Title','title','input',2,'no',1,'main','yes'),(6,'Slug','slug','input',2,'no',2,'main','yes'),(7,'Parent','parent','association',2,'no',3,'sidebar','yes'),(8,'Banner','banner','association',2,'no',4,'sidebar','yes'),(9,'Order','order','order_entries',2,'no',5,'sidebar','no'),(10,'Publish','publish','checkbox',2,'no',6,'sidebar','yes'),(11,'Hide from Navigation?','hide-nav','checkbox',2,'no',7,'sidebar','yes'),(12,'Title','title','input',3,'yes',0,'main','yes'),(13,'Content','content','textarea',3,'no',1,'main','yes');
/*!40000 ALTER TABLE `sym_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_association`
--

DROP TABLE IF EXISTS `sym_fields_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_association`
--

LOCK TABLES `sym_fields_association` WRITE;
/*!40000 ALTER TABLE `sym_fields_association` DISABLE KEYS */;
INSERT INTO `sym_fields_association` VALUES (4,7,'no','yes','no','4',9999),(5,8,'no','yes','no','3',9999);
/*!40000 ALTER TABLE `sym_fields_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_author`
--

DROP TABLE IF EXISTS `sym_fields_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_author`
--

LOCK TABLES `sym_fields_author` WRITE;
/*!40000 ALTER TABLE `sym_fields_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_checkbox`
--

DROP TABLE IF EXISTS `sym_fields_checkbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_checkbox`
--

LOCK TABLES `sym_fields_checkbox` WRITE;
/*!40000 ALTER TABLE `sym_fields_checkbox` DISABLE KEYS */;
INSERT INTO `sym_fields_checkbox` VALUES (3,10,'off',NULL),(4,11,'off',NULL);
/*!40000 ALTER TABLE `sym_fields_checkbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_colorchooser`
--

DROP TABLE IF EXISTS `sym_fields_colorchooser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_colorchooser` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_colorchooser`
--

LOCK TABLES `sym_fields_colorchooser` WRITE;
/*!40000 ALTER TABLE `sym_fields_colorchooser` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_colorchooser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_date`
--

DROP TABLE IF EXISTS `sym_fields_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_date`
--

LOCK TABLES `sym_fields_date` WRITE;
/*!40000 ALTER TABLE `sym_fields_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_datetime`
--

DROP TABLE IF EXISTS `sym_fields_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_datetime` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `prepopulate` tinyint(1) DEFAULT '1',
  `time` tinyint(1) DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '1',
  `range` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_datetime`
--

LOCK TABLES `sym_fields_datetime` WRITE;
/*!40000 ALTER TABLE `sym_fields_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_entry_url`
--

DROP TABLE IF EXISTS `sym_fields_entry_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_entry_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `anchor_label` varchar(255) DEFAULT NULL,
  `expression` varchar(255) DEFAULT NULL,
  `new_window` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_entry_url`
--

LOCK TABLES `sym_fields_entry_url` WRITE;
/*!40000 ALTER TABLE `sym_fields_entry_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_entry_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_image_upload`
--

DROP TABLE IF EXISTS `sym_fields_image_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_image_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unique` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `min_width` int(11) unsigned DEFAULT NULL,
  `min_height` int(11) unsigned DEFAULT NULL,
  `max_width` int(11) unsigned DEFAULT NULL,
  `max_height` int(11) unsigned DEFAULT NULL,
  `resize` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_image_upload`
--

LOCK TABLES `sym_fields_image_upload` WRITE;
/*!40000 ALTER TABLE `sym_fields_image_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_image_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_input`
--

DROP TABLE IF EXISTS `sym_fields_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_input`
--

LOCK TABLES `sym_fields_input` WRITE;
/*!40000 ALTER TABLE `sym_fields_input` DISABLE KEYS */;
INSERT INTO `sym_fields_input` VALUES (3,1,NULL),(10,5,NULL),(11,6,NULL),(14,12,NULL);
/*!40000 ALTER TABLE `sym_fields_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_order_entries`
--

DROP TABLE IF EXISTS `sym_fields_order_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') DEFAULT 'no',
  `hide` enum('yes','no') DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_order_entries`
--

LOCK TABLES `sym_fields_order_entries` WRITE;
/*!40000 ALTER TABLE `sym_fields_order_entries` DISABLE KEYS */;
INSERT INTO `sym_fields_order_entries` VALUES (2,9,'yes','yes');
/*!40000 ALTER TABLE `sym_fields_order_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_pages`
--

DROP TABLE IF EXISTS `sym_fields_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `page_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_pages`
--

LOCK TABLES `sym_fields_pages` WRITE;
/*!40000 ALTER TABLE `sym_fields_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_reflection`
--

DROP TABLE IF EXISTS `sym_fields_reflection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_reflection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `xsltfile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expression` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formatter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `override` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `hide` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `fetch_associated_counts` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_reflection`
--

LOCK TABLES `sym_fields_reflection` WRITE;
/*!40000 ALTER TABLE `sym_fields_reflection` DISABLE KEYS */;
INSERT INTO `sym_fields_reflection` VALUES (4,4,'_reflection-page-path.xsl','{path-display/text()}','none',NULL,'no','no');
/*!40000 ALTER TABLE `sym_fields_reflection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_repeating_date`
--

DROP TABLE IF EXISTS `sym_fields_repeating_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_repeating_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_repeating_date`
--

LOCK TABLES `sym_fields_repeating_date` WRITE;
/*!40000 ALTER TABLE `sym_fields_repeating_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_repeating_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_search_index`
--

DROP TABLE IF EXISTS `sym_fields_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_search_index` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_search_index`
--

LOCK TABLES `sym_fields_search_index` WRITE;
/*!40000 ALTER TABLE `sym_fields_search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_select`
--

DROP TABLE IF EXISTS `sym_fields_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_select`
--

LOCK TABLES `sym_fields_select` WRITE;
/*!40000 ALTER TABLE `sym_fields_select` DISABLE KEYS */;
INSERT INTO `sym_fields_select` VALUES (3,2,'no','no','1,2,3,4,5,6,7,8,9',NULL);
/*!40000 ALTER TABLE `sym_fields_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_selectbox_link`
--

DROP TABLE IF EXISTS `sym_fields_selectbox_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_selectbox_link`
--

LOCK TABLES `sym_fields_selectbox_link` WRITE;
/*!40000 ALTER TABLE `sym_fields_selectbox_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_selectbox_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_taglist`
--

DROP TABLE IF EXISTS `sym_fields_taglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_taglist`
--

LOCK TABLES `sym_fields_taglist` WRITE;
/*!40000 ALTER TABLE `sym_fields_taglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_taglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_textarea`
--

DROP TABLE IF EXISTS `sym_fields_textarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_textarea`
--

LOCK TABLES `sym_fields_textarea` WRITE;
/*!40000 ALTER TABLE `sym_fields_textarea` DISABLE KEYS */;
INSERT INTO `sym_fields_textarea` VALUES (3,13,'markdown_with_purifier',15);
/*!40000 ALTER TABLE `sym_fields_textarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_upload`
--

DROP TABLE IF EXISTS `sym_fields_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_upload`
--

LOCK TABLES `sym_fields_upload` WRITE;
/*!40000 ALTER TABLE `sym_fields_upload` DISABLE KEYS */;
INSERT INTO `sym_fields_upload` VALUES (2,3,'/workspace/uploads/images','/\\.(?:bmp|gif|jpe?g|png|svg)$/i');
/*!40000 ALTER TABLE `sym_fields_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_xml`
--

DROP TABLE IF EXISTS `sym_fields_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_xml` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_xml`
--

LOCK TABLES `sym_fields_xml` WRITE;
/*!40000 ALTER TABLE `sym_fields_xml` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_xml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_forgotpass`
--

DROP TABLE IF EXISTS `sym_forgotpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_forgotpass`
--

LOCK TABLES `sym_forgotpass` WRITE;
/*!40000 ALTER TABLE `sym_forgotpass` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_forgotpass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_gpl_params`
--

DROP TABLE IF EXISTS `sym_gpl_params`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_gpl_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `set_id` int(11) NOT NULL,
  `param` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `sortorder` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `param` (`param`),
  KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_gpl_params`
--

LOCK TABLES `sym_gpl_params` WRITE;
/*!40000 ALTER TABLE `sym_gpl_params` DISABLE KEYS */;
INSERT INTO `sym_gpl_params` VALUES (1,1,'meta-author','Jonathan Simcoe','definition',0),(2,1,'meta-description','A wonderful website coded by Jonathan Simcoe','definition',1),(3,1,'meta-description','A wonderful website coded by Jonathan Simcoe','definition',1),(4,2,'website-title','A boilerplate for Jonathan Simcoe','definition',0);
/*!40000 ALTER TABLE `sym_gpl_params` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_gpl_sets`
--

DROP TABLE IF EXISTS `sym_gpl_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_gpl_sets` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `params` int(11) unsigned DEFAULT NULL,
  `exclude_page` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_gpl_sets`
--

LOCK TABLES `sym_gpl_sets` WRITE;
/*!40000 ALTER TABLE `sym_gpl_sets` DISABLE KEYS */;
INSERT INTO `sym_gpl_sets` VALUES (1,'Meta',3,NULL),(2,'Website',1,NULL);
/*!40000 ALTER TABLE `sym_gpl_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_pages`
--

DROP TABLE IF EXISTS `sym_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_pages`
--

LOCK TABLES `sym_pages` WRITE;
/*!40000 ALTER TABLE `sym_pages` DISABLE KEYS */;
INSERT INTO `sym_pages` VALUES (3,NULL,'Home','home',NULL,'pt1/pt2/pt3/pt4/pt5/pt6/pt7/pt8/pt9/pt10','structure_all,structure_navigation,structure_url','canofspam',1);
/*!40000 ALTER TABLE `sym_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_pages_types`
--

DROP TABLE IF EXISTS `sym_pages_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_pages_types`
--

LOCK TABLES `sym_pages_types` WRITE;
/*!40000 ALTER TABLE `sym_pages_types` DISABLE KEYS */;
INSERT INTO `sym_pages_types` VALUES (7,3,'index');
/*!40000 ALTER TABLE `sym_pages_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_search_index`
--

DROP TABLE IF EXISTS `sym_search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_search_index` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_search_index`
--

LOCK TABLES `sym_search_index` WRITE;
/*!40000 ALTER TABLE `sym_search_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_search_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_search_index_entry_keywords`
--

DROP TABLE IF EXISTS `sym_search_index_entry_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_search_index_entry_keywords` (
  `entry_id` int(11) DEFAULT NULL,
  `keyword_id` int(11) DEFAULT NULL,
  `frequency` int(11) DEFAULT NULL,
  KEY `entry_id` (`entry_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_search_index_entry_keywords`
--

LOCK TABLES `sym_search_index_entry_keywords` WRITE;
/*!40000 ALTER TABLE `sym_search_index_entry_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_search_index_entry_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_search_index_keywords`
--

DROP TABLE IF EXISTS `sym_search_index_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_search_index_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_search_index_keywords`
--

LOCK TABLES `sym_search_index_keywords` WRITE;
/*!40000 ALTER TABLE `sym_search_index_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_search_index_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_search_index_logs`
--

DROP TABLE IF EXISTS `sym_search_index_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_search_index_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `keywords_manipulated` varchar(255) DEFAULT NULL,
  `sections` varchar(255) DEFAULT NULL,
  `page` int(11) NOT NULL,
  `results` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_search_index_logs`
--

LOCK TABLES `sym_search_index_logs` WRITE;
/*!40000 ALTER TABLE `sym_search_index_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_search_index_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sections`
--

DROP TABLE IF EXISTS `sym_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `filter` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sections`
--

LOCK TABLES `sym_sections` WRITE;
/*!40000 ALTER TABLE `sym_sections` DISABLE KEYS */;
INSERT INTO `sym_sections` VALUES (1,'Images','images',1,'no','yes','Content'),(2,'Structure','structure',2,'no','yes','Content'),(3,'Globals','globals',3,'no','yes','Admin');
/*!40000 ALTER TABLE `sym_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sections_association`
--

DROP TABLE IF EXISTS `sym_sections_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `interface` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sections_association`
--

LOCK TABLES `sym_sections_association` WRITE;
/*!40000 ALTER TABLE `sym_sections_association` DISABLE KEYS */;
INSERT INTO `sym_sections_association` VALUES (6,2,4,2,7,'no','aui-selector-sortable','aui-editor'),(7,1,3,2,8,'no','aui-selector-sortable','aui-editor');
/*!40000 ALTER TABLE `sym_sections_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sessions`
--

DROP TABLE IF EXISTS `sym_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sessions` (
  `session` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sessions`
--

LOCK TABLES `sym_sessions` WRITE;
/*!40000 ALTER TABLE `sym_sessions` DISABLE KEYS */;
INSERT INTO `sym_sessions` VALUES ('jlsv4smdc4im5b6l34lp4fm276',1405616099,'sym-|a:3:{s:10:\"xsrf-token\";a:1:{s:27:\"Y+pui3OLFlebW/HPbLONl+Ecr7Q\";i:1405549361;}s:8:\"username\";s:5:\"admin\";s:4:\"pass\";s:92:\"PBKDF2v1|10000|053ffd1bffbdb2bb2faf|ANYXjyf8YLIxu0ZdcH5Jwwi4gAcvm4gISaylWfB71L9zWI9SA4kS1w==\";}canofspam|s:40:\"6bb4117fc72aec26859ba0f406b12833e789d283\";');
/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sitemap_xml`
--

DROP TABLE IF EXISTS `sym_sitemap_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sitemap_xml` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(4) unsigned DEFAULT NULL,
  `datasource_handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `relative_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datasource_handle_page_id_relative_url` (`datasource_handle`(75),`page_id`,`relative_url`(75))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sitemap_xml`
--

LOCK TABLES `sym_sitemap_xml` WRITE;
/*!40000 ALTER TABLE `sym_sitemap_xml` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_sitemap_xml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_tracker_activity`
--

DROP TABLE IF EXISTS `sym_tracker_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_tracker_activity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_id` varchar(75) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fallback_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fallback_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_tracker_activity`
--

LOCK TABLES `sym_tracker_activity` WRITE;
/*!40000 ALTER TABLE `sym_tracker_activity` DISABLE KEYS */;
INSERT INTO `sym_tracker_activity` VALUES (1,'extensions','anti_brute_force','disabled',1,'2014-07-16 23:27:52','Jonathan Simcoe','the Anti Brute Force extension'),(2,'extensions','anti_brute_force','uninstalled',1,'2014-07-16 23:27:58','Jonathan Simcoe','the Anti Brute Force extension'),(3,'sections','1','created',1,'2014-07-16 23:32:56','Jonathan Simcoe',' the Images section'),(4,'sections','1','updated',1,'2014-07-16 23:35:57','Jonathan Simcoe',' the Images section'),(5,'sections','1','updated',1,'2014-07-16 23:36:09','Jonathan Simcoe',' the Images section'),(6,'1','1','created',1,'2014-07-16 23:36:46','Jonathan Simcoe','A blueprint for your life:::Images'),(7,'sections','2','created',1,'2014-07-16 23:57:29','Jonathan Simcoe',' the Structure section'),(8,'sections','2','updated',1,'2014-07-16 23:58:32','Jonathan Simcoe',' the Structure section'),(9,'extensions','xssfilter','disabled',1,'2014-07-17 00:30:54','Jonathan Simcoe','the Cross-Site Scripting (XSS) Filter extension'),(10,'extensions','xssfilter','uninstalled',1,'2014-07-17 00:31:01','Jonathan Simcoe','the Cross-Site Scripting (XSS) Filter extension'),(11,'sections','2','updated',1,'2014-07-17 00:33:44','Jonathan Simcoe',' the Structure section'),(12,'pages','1','deleted',1,'2014-07-17 00:33:57','Jonathan Simcoe',' the Test Page page'),(13,'pages','2','deleted',1,'2014-07-17 00:33:57','Jonathan Simcoe',' the Test page'),(14,'pages','3','created',1,'2014-07-17 00:34:45','Jonathan Simcoe',' the Home page'),(15,'sections','2','updated',1,'2014-07-17 00:36:46','Jonathan Simcoe',' the Structure section'),(16,'2','2','created',1,'2014-07-17 00:37:12','Jonathan Simcoe','/home:::Structure'),(17,'pages','3','updated',1,'2014-07-17 00:37:42','Jonathan Simcoe',' the Home page'),(18,'sections','3','created',1,'2014-07-17 00:56:22','Jonathan Simcoe',' the Globals section'),(19,'sections','3','updated',1,'2014-07-17 00:56:47','Jonathan Simcoe',' the Globals section'),(20,'sections','3','updated',1,'2014-07-17 00:57:13','Jonathan Simcoe',' the Globals section'),(21,'3','3','created',1,'2014-07-17 00:57:30','Jonathan Simcoe','Typography:::Globals'),(22,'3','4','created',1,'2014-07-17 00:57:42','Jonathan Simcoe','Anaytics:::Globals'),(23,'3','4','updated',1,'2014-07-17 00:57:52','Jonathan Simcoe','Analytics:::Globals'),(24,'datasources','data.globals.php','created',1,'2014-07-17 01:19:52','Jonathan Simcoe',' the Globals data source'),(25,'datasources','data.structure_all.php','created',1,'2014-07-17 01:22:48','Jonathan Simcoe',' the Structure: All data source'),(26,'datasources','data.structure_navigation.php','created',1,'2014-07-17 01:24:40','Jonathan Simcoe',' the Structure: Navigation data source'),(27,'datasources','data.structure_url.php','created',1,'2014-07-17 01:27:09','Jonathan Simcoe',' the Structure: URL data source'),(28,'pages','3','updated',1,'2014-07-17 01:34:26','Jonathan Simcoe',' the Home page'),(29,'pages','3','updated',1,'2014-07-17 01:37:15','Jonathan Simcoe',' the Home page'),(30,'pages','3','updated',1,'2014-07-17 01:37:25','Jonathan Simcoe',' the Home page'),(31,'pages','3','updated',1,'2014-07-17 01:37:32','Jonathan Simcoe',' the Home page'),(32,'2','2','updated',1,'2014-07-17 01:37:57','Jonathan Simcoe','/home:::Structure'),(33,'2','2','updated',1,'2014-07-17 01:38:56','Jonathan Simcoe','/home:::Structure'),(34,'2','2','updated',1,'2014-07-17 01:38:57','Jonathan Simcoe','/home:::Structure'),(35,'datasources','data.structure_navigation.php','updated',1,'2014-07-17 01:39:10','Jonathan Simcoe',' the Structure: Navigation data source'),(36,'datasources','data.structure_url.php','updated',1,'2014-07-17 01:39:46','Jonathan Simcoe',' the Structure: URL data source'),(37,'2','5','created',1,'2014-07-17 01:42:29','Jonathan Simcoe','/about:::Structure'),(38,'2','6','created',1,'2014-07-17 01:43:13','Jonathan Simcoe','/about/our-history:::Structure'),(39,'extensions','configuration','disabled',1,'2014-07-17 05:07:11','Jonathan Simcoe','the Configuration Settings extension'),(40,'extensions','configuration','uninstalled',1,'2014-07-17 05:07:17','Jonathan Simcoe','the Configuration Settings extension');
/*!40000 ALTER TABLE `sym_tracker_activity` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-17  9:59:50
