/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: s32_hardcore_database
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0+deb12u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `s32_hardcore_database`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `s32_hardcore_database` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `s32_hardcore_database`;

--
-- Table structure for table `litebans_allow`
--

DROP TABLE IF EXISTS `litebans_allow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litebans_allow` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` binary(16) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litebans_allow`
--

LOCK TABLES `litebans_allow` WRITE;
/*!40000 ALTER TABLE `litebans_allow` DISABLE KEYS */;
/*!40000 ALTER TABLE `litebans_allow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litebans_bans`
--

DROP TABLE IF EXISTS `litebans_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litebans_bans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `reason` varchar(2048) DEFAULT NULL,
  `banned_by_uuid` varchar(36) NOT NULL,
  `banned_by_name` varchar(128) DEFAULT NULL,
  `removed_by_uuid` varchar(36) DEFAULT NULL,
  `removed_by_name` varchar(128) DEFAULT NULL,
  `removed_by_reason` varchar(2048) DEFAULT NULL,
  `removed_by_date` timestamp NULL DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `until` bigint(20) NOT NULL,
  `template` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `server_scope` varchar(32) DEFAULT NULL,
  `server_origin` varchar(32) DEFAULT NULL,
  `silent` bit(1) NOT NULL,
  `ipban` bit(1) NOT NULL,
  `ipban_wildcard` bit(1) NOT NULL DEFAULT b'0',
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_litebans_bans_template` (`template`),
  KEY `idx_litebans_bans_ipban_wildcard` (`ipban_wildcard`),
  KEY `idx_litebans_bans_uuid` (`uuid`),
  KEY `idx_litebans_bans_ip` (`ip`),
  KEY `idx_litebans_bans_banned_by_uuid` (`banned_by_uuid`),
  KEY `idx_litebans_bans_time` (`time`),
  KEY `idx_litebans_bans_until` (`until`),
  KEY `idx_litebans_bans_ipban` (`ipban`),
  KEY `idx_litebans_bans_active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litebans_bans`
--

LOCK TABLES `litebans_bans` WRITE;
/*!40000 ALTER TABLE `litebans_bans` DISABLE KEYS */;
INSERT INTO `litebans_bans` VALUES
(1,'07eb97ba-cf03-4b8b-bc45-739aa73470e8','188.245.171.223','The Ban Hammer has spoken!','CONSOLE','Console','CONSOLE','Console','No reason specified.','2026-02-18 21:33:58',1771450420602,0,255,'*','litebans','','\0','\0','\0');
/*!40000 ALTER TABLE `litebans_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litebans_cache8k`
--

DROP TABLE IF EXISTS `litebans_cache8k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litebans_cache8k` (
  `id` tinyint(3) unsigned NOT NULL,
  `b` blob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litebans_cache8k`
--

LOCK TABLES `litebans_cache8k` WRITE;
/*!40000 ALTER TABLE `litebans_cache8k` DISABLE KEYS */;
/*!40000 ALTER TABLE `litebans_cache8k` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litebans_config`
--

DROP TABLE IF EXISTS `litebans_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litebans_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(128) NOT NULL,
  `build` varchar(128) NOT NULL,
  `timezone` varchar(64) NOT NULL DEFAULT '+00:00',
  `accept` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litebans_config`
--

LOCK TABLES `litebans_config` WRITE;
/*!40000 ALTER TABLE `litebans_config` DISABLE KEYS */;
INSERT INTO `litebans_config` VALUES
(1,'2025-12-01@13:07','1179','UTC',0);
/*!40000 ALTER TABLE `litebans_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litebans_history`
--

DROP TABLE IF EXISTS `litebans_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litebans_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `name` varchar(16) DEFAULT NULL,
  `uuid` varchar(36) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_litebans_history_uuid` (`uuid`),
  KEY `idx_litebans_history_name` (`name`),
  KEY `idx_litebans_history_ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litebans_history`
--

LOCK TABLES `litebans_history` WRITE;
/*!40000 ALTER TABLE `litebans_history` DISABLE KEYS */;
INSERT INTO `litebans_history` VALUES
(1,'2026-01-04 19:35:39','CONSOLE','CONSOLE','#'),
(21,'2026-02-27 02:38:03','RedBot','44a79442-8d93-3e97-a7c9-21652c14cfe2','89.212.52.16'),
(22,'2026-03-08 18:15:06','RedBot1','b96e562e-eb2d-352b-b982-b520a8feb8b5','89.212.52.16'),
(23,'2026-03-08 18:15:10','RedBot2','772fc13c-7ff9-39cd-b594-4f5213cf02d1','89.212.52.16'),
(24,'2026-03-08 18:15:13','RedBot3','7c2efb34-d989-3b58-baab-081dadd4daef','89.212.52.16'),
(25,'2026-03-08 18:16:20','RedBot4','403b93ea-17f6-391b-8323-dd5870fed261','89.212.52.16'),
(26,'2026-03-08 18:15:18','RedBot5','457e724e-8293-30cb-95ac-fbe930678ddc','89.212.52.16'),
(27,'2026-03-08 18:15:29','RedBot6','059e8471-62a3-3689-800b-97693279fe63','89.212.52.16'),
(35,'2026-03-07 19:33:03','kait_superheroic','09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','71.62.17.91'),
(37,'2026-03-08 18:42:05','_Vortical_','0fe27880-45c9-3487-a496-bde393a8d97d','85.76.99.228'),
(38,'2026-03-08 18:42:14','xRedCrystalx','6d3bf17e-16f4-3eb6-9425-b5bb1d150201','89.212.52.16'),
(39,'2026-03-08 18:15:28','RedBot7','7adf56b9-d9ad-32d1-92de-46398287d8ec','89.212.52.16'),
(40,'2026-03-08 18:15:34','RedBot8','6ff1da77-4f7b-3367-9c3c-b1dc07c7f634','89.212.52.16'),
(41,'2026-03-08 18:15:37','RedBot9','588be630-9f2c-3815-af27-f7e40d06f4cf','89.212.52.16'),
(42,'2026-03-08 18:15:41','RedBot10','4df6b53d-c707-3e39-9a50-d52f3e95b99f','89.212.52.16'),
(43,'2026-03-08 18:15:47','RedBot11','c787d637-1ccf-38c4-9d8c-376234889993','89.212.52.16'),
(44,'2026-03-08 18:15:50','RedBot12','28efbc48-9d99-3639-aab0-e384bd4d5852','89.212.52.16'),
(45,'2026-03-08 18:15:57','RedBot13','df861ab4-4409-3ff3-ac2c-5a59eb4a315e','89.212.52.16'),
(46,'2026-03-08 18:16:00','RedBot14','0101b99a-a39a-33d9-a7a4-dc8a2eb89948','89.212.52.16'),
(47,'2026-03-08 18:16:03','RedBot15','b79fc6c9-225a-3d2c-99d5-244f7cbe3371','89.212.52.16'),
(48,'2026-03-08 18:16:09','RedBot16','26bb2b10-8933-3a71-817a-6ae14619c9b9','89.212.52.16'),
(49,'2026-03-08 18:16:13','RedBot17','9512bb93-17bc-33e9-af0d-8869a0d7071c','89.212.52.16'),
(50,'2026-03-08 18:16:19','RedBot18','94810692-74da-3f58-b371-f79434df7bc7','89.212.52.16');
/*!40000 ALTER TABLE `litebans_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litebans_kicks`
--

DROP TABLE IF EXISTS `litebans_kicks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litebans_kicks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `reason` varchar(2048) DEFAULT NULL,
  `banned_by_uuid` varchar(36) NOT NULL,
  `banned_by_name` varchar(128) DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `until` bigint(20) NOT NULL,
  `template` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `server_scope` varchar(32) DEFAULT NULL,
  `server_origin` varchar(32) DEFAULT NULL,
  `silent` bit(1) NOT NULL,
  `ipban` bit(1) NOT NULL,
  `ipban_wildcard` bit(1) NOT NULL DEFAULT b'0',
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_litebans_kicks_template` (`template`),
  KEY `idx_litebans_kicks_ipban_wildcard` (`ipban_wildcard`),
  KEY `idx_litebans_kicks_uuid` (`uuid`),
  KEY `idx_litebans_kicks_ip` (`ip`),
  KEY `idx_litebans_kicks_banned_by_uuid` (`banned_by_uuid`),
  KEY `idx_litebans_kicks_time` (`time`),
  KEY `idx_litebans_kicks_until` (`until`),
  KEY `idx_litebans_kicks_ipban` (`ipban`),
  KEY `idx_litebans_kicks_active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litebans_kicks`
--

LOCK TABLES `litebans_kicks` WRITE;
/*!40000 ALTER TABLE `litebans_kicks` DISABLE KEYS */;
INSERT INTO `litebans_kicks` VALUES
(1,'07eb97ba-cf03-4b8b-bc45-739aa73470e8','188.245.171.223','','CONSOLE','Console',1771450392043,-1,255,'*','litebans','','\0','\0','\0'),
(2,'07eb97ba-cf03-4b8b-bc45-739aa73470e8','188.245.171.223','test description','CONSOLE','Console',1771450488293,-1,255,'*','litebans','','\0','\0','\0'),
(3,'07eb97ba-cf03-4b8b-bc45-739aa73470e8','188.245.171.223','','CONSOLE','Console',1771451166961,-1,255,'*','litebans','','\0','\0','\0'),
(4,'07eb97ba-cf03-4b8b-bc45-739aa73470e8','89.212.52.16','An error occurred while loading your player data. Please contact an administrator and try again later.','CONSOLE','Console',1772153624673,0,255,'*','litebans','','\0','\0',''),
(5,'07eb97ba-cf03-4b8b-bc45-739aa73470e8','89.212.52.16','An error occurred while loading your player data. Please contact an administrator and try again later.','CONSOLE','Console',1772153697484,0,255,'*','litebans','','\0','\0',''),
(6,'6d3bf17e-16f4-3eb6-9425-b5bb1d150201','89.212.52.16','An error occurred while loading your player data. Please contact an administrator and try again later.','CONSOLE','Console',1772287832437,0,255,'*','litebans','','\0','\0',''),
(7,'6d3bf17e-16f4-3eb6-9425-b5bb1d150201','89.212.52.16','Your time in Tartarus has expired. May you find peace in the afterlife.','CONSOLE','Console',1772296887199,0,255,'*','litebans','','\0','\0',''),
(8,'09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','73.147.91.94','An error occurred while loading your player data. Please contact an administrator and try again later.','CONSOLE','Console',1772342045678,0,255,'*','litebans','','\0','\0',''),
(9,'09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','73.147.91.94','An error occurred while loading your player data. Please contact an administrator and try again later.','CONSOLE','Console',1772342066923,0,255,'*','litebans','','\0','\0',''),
(10,'09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','73.147.91.94','An error occurred while loading your player data. Please contact an administrator and try again later.','CONSOLE','Console',1772342140974,0,255,'*','litebans','','\0','\0',''),
(11,'09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','73.147.91.94','An error occurred while loading your player data. Please contact an administrator and try again later.','CONSOLE','Console',1772413343169,0,255,'*','litebans','','\0','\0',''),
(12,'6d3bf17e-16f4-3eb6-9425-b5bb1d150201','89.212.52.16','§cFailed to connect you to the server. If this continues, please notify Administrators.','CONSOLE','Console',1772416943161,0,255,'*','litebans','','\0','\0',''),
(13,'09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','73.147.91.94','§cFailed to connect you to the server. If this continues, please notify Administrators.','CONSOLE','Console',1772416950528,0,255,'*','litebans','','\0','\0','');
/*!40000 ALTER TABLE `litebans_kicks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litebans_mutes`
--

DROP TABLE IF EXISTS `litebans_mutes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litebans_mutes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `reason` varchar(2048) DEFAULT NULL,
  `banned_by_uuid` varchar(36) NOT NULL,
  `banned_by_name` varchar(128) DEFAULT NULL,
  `removed_by_uuid` varchar(36) DEFAULT NULL,
  `removed_by_name` varchar(128) DEFAULT NULL,
  `removed_by_reason` varchar(2048) DEFAULT NULL,
  `removed_by_date` timestamp NULL DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `until` bigint(20) NOT NULL,
  `template` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `server_scope` varchar(32) DEFAULT NULL,
  `server_origin` varchar(32) DEFAULT NULL,
  `silent` bit(1) NOT NULL,
  `ipban` bit(1) NOT NULL,
  `ipban_wildcard` bit(1) NOT NULL DEFAULT b'0',
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_litebans_mutes_template` (`template`),
  KEY `idx_litebans_mutes_ipban_wildcard` (`ipban_wildcard`),
  KEY `idx_litebans_mutes_uuid` (`uuid`),
  KEY `idx_litebans_mutes_ip` (`ip`),
  KEY `idx_litebans_mutes_banned_by_uuid` (`banned_by_uuid`),
  KEY `idx_litebans_mutes_time` (`time`),
  KEY `idx_litebans_mutes_until` (`until`),
  KEY `idx_litebans_mutes_ipban` (`ipban`),
  KEY `idx_litebans_mutes_active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litebans_mutes`
--

LOCK TABLES `litebans_mutes` WRITE;
/*!40000 ALTER TABLE `litebans_mutes` DISABLE KEYS */;
/*!40000 ALTER TABLE `litebans_mutes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litebans_servers`
--

DROP TABLE IF EXISTS `litebans_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litebans_servers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `uuid` varchar(32) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litebans_servers`
--

LOCK TABLES `litebans_servers` WRITE;
/*!40000 ALTER TABLE `litebans_servers` DISABLE KEYS */;
INSERT INTO `litebans_servers` VALUES
(1,'litebans','f1fb1d52101f43e5b8b4b923c9c8a81f','2026-01-04 19:35:27'),
(2,'litebans','2b8a246f917d487bb4a0967f99127252','2026-02-18 21:32:02'),
(3,'litebans','d78649f9185d460aa76cf72789320640','2026-02-18 21:32:12');
/*!40000 ALTER TABLE `litebans_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litebans_sync`
--

DROP TABLE IF EXISTS `litebans_sync`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litebans_sync` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `info` int(10) unsigned NOT NULL,
  `msg` varchar(4096) NOT NULL,
  `time` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litebans_sync`
--

LOCK TABLES `litebans_sync` WRITE;
/*!40000 ALTER TABLE `litebans_sync` DISABLE KEYS */;
INSERT INTO `litebans_sync` VALUES
(32,1048619,'','2026-03-08 18:02:53');
/*!40000 ALTER TABLE `litebans_sync` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `litebans_warnings`
--

DROP TABLE IF EXISTS `litebans_warnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `litebans_warnings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET ascii COLLATE ascii_general_ci DEFAULT NULL,
  `reason` varchar(2048) DEFAULT NULL,
  `banned_by_uuid` varchar(36) NOT NULL,
  `banned_by_name` varchar(128) DEFAULT NULL,
  `removed_by_uuid` varchar(36) DEFAULT NULL,
  `removed_by_name` varchar(128) DEFAULT NULL,
  `removed_by_reason` varchar(2048) DEFAULT NULL,
  `removed_by_date` timestamp NULL DEFAULT NULL,
  `time` bigint(20) NOT NULL,
  `until` bigint(20) NOT NULL,
  `template` tinyint(3) unsigned NOT NULL DEFAULT 255,
  `server_scope` varchar(32) DEFAULT NULL,
  `server_origin` varchar(32) DEFAULT NULL,
  `silent` bit(1) NOT NULL,
  `ipban` bit(1) NOT NULL,
  `ipban_wildcard` bit(1) NOT NULL DEFAULT b'0',
  `active` bit(1) NOT NULL,
  `warned` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `idx_litebans_warnings_template` (`template`),
  KEY `idx_litebans_warnings_ipban_wildcard` (`ipban_wildcard`),
  KEY `idx_litebans_warnings_uuid` (`uuid`),
  KEY `idx_litebans_warnings_ip` (`ip`),
  KEY `idx_litebans_warnings_banned_by_uuid` (`banned_by_uuid`),
  KEY `idx_litebans_warnings_time` (`time`),
  KEY `idx_litebans_warnings_until` (`until`),
  KEY `idx_litebans_warnings_ipban` (`ipban`),
  KEY `idx_litebans_warnings_active` (`active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `litebans_warnings`
--

LOCK TABLES `litebans_warnings` WRITE;
/*!40000 ALTER TABLE `litebans_warnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `litebans_warnings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_actions`
--

DROP TABLE IF EXISTS `luckperms_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `luckperms_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` bigint(20) NOT NULL,
  `actor_uuid` varchar(36) NOT NULL,
  `actor_name` varchar(100) NOT NULL,
  `type` char(1) NOT NULL,
  `acted_uuid` varchar(36) NOT NULL,
  `acted_name` varchar(36) NOT NULL,
  `action` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=382 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `luckperms_group_permissions`
--

DROP TABLE IF EXISTS `luckperms_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `luckperms_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL,
  `permission` varchar(200) NOT NULL,
  `value` tinyint(1) NOT NULL,
  `server` varchar(36) NOT NULL,
  `world` varchar(64) NOT NULL,
  `expiry` bigint(20) NOT NULL,
  `contexts` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `luckperms_group_permissions_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_group_permissions`
--

LOCK TABLES `luckperms_group_permissions` WRITE;
/*!40000 ALTER TABLE `luckperms_group_permissions` DISABLE KEYS */;
INSERT INTO `luckperms_group_permissions` VALUES
(4,'noperm','coreprotect.*',0,'global','global',0,'{}'),
(6,'noperm','chunky.command.*',0,'global','global',0,'{}'),
(7,'noperm','redpermissions.override.*',0,'global','global',0,'{}'),
(8,'noperm','minecraft.command.*',0,'global','global',0,'{}'),
(9,'noperm','ultimateteams.*',0,'global','global',0,'{}'),
(10,'noperm','litebans.*',0,'global','global',0,'{}'),
(11,'noperm','weight.1',1,'global','global',0,'{}'),
(12,'noperm','voicechat.*',0,'global','global',0,'{}'),
(13,'noperm','bukkit.command.*',0,'global','global',0,'{}'),
(14,'noperm','pv.*',0,'global','global',0,'{}'),
(15,'noperm','craftbukkit',0,'global','global',0,'{}'),
(31,'default','voicechat.speak',1,'global','global',0,'{}'),
(33,'default','group.noperm',1,'global','global',0,'{}'),
(43,'admin','weight.100',1,'global','global',0,'{}'),
(56,'moderator','displayname.moderator',1,'global','global',0,'{}'),
(58,'tartarus','red-items.ensuing-vessel.*',1,'global','global',0,'{}'),
(60,'tartarus','red-items.consequent-vessel.*',1,'global','global',0,'{}'),
(62,'tartarus','weight.10',1,'global','global',0,'{}'),
(63,'tartarus','red-items.ascendant-vessel.*',1,'global','global',0,'{}'),
(64,'ghost','red-deaths.pickup',0,'global','global',0,'{}'),
(67,'default','voicechat.listen',1,'global','global',0,'{}'),
(73,'ghost','group.default',1,'global','global',0,'{}'),
(74,'ghost','weight.20',1,'global','global',0,'{}'),
(75,'ghost','red-items.star-of-revival.*',0,'global','global',0,'{}'),
(76,'ghost','pv.others',1,'global','global',0,'{}'),
(77,'ghost','red-deaths.attack',0,'global','global',0,'{}'),
(78,'ghost','red-deaths.drop',0,'global','global',0,'{}'),
(79,'tartarus','group.noperm',1,'global','global',0,'{}'),
(81,'tartarus','displayname.tartarus',1,'global','global',0,'{}'),
(87,'debug','minecraft.command.*',1,'global','global',0,'{}'),
(88,'ghost','displayname.ghost',1,'global','global',0,'{}'),
(89,'ghost','red-deaths.place',0,'global','global',0,'{}'),
(90,'ghost','pv.logout',1,'global','global',0,'{}'),
(91,'ghost','pv.joinvanished',1,'global','global',0,'{}'),
(92,'ghost','red-deaths.interact',0,'global','global',0,'{}'),
(93,'ghost','pv.use.level10',1,'global','global',0,'{}'),
(94,'ghost','pv.login',1,'global','global',0,'{}'),
(95,'ghost','red-items.heart.*',0,'global','global',0,'{}'),
(97,'debug','weight.2',1,'global','global',0,'{}'),
(98,'debug','minecraft.commands.*',1,'global','global',0,'{}'),
(99,'debug','red-hardcore.reload',1,'global','global',0,'{}'),
(100,'debug','displayname.debug',1,'global','global',0,'{}'),
(101,'debug','red-border.*',1,'global','global',0,'{}'),
(102,'default','voicechat.groups',1,'global','global',0,'{}'),
(119,'moderator','weight.70',1,'global','global',0,'{}'),
(122,'ghost','red-deaths.break',0,'global','global',0,'{}'),
(123,'ghost','pv.see.level10',1,'global','global',0,'{}'),
(124,'ghost','pv.showintab',1,'global','global',0,'{}'),
(138,'debug','group.noperm',1,'global','global',0,'{}'),
(139,'debug','ia.*',1,'global','global',0,'{}'),
(148,'default','weight.5',1,'global','global',0,'{}'),
(178,'player','weight.25',1,'global','global',0,'{}'),
(179,'player','group.default',1,'global','global',0,'{}'),
(180,'player','displayname.player',1,'global','global',0,'{}'),
(186,'spectator','weight.50',1,'global','global',0,'{}'),
(187,'spectator','displayname.spectator',1,'global','global',0,'{}'),
(188,'spectator','group.noperm',1,'global','global',0,'{}'),
(192,'admin','displayname.admin',1,'global','global',0,'{}'),
(197,'admin','minecraft.admin',1,'global','global',0,'{}'),
(199,'admin','redpermissions.override.*',1,'global','global',0,'{}'),
(206,'admin','pv.*',1,'global','global',0,'{}'),
(207,'admin','ia.*',1,'global','global',0,'{}'),
(208,'admin','litebans.*',1,'global','global',0,'{}'),
(209,'admin','protocol.*',1,'global','global',0,'{}'),
(210,'admin','voicechat.*',1,'global','global',0,'{}'),
(212,'admin','vulcan.*',1,'global','global',0,'{}'),
(213,'admin','luckperms.*',1,'global','global',0,'{}'),
(215,'admin','orebfuscator.*',1,'global','global',0,'{}'),
(219,'noperm','ia.*',0,'global','global',0,'{}'),
(220,'noperm','displayname.noperm',1,'global','global',0,'{}'),
(231,'player','red-items.star-of-revival.*',1,'global','global',0,'{}'),
(233,'debug','red-hardcore.debug',1,'global','global',0,'{}'),
(235,'noperm','purpur.joinfullserver',1,'global','global',0,'{}'),
(236,'moderator','purpur.joinfullserver',1,'global','global',0,'{}'),
(237,'player','group.teams',1,'global','global',0,'{}'),
(238,'teams','group.noperm',1,'global','global',0,'{}'),
(239,'teams','ultimateteams.team.promote',1,'global','global',0,'{}'),
(240,'teams','ultimateteams.team.transfer',1,'global','global',0,'{}'),
(241,'teams','ultimateteams.team.rename',1,'global','global',0,'{}'),
(242,'teams','ultimateteams.allychat',1,'global','global',0,'{}'),
(243,'teams','ultimateteams.team.ally.remove',1,'global','global',0,'{}'),
(244,'teams','ultimateteams.team.invite.deny',1,'global','global',0,'{}'),
(245,'teams','ultimateteams.team.kick',1,'global','global',0,'{}'),
(246,'teams','ultimateteams.team.enemy.add',1,'global','global',0,'{}'),
(247,'teams','ultimateteams.team.invite.send',1,'global','global',0,'{}'),
(248,'teams','ultimateteams.player',1,'global','global',0,'{}'),
(249,'teams','ultimateteams.invites.disable',1,'global','global',0,'{}'),
(250,'teams','ultimateteams.team.enemy.remove',1,'global','global',0,'{}'),
(251,'teams','ultimateteams.team.demote',1,'global','global',0,'{}'),
(252,'teams','ultimateteams.team.create',1,'global','global',0,'{}'),
(253,'teams','ultimateteams.team.motd.set',1,'global','global',0,'{}'),
(254,'teams','ultimateteams.teamchat',1,'global','global',0,'{}'),
(255,'teams','displayname.teams',1,'global','global',0,'{}'),
(256,'teams','ultimateteams.team.info',1,'global','global',0,'{}'),
(257,'teams','ultimateteams.chat',1,'global','global',0,'{}'),
(258,'teams','ultimateteams.team.prefix',1,'global','global',0,'{}'),
(259,'teams','ultimateteams.invites.enable',1,'global','global',0,'{}'),
(260,'teams','weight.3',1,'global','global',0,'{}'),
(261,'teams','ultimateteams.team.ally.add',1,'global','global',0,'{}'),
(262,'teams','ultimateteams.team.disband',1,'global','global',0,'{}'),
(263,'teams','ultimateteams.team.list',1,'global','global',0,'{}'),
(264,'teams','redpermissions.override.team',1,'global','global',0,'{}'),
(265,'teams','ultimateteams.team.leave',1,'global','global',0,'{}'),
(266,'teams','ultimateteams.team.invite.accept',1,'global','global',0,'{}'),
(269,'debug','ia.admin.*',1,'global','global',0,'{}'),
(270,'moderator','litebans.tempban',1,'global','global',0,'{}'),
(271,'moderator','litebans.notify.muted',1,'global','global',0,'{}'),
(272,'moderator','litebans.mutelist',1,'global','global',0,'{}'),
(273,'moderator','litebans.notify.dupeip_join',1,'global','global',0,'{}'),
(274,'moderator','litebans.tempmute',1,'global','global',0,'{}'),
(275,'moderator','litebans.kick',1,'global','global',0,'{}'),
(276,'moderator','litebans.notify.warned.offline',1,'global','global',0,'{}'),
(277,'moderator','litebans.namehistory',1,'global','global',0,'{}'),
(278,'moderator','litebans.staffhistory',1,'global','global',0,'{}'),
(279,'moderator','litebans.warnings',1,'global','global',0,'{}'),
(280,'moderator','litebans.kick.global',1,'global','global',0,'{}'),
(281,'moderator','litebans.banlist',1,'global','global',0,'{}'),
(282,'moderator','litebans.unwarn',1,'global','global',0,'{}'),
(283,'moderator','litebans.unmute',1,'global','global',0,'{}'),
(284,'moderator','litebans.checkmute',1,'global','global',0,'{}'),
(285,'moderator','litebans.notify.silent',1,'global','global',0,'{}'),
(286,'moderator','litebans.ban',1,'global','global',0,'{}'),
(287,'moderator','litebans.mute',1,'global','global',0,'{}'),
(288,'moderator','litebans.notify.warned',1,'global','global',0,'{}'),
(289,'moderator','litebans.lastuuid',1,'global','global',0,'{}'),
(290,'moderator','litebans.checkban',1,'global','global',0,'{}'),
(291,'moderator','litebans.warn',1,'global','global',0,'{}'),
(292,'moderator','litebans.dupeip',1,'global','global',0,'{}'),
(293,'moderator','litebans.checkwarn',1,'global','global',0,'{}'),
(294,'moderator','litebans.unban',1,'global','global',0,'{}'),
(295,'moderator','litebans.history',1,'global','global',0,'{}'),
(301,'moderator','group.noperm',1,'global','global',0,'{}'),
(302,'moderator','pv.interact',1,'global','global',0,'{}'),
(306,'moderator','pv.list',1,'global','global',0,'{}'),
(307,'moderator','pv.switch',1,'global','global',0,'{}'),
(309,'moderator','pv.use',1,'global','global',0,'{}'),
(313,'moderator','redpermissions.override.rv',1,'global','global',0,'{}'),
(314,'moderator','pv.use.level70',1,'global','global',0,'{}'),
(315,'moderator','pv.see.level70',1,'global','global',0,'{}'),
(317,'spectator','pv.see.level50',1,'global','global',0,'{}'),
(318,'moderator','pv.help',1,'global','global',0,'{}'),
(319,'moderator','pv.silent',1,'global','global',0,'{}'),
(320,'noperm','antihealthindicator.*',0,'global','global',0,'{}'),
(321,'noperm','spark.*',0,'global','global',0,'{}'),
(322,'noperm','vulcan.*',0,'global','global',0,'{}'),
(323,'noperm','zmenu.*',0,'global','global',0,'{}'),
(324,'player','red-items.heart.use',1,'global','global',0,'{}'),
(325,'player','red-items.heart.craft',1,'global','global',0,'{}'),
(326,'default','redlib.help',1,'global','global',0,'{}'),
(327,'default','redlib.credits',1,'global','global',0,'{}'),
(328,'default','redlib.reload',1,'global','global',0,'{}'),
(329,'default','redlib.socials',1,'global','global',0,'{}'),
(333,'debug','placeholderapi.*',1,'global','global',0,'{}'),
(335,'debug','redpermissions.override.*',1,'global','global',0,'{}'),
(336,'debug','placeholderapi',1,'global','global',0,'{}'),
(340,'player','red-hardcore.command.star',1,'global','global',0,'{}'),
(341,'player','red-hardcore.command.heart',1,'global','global',0,'{}'),
(344,'player','ia.user.recipe.*',1,'global','global',0,'{}');
/*!40000 ALTER TABLE `luckperms_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_groups`
--

DROP TABLE IF EXISTS `luckperms_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `luckperms_groups` (
  `name` varchar(36) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_groups`
--

LOCK TABLES `luckperms_groups` WRITE;
/*!40000 ALTER TABLE `luckperms_groups` DISABLE KEYS */;
INSERT INTO `luckperms_groups` VALUES
('admin'),
('debug'),
('default'),
('ghost'),
('moderator'),
('noperm'),
('player'),
('spectator'),
('tartarus'),
('teams');
/*!40000 ALTER TABLE `luckperms_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_messenger`
--

DROP TABLE IF EXISTS `luckperms_messenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `luckperms_messenger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NOT NULL,
  `msg` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_messenger`
--

LOCK TABLES `luckperms_messenger` WRITE;
/*!40000 ALTER TABLE `luckperms_messenger` DISABLE KEYS */;
/*!40000 ALTER TABLE `luckperms_messenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_players`
--

DROP TABLE IF EXISTS `luckperms_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `luckperms_players` (
  `uuid` varchar(36) NOT NULL,
  `username` varchar(16) NOT NULL,
  `primary_group` varchar(36) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `luckperms_players_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_players`
--

LOCK TABLES `luckperms_players` WRITE;
/*!40000 ALTER TABLE `luckperms_players` DISABLE KEYS */;
INSERT INTO `luckperms_players` VALUES
('0101b99a-a39a-33d9-a7a4-dc8a2eb89948','redbot14','default'),
('059e8471-62a3-3689-800b-97693279fe63','redbot6','default'),
('09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','kait_superheroic','default'),
('0fe27880-45c9-3487-a496-bde393a8d97d','_vortical_','default'),
('26bb2b10-8933-3a71-817a-6ae14619c9b9','redbot16','default'),
('28efbc48-9d99-3639-aab0-e384bd4d5852','redbot12','default'),
('403b93ea-17f6-391b-8323-dd5870fed261','redbot4','default'),
('44a79442-8d93-3e97-a7c9-21652c14cfe2','redbot','default'),
('457e724e-8293-30cb-95ac-fbe930678ddc','redbot5','default'),
('4df6b53d-c707-3e39-9a50-d52f3e95b99f','redbot10','default'),
('588be630-9f2c-3815-af27-f7e40d06f4cf','redbot9','default'),
('6d3bf17e-16f4-3eb6-9425-b5bb1d150201','xredcrystalx','default'),
('6ff1da77-4f7b-3367-9c3c-b1dc07c7f634','redbot8','default'),
('772fc13c-7ff9-39cd-b594-4f5213cf02d1','redbot2','default'),
('7adf56b9-d9ad-32d1-92de-46398287d8ec','redbot7','default'),
('7c2efb34-d989-3b58-baab-081dadd4daef','redbot3','default'),
('94810692-74da-3f58-b371-f79434df7bc7','redbot18','default'),
('9512bb93-17bc-33e9-af0d-8869a0d7071c','redbot17','default'),
('b79fc6c9-225a-3d2c-99d5-244f7cbe3371','redbot15','default'),
('b96e562e-eb2d-352b-b982-b520a8feb8b5','redbot1','default'),
('c787d637-1ccf-38c4-9d8c-376234889993','redbot11','default'),
('df861ab4-4409-3ff3-ac2c-5a59eb4a315e','redbot13','default');
/*!40000 ALTER TABLE `luckperms_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_tracks`
--

DROP TABLE IF EXISTS `luckperms_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `luckperms_tracks` (
  `name` varchar(36) NOT NULL,
  `groups` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_tracks`
--

LOCK TABLES `luckperms_tracks` WRITE;
/*!40000 ALTER TABLE `luckperms_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `luckperms_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luckperms_user_permissions`
--

DROP TABLE IF EXISTS `luckperms_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `luckperms_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `permission` varchar(200) NOT NULL,
  `value` tinyint(1) NOT NULL,
  `server` varchar(36) NOT NULL,
  `world` varchar(64) NOT NULL,
  `expiry` bigint(20) NOT NULL,
  `contexts` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `luckperms_user_permissions_uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luckperms_user_permissions`
--

LOCK TABLES `luckperms_user_permissions` WRITE;
/*!40000 ALTER TABLE `luckperms_user_permissions` DISABLE KEYS */;
INSERT INTO `luckperms_user_permissions` VALUES
(95,'07eb97ba-cf03-4b8b-bc45-739aa73470e8','meta.lp-editor-key.6hmW6L49tQA2FMrubp+kc3uQGL0=',1,'global','global',0,'{}'),
(99,'07eb97ba-cf03-4b8b-bc45-739aa73470e8','group.debug',1,'global','global',0,'{}'),
(102,'1c7fd55a-11c4-4a17-8697-664e1b6ee832','group.debug',1,'global','global',0,'{}'),
(112,'1c7fd55a-11c4-4a17-8697-664e1b6ee832','red-hardcore.rtp.world',1,'global','global',0,'{}'),
(117,'1c7fd55a-11c4-4a17-8697-664e1b6ee832','group.ghost',1,'global','global',0,'{}'),
(119,'07eb97ba-cf03-4b8b-bc45-739aa73470e8','red-queue.rules',1,'global','global',0,'{}'),
(120,'07eb97ba-cf03-4b8b-bc45-739aa73470e8','group.tartarus',1,'global','global',0,'{}'),
(122,'44a79442-8d93-3e97-a7c9-21652c14cfe2','group.player',1,'global','global',0,'{}'),
(138,'457e724e-8293-30cb-95ac-fbe930678ddc','group.player',1,'global','global',0,'{}'),
(140,'403b93ea-17f6-391b-8323-dd5870fed261','group.player',1,'global','global',0,'{}'),
(145,'403b93ea-17f6-391b-8323-dd5870fed261','group.tartarus',1,'global','global',0,'{}'),
(149,'7c2efb34-d989-3b58-baab-081dadd4daef','group.tartarus',1,'global','global',0,'{}'),
(150,'b96e562e-eb2d-352b-b982-b520a8feb8b5','group.tartarus',1,'global','global',0,'{}'),
(151,'772fc13c-7ff9-39cd-b594-4f5213cf02d1','group.tartarus',1,'global','global',0,'{}'),
(152,'059e8471-62a3-3689-800b-97693279fe63','group.default',1,'global','global',0,'{}'),
(155,'059e8471-62a3-3689-800b-97693279fe63','group.tartarus',1,'global','global',0,'{}'),
(164,'6d3bf17e-16f4-3eb6-9425-b5bb1d150201','group.debug',1,'global','global',0,'{}'),
(168,'09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','group.debug',1,'global','global',0,'{}'),
(172,'6d3bf17e-16f4-3eb6-9425-b5bb1d150201','staff',1,'global','global',0,'{}'),
(173,'09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','staff',1,'global','global',0,'{}'),
(181,'09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','group.ghost',1,'global','global',0,'{}'),
(191,'0fe27880-45c9-3487-a496-bde393a8d97d','red-hardcore.debug',1,'global','global',0,'{}'),
(202,'0fe27880-45c9-3487-a496-bde393a8d97d','group.player',1,'global','global',0,'{}'),
(203,'6d3bf17e-16f4-3eb6-9425-b5bb1d150201','group.player',1,'global','global',0,'{}');
/*!40000 ALTER TABLE `luckperms_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pandemonium_players`
--

DROP TABLE IF EXISTS `pandemonium_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pandemonium_players` (
  `uuid` varchar(36) NOT NULL,
  `lives` int(11) NOT NULL DEFAULT 3,
  `base_health` int(11) NOT NULL DEFAULT 20,
  `task` text DEFAULT NULL,
  `playtime` bigint(20) NOT NULL DEFAULT 0,
  `player_kills` int(11) NOT NULL DEFAULT 0,
  `player_deaths` int(11) NOT NULL DEFAULT 0,
  `player_revives` int(11) NOT NULL DEFAULT 0,
  `hearts_consumed` int(11) NOT NULL DEFAULT 0,
  `warden_kills` int(11) NOT NULL DEFAULT 0,
  `ender_dragon_kills` int(11) NOT NULL DEFAULT 0,
  `wither_kills` int(11) NOT NULL DEFAULT 0,
  `totems_consumed` int(11) NOT NULL DEFAULT 0,
  `golden_apples_consumed` int(11) NOT NULL DEFAULT 0,
  `god_apples_consumed` int(11) NOT NULL DEFAULT 0,
  `mace_kills` int(11) NOT NULL DEFAULT 0,
  `spear_kills` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`uuid`),
  KEY `idx_pandemonium_players_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pandemonium_players`
--

LOCK TABLES `pandemonium_players` WRITE;
/*!40000 ALTER TABLE `pandemonium_players` DISABLE KEYS */;
INSERT INTO `pandemonium_players` VALUES
('0101b99a-a39a-33d9-a7a4-dc8a2eb89948',3,20,NULL,21,0,0,0,0,0,0,0,0,0,0,0,0),
('059e8471-62a3-3689-800b-97693279fe63',3,20,'tartarus_countdown;451',6,0,0,0,0,0,0,0,0,0,0,0,0),
('09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70',2,20,NULL,1279,0,1,0,1,0,0,0,0,1,0,0,0),
('0fe27880-45c9-3487-a496-bde393a8d97d',2,16,NULL,822,0,2,0,0,0,0,0,0,0,0,0,0),
('26bb2b10-8933-3a71-817a-6ae14619c9b9',3,20,NULL,12,0,0,0,0,0,0,0,0,0,0,0,0),
('28efbc48-9d99-3639-aab0-e384bd4d5852',3,20,NULL,29,0,0,0,0,0,0,0,0,0,0,0,0),
('403b93ea-17f6-391b-8323-dd5870fed261',3,20,NULL,34,0,0,0,0,0,0,0,0,0,0,0,0),
('457e724e-8293-30cb-95ac-fbe930678ddc',3,20,NULL,60,0,0,0,0,0,0,0,0,0,0,0,0),
('4df6b53d-c707-3e39-9a50-d52f3e95b99f',3,20,NULL,37,0,0,0,0,0,0,0,0,0,0,0,0),
('588be630-9f2c-3815-af27-f7e40d06f4cf',3,20,NULL,42,0,0,0,0,0,0,0,0,0,0,0,0),
('6d3bf17e-16f4-3eb6-9425-b5bb1d150201',2,20,NULL,5114,0,0,0,0,0,0,0,0,0,0,0,0),
('6ff1da77-4f7b-3367-9c3c-b1dc07c7f634',3,20,NULL,46,0,0,0,0,0,0,0,0,0,0,0,0),
('772fc13c-7ff9-39cd-b594-4f5213cf02d1',3,20,'tartarus_countdown;540',3,0,0,0,0,0,0,0,0,0,0,0,0),
('7adf56b9-d9ad-32d1-92de-46398287d8ec',3,20,NULL,51,0,0,0,0,0,0,0,0,0,0,0,0),
('7c2efb34-d989-3b58-baab-081dadd4daef',3,20,'tartarus_countdown;545',4,0,0,0,0,0,0,0,0,0,0,0,0),
('94810692-74da-3f58-b371-f79434df7bc7',3,20,NULL,3,0,0,0,0,0,0,0,0,0,0,0,0),
('9512bb93-17bc-33e9-af0d-8869a0d7071c',3,20,NULL,7,0,0,0,0,0,0,0,0,0,0,0,0),
('b79fc6c9-225a-3d2c-99d5-244f7cbe3371',3,20,NULL,16,0,0,0,0,0,0,0,0,0,0,0,0),
('b96e562e-eb2d-352b-b982-b520a8feb8b5',3,20,'tartarus_countdown;536',4,0,0,0,0,0,0,0,0,0,0,0,0),
('c787d637-1ccf-38c4-9d8c-376234889993',3,20,NULL,33,0,0,0,0,0,0,0,0,0,0,0,0),
('df861ab4-4409-3ff3-ac2c-5a59eb4a315e',3,20,NULL,25,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `pandemonium_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redhardcore_players`
--

DROP TABLE IF EXISTS `redhardcore_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `redhardcore_players` (
  `uuid` varchar(36) NOT NULL,
  `lives` int(11) NOT NULL,
  `base_health` int(11) NOT NULL,
  `death_location` text DEFAULT NULL,
  `task` text DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `idx_rhardcore_players_uuid` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redhardcore_players`
--

LOCK TABLES `redhardcore_players` WRITE;
/*!40000 ALTER TABLE `redhardcore_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `redhardcore_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rsync_server_stats`
--

DROP TABLE IF EXISTS `rsync_server_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `rsync_server_stats` (
  `server_id` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  `player_count` int(11) DEFAULT 0,
  PRIMARY KEY (`server_id`),
  KEY `idx_rsync_server_stats_server_id` (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rsync_server_stats`
--

LOCK TABLES `rsync_server_stats` WRITE;
/*!40000 ALTER TABLE `rsync_server_stats` DISABLE KEYS */;
INSERT INTO `rsync_server_stats` VALUES
('Olympus',0,NULL),
('Styx',0,NULL),
('Tartarus',0,NULL);
/*!40000 ALTER TABLE `rsync_server_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ultimateteams_teams`
--

DROP TABLE IF EXISTS `ultimateteams_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ultimateteams_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `data` longblob NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ultimateteams_teams`
--

LOCK TABLES `ultimateteams_teams` WRITE;
/*!40000 ALTER TABLE `ultimateteams_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `ultimateteams_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ultimateteams_users`
--

DROP TABLE IF EXISTS `ultimateteams_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ultimateteams_users` (
  `uuid` char(36) NOT NULL,
  `username` varchar(16) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp(),
  `isBedrock` tinyint(1) NOT NULL,
  `bedrockUUID` varchar(36) DEFAULT NULL,
  `preferences` longblob NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ultimateteams_users`
--

LOCK TABLES `ultimateteams_users` WRITE;
/*!40000 ALTER TABLE `ultimateteams_users` DISABLE KEYS */;
INSERT INTO `ultimateteams_users` VALUES
('0101b99a-a39a-33d9-a7a4-dc8a2eb89948','RedBot14','2026-03-08 18:15:58',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('059e8471-62a3-3689-800b-97693279fe63','RedBot6','2026-02-27 23:39:15',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('07eb97ba-cf03-4b8b-bc45-739aa73470e8','xRedCrystalx','2026-01-06 19:26:55',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('09d3a3e1-0d70-32fe-b308-9ebaf9cb5e70','kait_superheroic','2026-02-28 03:04:58',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('0fe27880-45c9-3487-a496-bde393a8d97d','_Vortical_','2026-03-08 18:05:04',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('1c7fd55a-11c4-4a17-8697-664e1b6ee832','kait_superheroic','2026-01-09 04:27:44',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('26bb2b10-8933-3a71-817a-6ae14619c9b9','RedBot16','2026-03-08 18:16:07',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('28efbc48-9d99-3639-aab0-e384bd4d5852','RedBot12','2026-03-08 18:15:50',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('403b93ea-17f6-391b-8323-dd5870fed261','RedBot4','2026-02-27 22:56:43',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('457e724e-8293-30cb-95ac-fbe930678ddc','RedBot5','2026-02-27 22:56:47',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('4df6b53d-c707-3e39-9a50-d52f3e95b99f','RedBot10','2026-03-08 18:15:41',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('588be630-9f2c-3815-af27-f7e40d06f4cf','RedBot9','2026-03-08 18:15:36',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('6d3bf17e-16f4-3eb6-9425-b5bb1d150201','xRedCrystalx','2026-02-27 02:27:21',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('6ff1da77-4f7b-3367-9c3c-b1dc07c7f634','RedBot8','2026-03-08 18:15:32',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('772fc13c-7ff9-39cd-b594-4f5213cf02d1','RedBot2','2026-02-27 22:56:34',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('7adf56b9-d9ad-32d1-92de-46398287d8ec','RedBot7','2026-03-08 18:15:27',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('7c2efb34-d989-3b58-baab-081dadd4daef','RedBot3','2026-02-27 22:56:38',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('94810692-74da-3f58-b371-f79434df7bc7','RedBot18','2026-03-08 18:16:16',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('9512bb93-17bc-33e9-af0d-8869a0d7071c','RedBot17','2026-03-08 18:16:12',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('b79fc6c9-225a-3d2c-99d5-244f7cbe3371','RedBot15','2026-03-08 18:16:03',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('b96e562e-eb2d-352b-b982-b520a8feb8b5','RedBot1','2026-02-27 22:54:12',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('c787d637-1ccf-38c4-9d8c-376234889993','RedBot11','2026-03-08 18:15:45',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}'),
('df861ab4-4409-3ff3-ac2c-5a59eb4a315e','RedBot13','2026-03-08 18:15:54',0,NULL,'{\"team_chat_talking\":false,\"ally_chat_talking\":false,\"team_chat_spying\":false,\"invitations_status\":true}');
/*!40000 ALTER TABLE `ultimateteams_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-11 23:50:42
