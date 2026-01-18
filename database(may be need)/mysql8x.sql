/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.10-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: sql_bfzy_tv
-- ------------------------------------------------------
-- Server version	10.11.10-MariaDB-log

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
-- Table structure for table `mac_actor`
--

DROP TABLE IF EXISTS `mac_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_actor` (
  `actor_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(6) unsigned NOT NULL DEFAULT 0,
  `type_id_1` smallint(6) unsigned NOT NULL DEFAULT 0,
  `actor_name` varchar(255) NOT NULL DEFAULT '',
  `actor_en` varchar(255) NOT NULL DEFAULT '',
  `actor_alias` varchar(255) NOT NULL DEFAULT '',
  `actor_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `actor_lock` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `actor_letter` char(1) NOT NULL DEFAULT '',
  `actor_sex` char(1) NOT NULL DEFAULT '',
  `actor_color` varchar(6) NOT NULL DEFAULT '',
  `actor_pic` varchar(1024) NOT NULL DEFAULT '',
  `actor_blurb` varchar(255) NOT NULL DEFAULT '',
  `actor_remarks` varchar(100) NOT NULL DEFAULT '',
  `actor_area` varchar(20) NOT NULL DEFAULT '',
  `actor_height` varchar(10) NOT NULL DEFAULT '',
  `actor_weight` varchar(10) NOT NULL DEFAULT '',
  `actor_birthday` varchar(10) NOT NULL DEFAULT '',
  `actor_birtharea` varchar(20) NOT NULL DEFAULT '',
  `actor_blood` varchar(10) NOT NULL DEFAULT '',
  `actor_starsign` varchar(10) NOT NULL DEFAULT '',
  `actor_school` varchar(20) NOT NULL DEFAULT '',
  `actor_works` varchar(255) NOT NULL DEFAULT '',
  `actor_tag` varchar(255) NOT NULL DEFAULT '',
  `actor_class` varchar(255) NOT NULL DEFAULT '',
  `actor_level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `actor_time` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_time_add` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_time_hits` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_time_make` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_hits` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `actor_hits_day` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `actor_hits_week` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `actor_hits_month` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `actor_score` decimal(3,1) unsigned NOT NULL DEFAULT 0.0,
  `actor_score_all` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `actor_score_num` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `actor_up` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `actor_down` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `actor_tpl` varchar(30) NOT NULL DEFAULT '',
  `actor_jumpurl` varchar(150) NOT NULL DEFAULT '',
  `actor_content` text NOT NULL,
  PRIMARY KEY (`actor_id`),
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `type_id_1` (`type_id_1`) USING BTREE,
  KEY `actor_name` (`actor_name`) USING BTREE,
  KEY `actor_en` (`actor_en`) USING BTREE,
  KEY `actor_letter` (`actor_letter`) USING BTREE,
  KEY `actor_level` (`actor_level`) USING BTREE,
  KEY `actor_time` (`actor_time`) USING BTREE,
  KEY `actor_time_add` (`actor_time_add`) USING BTREE,
  KEY `actor_sex` (`actor_sex`),
  KEY `actor_area` (`actor_area`),
  KEY `actor_up` (`actor_up`),
  KEY `actor_down` (`actor_down`),
  KEY `actor_tag` (`actor_tag`),
  KEY `actor_class` (`actor_class`),
  KEY `actor_score` (`actor_score`),
  KEY `actor_score_all` (`actor_score_all`),
  KEY `actor_score_num` (`actor_score_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_actor`
--

LOCK TABLES `mac_actor` WRITE;
/*!40000 ALTER TABLE `mac_actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_admin`
--

DROP TABLE IF EXISTS `mac_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_admin` (
  `admin_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(30) NOT NULL DEFAULT '',
  `admin_pwd` char(32) NOT NULL DEFAULT '',
  `admin_random` char(32) NOT NULL DEFAULT '',
  `admin_status` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `admin_auth` text NOT NULL,
  `admin_login_time` int(10) unsigned NOT NULL DEFAULT 0,
  `admin_login_ip` int(10) unsigned NOT NULL DEFAULT 0,
  `admin_login_num` int(10) unsigned NOT NULL DEFAULT 0,
  `admin_last_login_time` int(10) unsigned NOT NULL DEFAULT 0,
  `admin_last_login_ip` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`admin_id`),
  KEY `admin_name` (`admin_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_admin`
--

LOCK TABLES `mac_admin` WRITE;
/*!40000 ALTER TABLE `mac_admin` DISABLE KEYS */;
INSERT INTO `mac_admin` VALUES
(1,'admin','e10adc3949ba59abbe56e057f20f883e','d03d5a54cb6202bba156dc1d03275af9',1,'',1767837848,2364247210,24,1767837336,2364247210);
/*!40000 ALTER TABLE `mac_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_annex`
--

DROP TABLE IF EXISTS `mac_annex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_annex` (
  `annex_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `annex_time` int(10) unsigned NOT NULL DEFAULT 0,
  `annex_file` varchar(255) NOT NULL DEFAULT '',
  `annex_size` int(10) unsigned NOT NULL DEFAULT 0,
  `annex_type` varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY (`annex_id`),
  KEY `annex_time` (`annex_time`),
  KEY `annex_file` (`annex_file`),
  KEY `annex_type` (`annex_type`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_annex`
--

LOCK TABLES `mac_annex` WRITE;
/*!40000 ALTER TABLE `mac_annex` DISABLE KEYS */;
INSERT INTO `mac_annex` VALUES
(1,1762854913,'upload/mzadycms/20251111-1/b18fbda7570cc27206b63e4be714440c.jpg',154,'image'),
(2,1762854950,'upload/mzadycms/20251111-1/083142161088dd851135810a4146f483.jpg',154,'image'),
(3,1762856177,'upload/site/20251111-1/cb52c8190936628219f7e66aca139f2c.jpg',154,'image'),
(4,1762856180,'upload/site/20251111-1/0ef1a504c067e364f6f6183a6031662d.jpg',154,'image');
/*!40000 ALTER TABLE `mac_annex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_art`
--

DROP TABLE IF EXISTS `mac_art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_art` (
  `art_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(6) unsigned NOT NULL DEFAULT 0,
  `type_id_1` smallint(6) unsigned NOT NULL DEFAULT 0,
  `group_id` smallint(6) unsigned NOT NULL DEFAULT 0,
  `art_name` varchar(255) NOT NULL DEFAULT '',
  `art_sub` varchar(255) NOT NULL DEFAULT '',
  `art_en` varchar(255) NOT NULL DEFAULT '',
  `art_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `art_letter` char(1) NOT NULL DEFAULT '',
  `art_color` varchar(6) NOT NULL DEFAULT '',
  `art_from` varchar(30) NOT NULL DEFAULT '',
  `art_author` varchar(30) NOT NULL DEFAULT '',
  `art_tag` varchar(100) NOT NULL DEFAULT '',
  `art_class` varchar(255) NOT NULL DEFAULT '',
  `art_pic` varchar(1024) NOT NULL DEFAULT '',
  `art_pic_thumb` varchar(1024) NOT NULL DEFAULT '',
  `art_pic_slide` varchar(1024) NOT NULL DEFAULT '',
  `art_pic_screenshot` text DEFAULT NULL,
  `art_blurb` varchar(255) NOT NULL DEFAULT '',
  `art_remarks` varchar(100) NOT NULL DEFAULT '',
  `art_jumpurl` varchar(150) NOT NULL DEFAULT '',
  `art_tpl` varchar(30) NOT NULL DEFAULT '',
  `art_level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `art_lock` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `art_points` smallint(6) unsigned NOT NULL DEFAULT 0,
  `art_points_detail` smallint(6) unsigned NOT NULL DEFAULT 0,
  `art_up` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `art_down` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `art_hits` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `art_hits_day` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `art_hits_week` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `art_hits_month` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `art_time` int(10) unsigned NOT NULL DEFAULT 0,
  `art_time_add` int(10) unsigned NOT NULL DEFAULT 0,
  `art_time_hits` int(10) unsigned NOT NULL DEFAULT 0,
  `art_time_make` int(10) unsigned NOT NULL DEFAULT 0,
  `art_score` decimal(3,1) unsigned NOT NULL DEFAULT 0.0,
  `art_score_all` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `art_score_num` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `art_rel_art` varchar(255) NOT NULL DEFAULT '',
  `art_rel_vod` varchar(255) NOT NULL DEFAULT '',
  `art_pwd` varchar(10) NOT NULL DEFAULT '',
  `art_pwd_url` varchar(255) NOT NULL DEFAULT '',
  `art_title` mediumtext NOT NULL,
  `art_note` mediumtext NOT NULL,
  `art_content` mediumtext NOT NULL,
  PRIMARY KEY (`art_id`),
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `type_id_1` (`type_id_1`) USING BTREE,
  KEY `art_level` (`art_level`) USING BTREE,
  KEY `art_hits` (`art_hits`) USING BTREE,
  KEY `art_time` (`art_time`) USING BTREE,
  KEY `art_letter` (`art_letter`) USING BTREE,
  KEY `art_down` (`art_down`) USING BTREE,
  KEY `art_up` (`art_up`) USING BTREE,
  KEY `art_tag` (`art_tag`) USING BTREE,
  KEY `art_name` (`art_name`) USING BTREE,
  KEY `art_enn` (`art_en`) USING BTREE,
  KEY `art_hits_day` (`art_hits_day`) USING BTREE,
  KEY `art_hits_week` (`art_hits_week`) USING BTREE,
  KEY `art_hits_month` (`art_hits_month`) USING BTREE,
  KEY `art_time_add` (`art_time_add`) USING BTREE,
  KEY `art_time_make` (`art_time_make`) USING BTREE,
  KEY `art_lock` (`art_lock`),
  KEY `art_score` (`art_score`),
  KEY `art_score_all` (`art_score_all`),
  KEY `art_score_num` (`art_score_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_art`
--

LOCK TABLES `mac_art` WRITE;
/*!40000 ALTER TABLE `mac_art` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_card`
--

DROP TABLE IF EXISTS `mac_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_card` (
  `card_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `card_no` varchar(16) NOT NULL DEFAULT '',
  `card_pwd` varchar(8) NOT NULL DEFAULT '',
  `card_money` smallint(6) unsigned NOT NULL DEFAULT 0,
  `card_points` smallint(6) unsigned NOT NULL DEFAULT 0,
  `card_use_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `card_sale_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `card_add_time` int(10) unsigned NOT NULL DEFAULT 0,
  `card_use_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`card_id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `card_add_time` (`card_add_time`) USING BTREE,
  KEY `card_use_time` (`card_use_time`) USING BTREE,
  KEY `card_no` (`card_no`),
  KEY `card_pwd` (`card_pwd`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_card`
--

LOCK TABLES `mac_card` WRITE;
/*!40000 ALTER TABLE `mac_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_cash`
--

DROP TABLE IF EXISTS `mac_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_cash` (
  `cash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `cash_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `cash_points` smallint(6) unsigned NOT NULL DEFAULT 0,
  `cash_money` decimal(12,2) unsigned NOT NULL DEFAULT 0.00,
  `cash_bank_name` varchar(60) NOT NULL DEFAULT '',
  `cash_bank_no` varchar(30) NOT NULL DEFAULT '',
  `cash_payee_name` varchar(30) NOT NULL DEFAULT '',
  `cash_time` int(10) unsigned NOT NULL DEFAULT 0,
  `cash_time_audit` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`cash_id`),
  KEY `user_id` (`user_id`),
  KEY `cash_status` (`cash_status`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_cash`
--

LOCK TABLES `mac_cash` WRITE;
/*!40000 ALTER TABLE `mac_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_cj_content`
--

DROP TABLE IF EXISTS `mac_cj_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_cj_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT 0,
  `status` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_cj_content`
--

LOCK TABLES `mac_cj_content` WRITE;
/*!40000 ALTER TABLE `mac_cj_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_cj_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_cj_history`
--

DROP TABLE IF EXISTS `mac_cj_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_cj_history` (
  `md5` char(32) NOT NULL,
  PRIMARY KEY (`md5`),
  KEY `md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_cj_history`
--

LOCK TABLES `mac_cj_history` WRITE;
/*!40000 ALTER TABLE `mac_cj_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_cj_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_cj_node`
--

DROP TABLE IF EXISTS `mac_cj_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_cj_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT 0,
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `type_rule` char(100) NOT NULL,
  `type_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `customize_config` text NOT NULL,
  `program_config` text NOT NULL,
  `mid` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_cj_node`
--

LOCK TABLES `mac_cj_node` WRITE;
/*!40000 ALTER TABLE `mac_cj_node` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_cj_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_collect`
--

DROP TABLE IF EXISTS `mac_collect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_collect` (
  `collect_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `collect_name` varchar(30) NOT NULL DEFAULT '',
  `collect_url` varchar(255) NOT NULL DEFAULT '',
  `collect_type` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `collect_mid` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `collect_appid` varchar(30) NOT NULL DEFAULT '',
  `collect_appkey` varchar(30) NOT NULL DEFAULT '',
  `collect_param` varchar(100) NOT NULL DEFAULT '',
  `collect_filter` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `collect_filter_from` varchar(255) NOT NULL DEFAULT '',
  `collect_filter_year` varchar(255) NOT NULL DEFAULT '' COMMENT '采集时，过滤年份',
  `collect_opt` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `collect_sync_pic_opt` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '同步图片选项，0-跟随全局，1-开启，2-关闭',
  PRIMARY KEY (`collect_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_collect`
--

LOCK TABLES `mac_collect` WRITE;
/*!40000 ALTER TABLE `mac_collect` DISABLE KEYS */;
INSERT INTO `mac_collect` VALUES
(1,'暴风资源','https://bfzyapi.com/api.php/provide/vod/',2,1,'','','',0,'','',0,0),
(3,'xzy','https://hsckzy888.com/api.php/provide/vod/at/xml/',1,1,'','','',0,'','',0,0);
/*!40000 ALTER TABLE `mac_collect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_comment`
--

DROP TABLE IF EXISTS `mac_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment_mid` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `comment_rid` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_status` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `comment_name` varchar(60) NOT NULL DEFAULT '',
  `comment_ip` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_time` int(10) unsigned NOT NULL DEFAULT 0,
  `comment_content` varchar(255) NOT NULL DEFAULT '',
  `comment_up` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `comment_down` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `comment_reply` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `comment_report` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`comment_id`),
  KEY `comment_mid` (`comment_mid`) USING BTREE,
  KEY `comment_rid` (`comment_rid`) USING BTREE,
  KEY `comment_time` (`comment_time`) USING BTREE,
  KEY `comment_pid` (`comment_pid`),
  KEY `user_id` (`user_id`),
  KEY `comment_reply` (`comment_reply`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_comment`
--

LOCK TABLES `mac_comment` WRITE;
/*!40000 ALTER TABLE `mac_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_gbook`
--

DROP TABLE IF EXISTS `mac_gbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_gbook` (
  `gbook_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gbook_rid` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `gbook_status` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `gbook_name` varchar(60) NOT NULL DEFAULT '',
  `gbook_ip` int(10) unsigned NOT NULL DEFAULT 0,
  `gbook_time` int(10) unsigned NOT NULL DEFAULT 0,
  `gbook_reply_time` int(10) unsigned NOT NULL DEFAULT 0,
  `gbook_content` varchar(255) NOT NULL DEFAULT '',
  `gbook_reply` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`gbook_id`),
  KEY `gbook_rid` (`gbook_rid`) USING BTREE,
  KEY `gbook_time` (`gbook_time`) USING BTREE,
  KEY `gbook_reply_time` (`gbook_reply_time`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `gbook_reply` (`gbook_reply`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_gbook`
--

LOCK TABLES `mac_gbook` WRITE;
/*!40000 ALTER TABLE `mac_gbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_gbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_group`
--

DROP TABLE IF EXISTS `mac_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_group` (
  `group_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(30) NOT NULL DEFAULT '',
  `group_status` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `group_type` text NOT NULL,
  `group_popedom` text NOT NULL,
  `group_points_day` smallint(6) unsigned NOT NULL DEFAULT 0,
  `group_points_week` smallint(6) NOT NULL DEFAULT 0,
  `group_points_month` smallint(6) unsigned NOT NULL DEFAULT 0,
  `group_points_year` smallint(6) unsigned NOT NULL DEFAULT 0,
  `group_points_free` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`),
  KEY `group_status` (`group_status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_group`
--

LOCK TABLES `mac_group` WRITE;
/*!40000 ALTER TABLE `mac_group` DISABLE KEYS */;
INSERT INTO `mac_group` VALUES
(1,'游客',1,',1,6,7,8,9,10,11,12,2,13,14,15,16,3,4,5,17,','{\"1\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"6\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"7\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"8\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"9\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"10\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"11\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"12\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"13\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"14\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"15\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"16\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"3\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"4\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"5\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"17\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"}}',0,0,0,0,0),
(2,'默认会员',1,',1,6,7,8,9,10,11,12,2,13,14,15,16,3,4,5,17,','{\"1\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"6\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"7\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"8\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"9\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"10\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"11\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"12\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"13\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"14\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"15\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"16\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"3\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"4\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"5\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"17\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"}}',0,0,0,0,0),
(3,'VIP会员',1,',1,6,7,8,9,10,11,12,2,13,14,15,16,3,4,5,17,','{\"1\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"6\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"7\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"8\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"9\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"10\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"11\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"12\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"2\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"13\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"14\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"15\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"16\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"3\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"4\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"5\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"},\"17\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\"}}',10,70,300,3600,0);
/*!40000 ALTER TABLE `mac_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_link`
--

DROP TABLE IF EXISTS `mac_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_link` (
  `link_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `link_type` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `link_name` varchar(60) NOT NULL DEFAULT '',
  `link_sort` smallint(6) NOT NULL DEFAULT 0,
  `link_add_time` int(10) unsigned NOT NULL DEFAULT 0,
  `link_time` int(10) unsigned NOT NULL DEFAULT 0,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_logo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_sort` (`link_sort`) USING BTREE,
  KEY `link_type` (`link_type`) USING BTREE,
  KEY `link_add_time` (`link_add_time`),
  KEY `link_time` (`link_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_link`
--

LOCK TABLES `mac_link` WRITE;
/*!40000 ALTER TABLE `mac_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_manga`
--

DROP TABLE IF EXISTS `mac_manga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_manga` (
  `manga_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '漫画ID',
  `type_id` smallint(6) unsigned NOT NULL DEFAULT 0 COMMENT '主分类ID',
  `type_id_1` smallint(6) unsigned NOT NULL DEFAULT 0 COMMENT '副分类ID',
  `group_id` smallint(6) unsigned NOT NULL DEFAULT 0 COMMENT '会员组ID',
  `manga_name` varchar(255) NOT NULL DEFAULT '' COMMENT '漫画名称',
  `manga_sub` varchar(255) NOT NULL DEFAULT '' COMMENT '副标题',
  `manga_en` varchar(255) NOT NULL DEFAULT '' COMMENT '英文名',
  `manga_status` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '状态(0=锁定,1=正常)',
  `manga_letter` char(1) NOT NULL DEFAULT '' COMMENT '首字母',
  `manga_color` varchar(6) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `manga_from` varchar(30) NOT NULL DEFAULT '' COMMENT '来源',
  `manga_author` varchar(255) NOT NULL DEFAULT '' COMMENT '作者',
  `manga_tag` varchar(100) NOT NULL DEFAULT '' COMMENT '标签',
  `manga_class` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展分类',
  `manga_pic` varchar(1024) NOT NULL DEFAULT '' COMMENT '封面图',
  `manga_pic_thumb` varchar(1024) NOT NULL DEFAULT '' COMMENT '封面缩略图',
  `manga_pic_slide` varchar(1024) NOT NULL DEFAULT '' COMMENT '封面幻灯图',
  `manga_pic_screenshot` text DEFAULT NULL COMMENT '内容截图',
  `manga_blurb` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `manga_remarks` varchar(100) NOT NULL DEFAULT '' COMMENT '备注(例如：更新至xx话)',
  `manga_jumpurl` varchar(150) NOT NULL DEFAULT '' COMMENT '跳转URL',
  `manga_tpl` varchar(30) NOT NULL DEFAULT '' COMMENT '独立模板',
  `manga_level` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '推荐级别',
  `manga_lock` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '锁定状态(0=未锁,1=已锁)',
  `manga_points` smallint(6) unsigned NOT NULL DEFAULT 0 COMMENT '点播所需积分',
  `manga_points_detail` smallint(6) unsigned NOT NULL DEFAULT 0 COMMENT '每章所需积分',
  `manga_up` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '顶数',
  `manga_down` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '踩数',
  `manga_hits` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '总点击数',
  `manga_hits_day` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '日点击数',
  `manga_hits_week` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '周点击数',
  `manga_hits_month` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '月点击数',
  `manga_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '更新时间',
  `manga_time_add` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '添加时间',
  `manga_time_hits` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '点击时间',
  `manga_time_make` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '生成时间',
  `manga_score` decimal(3,1) unsigned NOT NULL DEFAULT 0.0 COMMENT '平均评分',
  `manga_score_all` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '总评分',
  `manga_score_num` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '评分次数',
  `manga_rel_manga` varchar(255) NOT NULL DEFAULT '' COMMENT '关联漫画',
  `manga_rel_vod` varchar(255) NOT NULL DEFAULT '' COMMENT '关联视频',
  `manga_pwd` varchar(10) NOT NULL DEFAULT '' COMMENT '访问密码',
  `manga_pwd_url` varchar(255) NOT NULL DEFAULT '' COMMENT '密码跳转URL',
  `manga_content` mediumtext DEFAULT NULL COMMENT '详细介绍',
  `manga_serial` varchar(20) NOT NULL DEFAULT '0' COMMENT '连载状态(文字)',
  `manga_total` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '总章节数',
  `manga_chapter_from` varchar(255) NOT NULL DEFAULT '' COMMENT '章节来源',
  `manga_chapter_url` mediumtext DEFAULT NULL COMMENT '章节URL列表',
  `manga_last_update_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '最后更新时间戳',
  `manga_age_rating` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '年龄分级(0=全年龄,1=12+,2=18+)',
  `manga_orientation` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '阅读方向(1=左到右,2=右到左,3=垂直)',
  `manga_is_vip` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否VIP(0=否,1=是)',
  `manga_copyright_info` varchar(255) NOT NULL DEFAULT '' COMMENT '版权信息',
  PRIMARY KEY (`manga_id`),
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `type_id_1` (`type_id_1`) USING BTREE,
  KEY `manga_level` (`manga_level`) USING BTREE,
  KEY `manga_hits` (`manga_hits`) USING BTREE,
  KEY `manga_time` (`manga_time`) USING BTREE,
  KEY `manga_letter` (`manga_letter`) USING BTREE,
  KEY `manga_down` (`manga_down`) USING BTREE,
  KEY `manga_up` (`manga_up`) USING BTREE,
  KEY `manga_tag` (`manga_tag`) USING BTREE,
  KEY `manga_name` (`manga_name`) USING BTREE,
  KEY `manga_en` (`manga_en`) USING BTREE,
  KEY `manga_hits_day` (`manga_hits_day`) USING BTREE,
  KEY `manga_hits_week` (`manga_hits_week`) USING BTREE,
  KEY `manga_hits_month` (`manga_hits_month`) USING BTREE,
  KEY `manga_time_add` (`manga_time_add`) USING BTREE,
  KEY `manga_time_make` (`manga_time_make`) USING BTREE,
  KEY `manga_lock` (`manga_lock`),
  KEY `manga_score` (`manga_score`),
  KEY `manga_score_all` (`manga_score_all`),
  KEY `manga_score_num` (`manga_score_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci COMMENT='漫画表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_manga`
--

LOCK TABLES `mac_manga` WRITE;
/*!40000 ALTER TABLE `mac_manga` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_manga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_msg`
--

DROP TABLE IF EXISTS `mac_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `msg_type` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `msg_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `msg_to` varchar(30) NOT NULL DEFAULT '',
  `msg_code` varchar(10) NOT NULL DEFAULT '',
  `msg_content` varchar(255) NOT NULL DEFAULT '',
  `msg_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`msg_id`),
  KEY `msg_code` (`msg_code`),
  KEY `msg_time` (`msg_time`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_msg`
--

LOCK TABLES `mac_msg` WRITE;
/*!40000 ALTER TABLE `mac_msg` DISABLE KEYS */;
INSERT INTO `mac_msg` VALUES
(1,1,3,0,'haixianmian128@gmail.com','451961','【】的会员您好，注册验证码为：451961，请在5分钟内完成验证。',1767426808),
(2,0,3,0,'haixianmian128@gmail.com','219156','【】的会员您好，注册验证码为：219156，请在5分钟内完成验证。',1767427045),
(3,0,3,0,'haixianmian128@gmail.com','558419','【】的会员您好，注册验证码为：558419，请在5分钟内完成验证。',1767838320),
(4,0,3,0,'2320010320@stu.lntu.edu.cn','979605','【】的会员您好，注册验证码为：979605，请在5分钟内完成验证。',1767838417);
/*!40000 ALTER TABLE `mac_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_order`
--

DROP TABLE IF EXISTS `mac_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_order` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `order_code` varchar(30) NOT NULL DEFAULT '',
  `order_price` decimal(12,2) unsigned NOT NULL DEFAULT 0.00,
  `order_time` int(10) unsigned NOT NULL DEFAULT 0,
  `order_points` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `order_pay_type` varchar(10) NOT NULL DEFAULT '',
  `order_pay_time` int(10) unsigned NOT NULL DEFAULT 0,
  `order_remarks` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`order_id`),
  KEY `order_code` (`order_code`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `order_time` (`order_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_order`
--

LOCK TABLES `mac_order` WRITE;
/*!40000 ALTER TABLE `mac_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_plog`
--

DROP TABLE IF EXISTS `mac_plog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_plog` (
  `plog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `user_id_1` int(10) NOT NULL DEFAULT 0,
  `plog_type` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `plog_points` smallint(6) unsigned NOT NULL DEFAULT 0,
  `plog_time` int(10) unsigned NOT NULL DEFAULT 0,
  `plog_remarks` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`plog_id`),
  KEY `user_id` (`user_id`),
  KEY `plog_type` (`plog_type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_plog`
--

LOCK TABLES `mac_plog` WRITE;
/*!40000 ALTER TABLE `mac_plog` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_plog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_role`
--

DROP TABLE IF EXISTS `mac_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_rid` int(10) unsigned NOT NULL DEFAULT 0,
  `role_name` varchar(255) NOT NULL DEFAULT '',
  `role_en` varchar(255) NOT NULL DEFAULT '',
  `role_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `role_lock` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `role_letter` char(1) NOT NULL DEFAULT '',
  `role_color` varchar(6) NOT NULL DEFAULT '',
  `role_actor` varchar(255) NOT NULL DEFAULT '',
  `role_remarks` varchar(100) NOT NULL DEFAULT '',
  `role_pic` varchar(1024) NOT NULL DEFAULT '',
  `role_sort` smallint(6) unsigned NOT NULL DEFAULT 0,
  `role_level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `role_time` int(10) unsigned NOT NULL DEFAULT 0,
  `role_time_add` int(10) unsigned NOT NULL DEFAULT 0,
  `role_time_hits` int(10) unsigned NOT NULL DEFAULT 0,
  `role_time_make` int(10) unsigned NOT NULL DEFAULT 0,
  `role_hits` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `role_hits_day` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `role_hits_week` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `role_hits_month` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `role_score` decimal(3,1) unsigned NOT NULL DEFAULT 0.0,
  `role_score_all` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `role_score_num` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `role_up` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `role_down` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `role_tpl` varchar(30) NOT NULL DEFAULT '',
  `role_jumpurl` varchar(150) NOT NULL DEFAULT '',
  `role_content` text NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `role_rid` (`role_rid`),
  KEY `role_name` (`role_name`),
  KEY `role_en` (`role_en`),
  KEY `role_letter` (`role_letter`),
  KEY `role_actor` (`role_actor`),
  KEY `role_level` (`role_level`),
  KEY `role_time` (`role_time`),
  KEY `role_time_add` (`role_time_add`),
  KEY `role_score` (`role_score`),
  KEY `role_score_all` (`role_score_all`),
  KEY `role_score_num` (`role_score_num`),
  KEY `role_up` (`role_up`),
  KEY `role_down` (`role_down`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_role`
--

LOCK TABLES `mac_role` WRITE;
/*!40000 ALTER TABLE `mac_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_topic`
--

DROP TABLE IF EXISTS `mac_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_topic` (
  `topic_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(255) NOT NULL DEFAULT '',
  `topic_en` varchar(255) NOT NULL DEFAULT '',
  `topic_sub` varchar(255) NOT NULL DEFAULT '',
  `topic_status` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `topic_sort` smallint(6) unsigned NOT NULL DEFAULT 0,
  `topic_letter` char(1) NOT NULL DEFAULT '',
  `topic_color` varchar(6) NOT NULL DEFAULT '',
  `topic_tpl` varchar(30) NOT NULL DEFAULT '',
  `topic_type` varchar(255) NOT NULL DEFAULT '',
  `topic_pic` varchar(1024) NOT NULL DEFAULT '',
  `topic_pic_thumb` varchar(1024) NOT NULL DEFAULT '',
  `topic_pic_slide` varchar(1024) NOT NULL DEFAULT '',
  `topic_key` varchar(255) NOT NULL DEFAULT '',
  `topic_des` varchar(255) NOT NULL DEFAULT '',
  `topic_title` varchar(255) NOT NULL DEFAULT '',
  `topic_blurb` varchar(255) NOT NULL DEFAULT '',
  `topic_remarks` varchar(100) NOT NULL DEFAULT '',
  `topic_level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `topic_up` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `topic_down` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `topic_score` decimal(3,1) unsigned NOT NULL DEFAULT 0.0,
  `topic_score_all` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `topic_score_num` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `topic_hits` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `topic_hits_day` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `topic_hits_week` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `topic_hits_month` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `topic_time` int(10) unsigned NOT NULL DEFAULT 0,
  `topic_time_add` int(10) unsigned NOT NULL DEFAULT 0,
  `topic_time_hits` int(10) unsigned NOT NULL DEFAULT 0,
  `topic_time_make` int(10) unsigned NOT NULL DEFAULT 0,
  `topic_tag` varchar(255) NOT NULL DEFAULT '',
  `topic_rel_vod` text NOT NULL,
  `topic_rel_art` text NOT NULL,
  `topic_content` text NOT NULL,
  `topic_extend` text NOT NULL,
  PRIMARY KEY (`topic_id`),
  KEY `topic_sort` (`topic_sort`) USING BTREE,
  KEY `topic_level` (`topic_level`) USING BTREE,
  KEY `topic_score` (`topic_score`) USING BTREE,
  KEY `topic_score_all` (`topic_score_all`) USING BTREE,
  KEY `topic_score_num` (`topic_score_num`) USING BTREE,
  KEY `topic_hits` (`topic_hits`) USING BTREE,
  KEY `topic_hits_day` (`topic_hits_day`) USING BTREE,
  KEY `topic_hits_week` (`topic_hits_week`) USING BTREE,
  KEY `topic_hits_month` (`topic_hits_month`) USING BTREE,
  KEY `topic_time_add` (`topic_time_add`) USING BTREE,
  KEY `topic_time` (`topic_time`) USING BTREE,
  KEY `topic_time_hits` (`topic_time_hits`) USING BTREE,
  KEY `topic_name` (`topic_name`),
  KEY `topic_en` (`topic_en`),
  KEY `topic_up` (`topic_up`),
  KEY `topic_down` (`topic_down`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_topic`
--

LOCK TABLES `mac_topic` WRITE;
/*!40000 ALTER TABLE `mac_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_type`
--

DROP TABLE IF EXISTS `mac_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_type` (
  `type_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(60) NOT NULL DEFAULT '',
  `type_name_nl` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name nl',
  `type_name_pl` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name pl',
  `type_name_fil` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name fil',
  `type_name_ms` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name ms',
  `type_name_hi` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name hi',
  `type_name_tr` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name tr',
  `type_name_it` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name it',
  `type_name_ar` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name ar',
  `type_name_id` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name id',
  `type_name_vi` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name vi',
  `type_name_th` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name th',
  `type_name_pt` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name pt',
  `type_name_ru` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name ru',
  `type_name_de` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name de',
  `type_name_fr` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name fr',
  `type_name_es` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name es',
  `type_name_ko` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name ko',
  `type_name_ja` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name ja',
  `type_name_zh_tw` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name zh_tw',
  `type_name_en` varchar(60) NOT NULL DEFAULT '' COMMENT 'Name en',
  `type_en` varchar(60) NOT NULL DEFAULT '',
  `type_sort` smallint(6) unsigned NOT NULL DEFAULT 0,
  `type_mid` smallint(6) unsigned NOT NULL DEFAULT 1,
  `type_pid` smallint(6) unsigned NOT NULL DEFAULT 0,
  `type_status` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `type_tpl` varchar(30) NOT NULL DEFAULT '',
  `type_tpl_list` varchar(30) NOT NULL DEFAULT '',
  `type_tpl_detail` varchar(30) NOT NULL DEFAULT '',
  `type_tpl_play` varchar(30) NOT NULL DEFAULT '',
  `type_tpl_down` varchar(30) NOT NULL DEFAULT '',
  `type_key` varchar(255) NOT NULL DEFAULT '',
  `type_des` varchar(255) NOT NULL DEFAULT '',
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_union` varchar(255) NOT NULL DEFAULT '',
  `type_extend` text NOT NULL,
  `type_logo` varchar(255) NOT NULL DEFAULT '',
  `type_pic` varchar(1024) NOT NULL DEFAULT '',
  `type_jumpurl` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `type_sort` (`type_sort`) USING BTREE,
  KEY `type_pid` (`type_pid`) USING BTREE,
  KEY `type_name` (`type_name`),
  KEY `type_en` (`type_en`),
  KEY `type_mid` (`type_mid`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_type`
--

LOCK TABLES `mac_type` WRITE;
/*!40000 ALTER TABLE `mac_type` DISABLE KEYS */;
INSERT INTO `mac_type` VALUES
(1,'电影','','','','','','','','','','','','','','','','','','','','','dianying',1,1,0,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\\u559c\\u5267,\\u7231\\u60c5,\\u6050\\u6016,\\u52a8\\u4f5c,\\u79d1\\u5e7b,\\u5267\\u60c5,\\u6218\\u4e89,\\u8b66\\u532a,\\u72af\\u7f6a,\\u52a8\\u753b,\\u5947\\u5e7b,\\u6b66\\u4fa0,\\u5192\\u9669,\\u67aa\\u6218,\\u6050\\u6016,\\u60ac\\u7591,\\u60ca\\u609a,\\u7ecf\\u5178,\\u9752\\u6625,\\u6587\\u827a,\\u5fae\\u7535\\u5f71,\\u53e4\\u88c5,\\u5386\\u53f2,\\u8fd0\\u52a8,\\u519c\\u6751,\\u513f\\u7ae5,\\u7f51\\u7edc\\u7535\\u5f71\",\"area\":\"\\u5927\\u9646,\\u9999\\u6e2f,\\u53f0\\u6e7e,\\u7f8e\\u56fd,\\u6cd5\\u56fd,\\u82f1\\u56fd,\\u65e5\\u672c,\\u97e9\\u56fd,\\u5fb7\\u56fd,\\u6cf0\\u56fd,\\u5370\\u5ea6,\\u610f\\u5927\\u5229,\\u897f\\u73ed\\u7259,\\u52a0\\u62ff\\u5927,\\u5176\\u4ed6\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u6cd5\\u8bed,\\u5fb7\\u8bed,\\u5176\\u5b83\",\"year\":\"2018,2017,2016,2015,2014,2013,2012,2011,2010\",\"star\":\"\\u738b\\u5b9d\\u5f3a,\\u9ec4\\u6e24,\\u5468\\u8fc5,\\u5468\\u51ac\\u96e8,\\u8303\\u51b0\\u51b0,\\u9648\\u5b66\\u51ac,\\u9648\\u4f1f\\u9706,\\u90ed\\u91c7\\u6d01,\\u9093\\u8d85,\\u6210\\u9f99,\\u845b\\u4f18,\\u6797\\u6b63\\u82f1,\\u5f20\\u5bb6\\u8f89,\\u6881\\u671d\\u4f1f,\\u5f90\\u5ce5,\\u90d1\\u607a,\\u5434\\u5f66\\u7956,\\u5218\\u5fb7\\u534e,\\u5468\\u661f\\u9a70,\\u6797\\u9752\\u971e,\\u5468\\u6da6\\u53d1,\\u674e\\u8fde\\u6770,\\u7504\\u5b50\\u4e39,\\u53e4\\u5929\\u4e50,\\u6d2a\\u91d1\\u5b9d,\\u59da\\u6668,\\u502a\\u59ae,\\u9ec4\\u6653\\u660e,\\u5f6d\\u4e8e\\u664f,\\u6c64\\u552f,\\u9648\\u5c0f\\u6625\",\"director\":\"\\u51af\\u5c0f\\u521a,\\u5f20\\u827a\\u8c0b,\\u5434\\u5b87\\u68ee,\\u9648\\u51ef\\u6b4c,\\u5f90\\u514b,\\u738b\\u5bb6\\u536b,\\u59dc\\u6587,\\u5468\\u661f\\u9a70,\\u674e\\u5b89\",\"state\":\"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e\",\"version\":\"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248\"}','','',''),
(2,'电视剧','','','','','','','','','','','','','','','','','','','','','dianshiju',2,1,0,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\\u53e4\\u88c5,\\u6218\\u4e89,\\u9752\\u6625\\u5076\\u50cf,\\u559c\\u5267,\\u5bb6\\u5ead,\\u72af\\u7f6a,\\u52a8\\u4f5c,\\u5947\\u5e7b,\\u5267\\u60c5,\\u5386\\u53f2,\\u7ecf\\u5178,\\u4e61\\u6751,\\u60c5\\u666f,\\u5546\\u6218,\\u7f51\\u5267,\\u5176\\u4ed6\",\"area\":\"\\u5185\\u5730,\\u97e9\\u56fd,\\u9999\\u6e2f,\\u53f0\\u6e7e,\\u65e5\\u672c,\\u7f8e\\u56fd,\\u6cf0\\u56fd,\\u82f1\\u56fd,\\u65b0\\u52a0\\u5761,\\u5176\\u4ed6\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83\",\"year\":\"2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2006,2005,2004\",\"star\":\"\\u738b\\u5b9d\\u5f3a,\\u80e1\\u6b4c,\\u970d\\u5efa\\u534e,\\u8d75\\u4e3d\\u9896,\\u5218\\u6d9b,\\u5218\\u8bd7\\u8bd7,\\u9648\\u4f1f\\u9706,\\u5434\\u5947\\u9686,\\u9646\\u6bc5,\\u5510\\u5ae3,\\u5173\\u6653\\u5f64,\\u5b59\\u4fea,\\u674e\\u6613\\u5cf0,\\u5f20\\u7ff0,\\u674e\\u6668,\\u8303\\u51b0\\u51b0,\\u6797\\u5fc3\\u5982,\\u6587\\u7ae0,\\u9a6c\\u4f0a\\u740d,\\u4f5f\\u5927\\u4e3a,\\u5b59\\u7ea2\\u96f7,\\u9648\\u5efa\\u658c,\\u674e\\u5c0f\\u7490\",\"director\":\"\\u5f20\\u7eaa\\u4e2d,\\u674e\\u5c11\\u7ea2,\\u5218\\u6c5f,\\u5b54\\u7b19,\\u5f20\\u9ece,\\u5eb7\\u6d2a\\u96f7,\\u9ad8\\u5e0c\\u5e0c,\\u80e1\\u73ab,\\u8d75\\u5b9d\\u521a,\\u90d1\\u6653\\u9f99\",\"state\":\"\\u6b63\\u7247,\\u9884\\u544a\\u7247,\\u82b1\\u7d6e\",\"version\":\"\\u9ad8\\u6e05\\u7248,\\u5267\\u573a\\u7248,\\u62a2\\u5148\\u7248,OVA,TV,\\u5f71\\u9662\\u7248\"}','','',''),
(3,'综艺','','','','','','','','','','','','','','','','','','','','','fenlei3',3,1,0,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\\u9009\\u79c0,\\u60c5\\u611f,\\u8bbf\\u8c08,\\u64ad\\u62a5,\\u65c5\\u6e38,\\u97f3\\u4e50,\\u7f8e\\u98df,\\u7eaa\\u5b9e,\\u66f2\\u827a,\\u751f\\u6d3b,\\u6e38\\u620f\\u4e92\\u52a8,\\u8d22\\u7ecf,\\u6c42\\u804c\",\"area\":\"\\u5185\\u5730,\\u6e2f\\u53f0,\\u65e5\\u97e9,\\u6b27\\u7f8e\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83\",\"year\":\"2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004\",\"star\":\"\\u4f55\\u7085,\\u6c6a\\u6db5,\\u8c22\\u5a1c,\\u5468\\u7acb\\u6ce2,\\u9648\\u9c81\\u8c6b,\\u5b5f\\u975e,\\u674e\\u9759,\\u6731\\u519b,\\u6731\\u4e39,\\u534e\\u5c11,\\u90ed\\u5fb7\\u7eb2,\\u6768\\u6f9c\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(4,'动漫','','','','','','','','','','','','','','','','','','','','','dongman',4,1,0,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\\u60c5\\u611f,\\u79d1\\u5e7b,\\u70ed\\u8840,\\u63a8\\u7406,\\u641e\\u7b11,\\u5192\\u9669,\\u841d\\u8389,\\u6821\\u56ed,\\u52a8\\u4f5c,\\u673a\\u6218,\\u8fd0\\u52a8,\\u6218\\u4e89,\\u5c11\\u5e74,\\u5c11\\u5973,\\u793e\\u4f1a,\\u539f\\u521b,\\u4eb2\\u5b50,\\u76ca\\u667a,\\u52b1\\u5fd7,\\u5176\\u4ed6\",\"area\":\"\\u56fd\\u4ea7,\\u65e5\\u672c,\\u6b27\\u7f8e,\\u5176\\u4ed6\",\"lang\":\"\\u56fd\\u8bed,\\u82f1\\u8bed,\\u7ca4\\u8bed,\\u95fd\\u5357\\u8bed,\\u97e9\\u8bed,\\u65e5\\u8bed,\\u5176\\u5b83\",\"year\":\"2018,2017,2016,2015,2014,2013,2012,2011,2010,2009,2008,2007,2006,2005,2004\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"TV\\u7248,\\u7535\\u5f71\\u7248,OVA\\u7248,\\u771f\\u4eba\\u7248\"}','','',''),
(5,'电影解说','','','','','','','','','','','','','','','','','','','','','dianyingjieshuo',5,1,0,1,'type.html','show.html','detail.html','','','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(7,'电影片','','','','','','','','','','','','','','','','','','','','','dianyingpian',2,1,1,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(6,'动作片','','','','','','','','','','','','','','','','','','','','','dongzuopian',1,1,1,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(8,'爱情片','','','','','','','','','','','','','','','','','','','','','aiqingpian',3,1,1,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(9,'恐怖片','','','','','','','','','','','','','','','','','','','','','kongbupian',4,1,1,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(10,'战争片','','','','','','','','','','','','','','','','','','','','','zhanzhengpian',5,1,1,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(11,'喜剧片','','','','','','','','','','','','','','','','','','','','','xijupian',6,1,1,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(12,'纪录片','','','','','','','','','','','','','','','','','','','','','jilupina',7,1,1,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(13,'大陆剧','','','','','','','','','','','','','','','','','','','','','daluju',1,1,2,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(14,'港台剧','','','','','','','','','','','','','','','','','','','','','gangtaiju',2,1,2,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(15,'欧美剧','','','','','','','','','','','','','','','','','','','','','oumeiju',3,1,2,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(16,'日韩剧','','','','','','','','','','','','','','','','','','','','','rihanju',4,1,2,1,'type.html','show.html','detail.html','play.html','down.html','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','',''),
(17,'短剧','','','','','','','','','','','','','','','','','','','','','duanju',1,1,0,1,'type.html','show.html','detail.html','','','','','','','{\"class\":\"\",\"area\":\"\",\"lang\":\"\",\"year\":\"\",\"star\":\"\",\"director\":\"\",\"state\":\"\",\"version\":\"\"}','','','');
/*!40000 ALTER TABLE `mac_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_ulog`
--

DROP TABLE IF EXISTS `mac_ulog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_ulog` (
  `ulog_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT 0,
  `ulog_mid` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `ulog_type` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `ulog_rid` int(10) unsigned NOT NULL DEFAULT 0,
  `ulog_sid` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `ulog_nid` smallint(6) unsigned NOT NULL DEFAULT 0,
  `ulog_points` smallint(6) unsigned NOT NULL DEFAULT 0,
  `ulog_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`ulog_id`),
  KEY `user_id` (`user_id`),
  KEY `ulog_mid` (`ulog_mid`),
  KEY `ulog_type` (`ulog_type`),
  KEY `ulog_rid` (`ulog_rid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_ulog`
--

LOCK TABLES `mac_ulog` WRITE;
/*!40000 ALTER TABLE `mac_ulog` DISABLE KEYS */;
INSERT INTO `mac_ulog` VALUES
(1,1,1,4,87556,1,1,0,1767422669),
(2,1,1,4,87578,1,1,0,1767422970),
(3,2,1,4,87943,1,1,0,1767505821),
(4,2,1,4,87942,1,1,0,1767504793);
/*!40000 ALTER TABLE `mac_ulog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_user`
--

DROP TABLE IF EXISTS `mac_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '会员组ID,多个用逗号分隔',
  `user_name` varchar(30) NOT NULL DEFAULT '',
  `user_pwd` varchar(32) NOT NULL DEFAULT '',
  `user_nick_name` varchar(30) NOT NULL DEFAULT '',
  `user_qq` varchar(16) NOT NULL DEFAULT '',
  `user_email` varchar(30) NOT NULL DEFAULT '',
  `user_phone` varchar(16) NOT NULL DEFAULT '',
  `user_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `user_portrait` varchar(100) NOT NULL DEFAULT '',
  `user_portrait_thumb` varchar(100) NOT NULL DEFAULT '',
  `user_openid_qq` varchar(40) NOT NULL DEFAULT '',
  `user_openid_weixin` varchar(40) NOT NULL DEFAULT '',
  `user_openid_google` varchar(50) DEFAULT '',
  `user_openid_facebook` varchar(50) DEFAULT '',
  `user_question` varchar(255) NOT NULL DEFAULT '',
  `user_answer` varchar(255) NOT NULL DEFAULT '',
  `user_points` int(10) unsigned NOT NULL DEFAULT 0,
  `user_points_froze` int(10) unsigned NOT NULL DEFAULT 0,
  `user_reg_time` int(10) unsigned NOT NULL DEFAULT 0,
  `user_reg_ip` int(10) unsigned NOT NULL DEFAULT 0,
  `user_login_time` int(10) unsigned NOT NULL DEFAULT 0,
  `user_login_ip` int(10) unsigned NOT NULL DEFAULT 0,
  `user_last_login_time` int(10) unsigned NOT NULL DEFAULT 0,
  `user_last_login_ip` int(10) unsigned NOT NULL DEFAULT 0,
  `user_login_num` smallint(6) unsigned NOT NULL DEFAULT 0,
  `user_extend` smallint(6) unsigned NOT NULL DEFAULT 0,
  `user_random` varchar(32) NOT NULL DEFAULT '',
  `user_end_time` int(10) unsigned NOT NULL DEFAULT 0,
  `user_pid` int(10) unsigned NOT NULL DEFAULT 0,
  `user_pid_2` int(10) unsigned NOT NULL DEFAULT 0,
  `user_pid_3` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`),
  KEY `type_id` (`group_id`) USING BTREE,
  KEY `user_name` (`user_name`),
  KEY `user_reg_time` (`user_reg_time`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_user`
--

LOCK TABLES `mac_user` WRITE;
/*!40000 ALTER TABLE `mac_user` DISABLE KEYS */;
INSERT INTO `mac_user` VALUES
(2,'1','haixianmian','5c715d7d2dcdaca48d341fb4a2ad676c','','','haixianmian128@gmail.com','',1,'','','','','','','','',30,0,1767427059,2366319419,1767427078,2366319419,1767427059,2366319419,2,0,'a07795fd0d153a4d3cb1be6c8333e6e7',3155760000,0,0,0),
(3,'2','user111','e10adc3949ba59abbe56e057f20f883e','','','2320010320@stu.lntu.edu.cn','',1,'','','','','','','','',30,0,1767838439,2364247210,1767838439,2364247210,0,0,1,0,'9582e24d89acf40f2f018eec691d07a1',0,0,0,0);
/*!40000 ALTER TABLE `mac_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_visit`
--

DROP TABLE IF EXISTS `mac_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_visit` (
  `visit_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT 0,
  `visit_ip` int(10) unsigned NOT NULL DEFAULT 0,
  `visit_ly` varchar(100) NOT NULL DEFAULT '',
  `visit_time` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`visit_id`),
  KEY `user_id` (`user_id`),
  KEY `visit_time` (`visit_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_visit`
--

LOCK TABLES `mac_visit` WRITE;
/*!40000 ALTER TABLE `mac_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_vod`
--

DROP TABLE IF EXISTS `mac_vod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_vod` (
  `vod_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(6) NOT NULL DEFAULT 0,
  `type_id_1` smallint(6) unsigned NOT NULL DEFAULT 0,
  `group_id` smallint(6) unsigned NOT NULL DEFAULT 0,
  `vod_name` varchar(255) NOT NULL DEFAULT '',
  `vod_name_nl` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name nl',
  `vod_name_pl` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name pl',
  `vod_name_fil` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name fil',
  `vod_name_ms` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name ms',
  `vod_name_hi` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name hi',
  `vod_name_tr` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name tr',
  `vod_name_it` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name it',
  `vod_name_ar` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name ar',
  `vod_name_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name id',
  `vod_name_vi` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name vi',
  `vod_name_th` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name th',
  `vod_name_pt` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name pt',
  `vod_name_ru` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name ru',
  `vod_name_de` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name de',
  `vod_name_fr` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name fr',
  `vod_name_es` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name es',
  `vod_name_ko` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name ko',
  `vod_name_ja` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name ja',
  `vod_name_zh_tw` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name zh_tw',
  `vod_name_en` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name en',
  `vod_sub` varchar(255) NOT NULL DEFAULT '',
  `vod_sub_nl` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub nl',
  `vod_sub_pl` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub pl',
  `vod_sub_fil` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub fil',
  `vod_sub_ms` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub ms',
  `vod_sub_hi` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub hi',
  `vod_sub_tr` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub tr',
  `vod_sub_it` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub it',
  `vod_sub_ar` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub ar',
  `vod_sub_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub id',
  `vod_sub_vi` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub vi',
  `vod_sub_th` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub th',
  `vod_sub_pt` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub pt',
  `vod_sub_ru` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub ru',
  `vod_sub_de` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub de',
  `vod_sub_fr` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub fr',
  `vod_sub_es` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub es',
  `vod_sub_ko` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub ko',
  `vod_sub_ja` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub ja',
  `vod_sub_zh_tw` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub zh_tw',
  `vod_sub_en` varchar(255) NOT NULL DEFAULT '' COMMENT 'Sub en',
  `vod_en` varchar(255) NOT NULL DEFAULT '',
  `vod_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `vod_letter` char(1) NOT NULL DEFAULT '',
  `vod_color` varchar(6) NOT NULL DEFAULT '',
  `vod_tag` varchar(100) NOT NULL DEFAULT '',
  `vod_class` varchar(255) NOT NULL DEFAULT '',
  `vod_pic` varchar(1024) NOT NULL DEFAULT '',
  `vod_pic_thumb` varchar(1024) NOT NULL DEFAULT '',
  `vod_pic_slide` varchar(1024) NOT NULL DEFAULT '',
  `vod_pic_screenshot` text DEFAULT NULL,
  `vod_actor` varchar(255) NOT NULL DEFAULT '',
  `vod_director` varchar(255) NOT NULL DEFAULT '',
  `vod_writer` varchar(100) NOT NULL DEFAULT '',
  `vod_behind` varchar(100) NOT NULL DEFAULT '',
  `vod_blurb` varchar(255) NOT NULL DEFAULT '',
  `vod_remarks` varchar(100) NOT NULL DEFAULT '',
  `vod_pubdate` varchar(100) NOT NULL DEFAULT '',
  `vod_total` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `vod_serial` varchar(20) NOT NULL DEFAULT '0',
  `vod_tv` varchar(30) NOT NULL DEFAULT '',
  `vod_weekday` varchar(30) NOT NULL DEFAULT '',
  `vod_area` varchar(20) NOT NULL DEFAULT '',
  `vod_lang` varchar(10) NOT NULL DEFAULT '',
  `vod_year` varchar(10) NOT NULL DEFAULT '',
  `vod_version` varchar(30) NOT NULL DEFAULT '',
  `vod_state` varchar(30) NOT NULL DEFAULT '',
  `vod_author` varchar(60) NOT NULL DEFAULT '',
  `vod_jumpurl` varchar(150) NOT NULL DEFAULT '',
  `vod_tpl` varchar(30) NOT NULL DEFAULT '',
  `vod_tpl_play` varchar(30) NOT NULL DEFAULT '',
  `vod_tpl_down` varchar(30) NOT NULL DEFAULT '',
  `vod_isend` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `vod_lock` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `vod_level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `vod_copyright` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `vod_points` smallint(6) unsigned NOT NULL DEFAULT 0,
  `vod_points_play` smallint(6) unsigned NOT NULL DEFAULT 0,
  `vod_points_down` smallint(6) unsigned NOT NULL DEFAULT 0,
  `vod_hits` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `vod_hits_day` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `vod_hits_week` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `vod_hits_month` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `vod_duration` varchar(10) NOT NULL DEFAULT '',
  `vod_up` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `vod_down` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `vod_score` decimal(3,1) unsigned NOT NULL DEFAULT 0.0,
  `vod_score_all` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `vod_score_num` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `vod_time` int(10) unsigned NOT NULL DEFAULT 0,
  `vod_time_add` int(10) unsigned NOT NULL DEFAULT 0,
  `vod_time_hits` int(10) unsigned NOT NULL DEFAULT 0,
  `vod_time_make` int(10) unsigned NOT NULL DEFAULT 0,
  `vod_trysee` smallint(6) unsigned NOT NULL DEFAULT 0,
  `vod_douban_id` int(10) unsigned NOT NULL DEFAULT 0,
  `vod_douban_score` decimal(3,1) unsigned NOT NULL DEFAULT 0.0,
  `vod_reurl` varchar(255) NOT NULL DEFAULT '',
  `vod_rel_vod` varchar(255) NOT NULL DEFAULT '',
  `vod_rel_art` varchar(255) NOT NULL DEFAULT '',
  `vod_pwd` varchar(10) NOT NULL DEFAULT '',
  `vod_pwd_url` varchar(255) NOT NULL DEFAULT '',
  `vod_pwd_play` varchar(10) NOT NULL DEFAULT '',
  `vod_pwd_play_url` varchar(255) NOT NULL DEFAULT '',
  `vod_pwd_down` varchar(10) NOT NULL DEFAULT '',
  `vod_pwd_down_url` varchar(255) NOT NULL DEFAULT '',
  `vod_content` mediumtext NOT NULL,
  `vod_content_nl` mediumtext DEFAULT NULL COMMENT 'Content nl',
  `vod_content_pl` mediumtext DEFAULT NULL COMMENT 'Content pl',
  `vod_content_fil` mediumtext DEFAULT NULL COMMENT 'Content fil',
  `vod_content_ms` mediumtext DEFAULT NULL COMMENT 'Content ms',
  `vod_content_hi` mediumtext DEFAULT NULL COMMENT 'Content hi',
  `vod_content_tr` mediumtext DEFAULT NULL COMMENT 'Content tr',
  `vod_content_it` mediumtext DEFAULT NULL COMMENT 'Content it',
  `vod_content_ar` mediumtext DEFAULT NULL COMMENT 'Content ar',
  `vod_content_id` mediumtext DEFAULT NULL COMMENT 'Content id',
  `vod_content_vi` mediumtext DEFAULT NULL COMMENT 'Content vi',
  `vod_content_th` mediumtext DEFAULT NULL COMMENT 'Content th',
  `vod_content_pt` mediumtext DEFAULT NULL COMMENT 'Content pt',
  `vod_content_ru` mediumtext DEFAULT NULL COMMENT 'Content ru',
  `vod_content_de` mediumtext DEFAULT NULL COMMENT 'Content de',
  `vod_content_fr` mediumtext DEFAULT NULL COMMENT 'Content fr',
  `vod_content_es` mediumtext DEFAULT NULL COMMENT 'Content es',
  `vod_content_ko` mediumtext DEFAULT NULL COMMENT 'Content ko',
  `vod_content_ja` mediumtext DEFAULT NULL COMMENT 'Content ja',
  `vod_content_zh_tw` mediumtext DEFAULT NULL COMMENT 'Content zh_tw',
  `vod_content_en` mediumtext DEFAULT NULL COMMENT 'Content en',
  `vod_play_from` varchar(255) NOT NULL DEFAULT '',
  `vod_play_server` varchar(255) NOT NULL DEFAULT '',
  `vod_play_note` varchar(255) NOT NULL DEFAULT '',
  `vod_play_url` mediumtext NOT NULL,
  `vod_down_from` varchar(255) NOT NULL DEFAULT '',
  `vod_down_server` varchar(255) NOT NULL DEFAULT '',
  `vod_down_note` varchar(255) NOT NULL DEFAULT '',
  `vod_down_url` mediumtext NOT NULL,
  `vod_plot` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `vod_plot_name` mediumtext NOT NULL,
  `vod_plot_detail` mediumtext NOT NULL,
  PRIMARY KEY (`vod_id`),
  KEY `type_id` (`type_id`) USING BTREE,
  KEY `type_id_1` (`type_id_1`) USING BTREE,
  KEY `vod_level` (`vod_level`) USING BTREE,
  KEY `vod_hits` (`vod_hits`) USING BTREE,
  KEY `vod_letter` (`vod_letter`) USING BTREE,
  KEY `vod_name` (`vod_name`) USING BTREE,
  KEY `vod_year` (`vod_year`) USING BTREE,
  KEY `vod_area` (`vod_area`) USING BTREE,
  KEY `vod_lang` (`vod_lang`) USING BTREE,
  KEY `vod_tag` (`vod_tag`) USING BTREE,
  KEY `vod_class` (`vod_class`) USING BTREE,
  KEY `vod_lock` (`vod_lock`) USING BTREE,
  KEY `vod_up` (`vod_up`) USING BTREE,
  KEY `vod_down` (`vod_down`) USING BTREE,
  KEY `vod_en` (`vod_en`) USING BTREE,
  KEY `vod_hits_day` (`vod_hits_day`) USING BTREE,
  KEY `vod_hits_week` (`vod_hits_week`) USING BTREE,
  KEY `vod_hits_month` (`vod_hits_month`) USING BTREE,
  KEY `vod_plot` (`vod_plot`) USING BTREE,
  KEY `vod_points_play` (`vod_points_play`) USING BTREE,
  KEY `vod_points_down` (`vod_points_down`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `vod_time_add` (`vod_time_add`) USING BTREE,
  KEY `vod_time` (`vod_time`) USING BTREE,
  KEY `vod_time_make` (`vod_time_make`) USING BTREE,
  KEY `vod_actor` (`vod_actor`) USING BTREE,
  KEY `vod_director` (`vod_director`) USING BTREE,
  KEY `vod_score_all` (`vod_score_all`) USING BTREE,
  KEY `vod_score_num` (`vod_score_num`) USING BTREE,
  KEY `vod_total` (`vod_total`) USING BTREE,
  KEY `vod_score` (`vod_score`) USING BTREE,
  KEY `vod_version` (`vod_version`),
  KEY `vod_state` (`vod_state`),
  KEY `vod_isend` (`vod_isend`)
) ENGINE=MyISAM AUTO_INCREMENT=87945 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_vod`
--

LOCK TABLES `mac_vod` WRITE;
/*!40000 ALTER TABLE `mac_vod` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_vod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_vod_search`
--

DROP TABLE IF EXISTS `mac_vod_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_vod_search` (
  `search_key` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT '搜索键（关键词md5）',
  `search_word` varchar(128) NOT NULL COMMENT '搜索关键词',
  `search_field` varchar(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT '搜索字段名（可有多个，用|分隔）',
  `search_hit_count` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '搜索命中次数',
  `search_last_hit_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '最近命中时间',
  `search_update_time` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '添加时间',
  `search_result_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '结果Id数量',
  `search_result_ids` mediumtext CHARACTER SET ascii COLLATE ascii_bin NOT NULL COMMENT '搜索结果Id列表，英文半角逗号分隔',
  PRIMARY KEY (`search_key`),
  KEY `search_field` (`search_field`),
  KEY `search_update_time` (`search_update_time`),
  KEY `search_hit_count` (`search_hit_count`),
  KEY `search_last_hit_time` (`search_last_hit_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='vod搜索缓存表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_vod_search`
--

LOCK TABLES `mac_vod_search` WRITE;
/*!40000 ALTER TABLE `mac_vod_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_vod_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_website`
--

DROP TABLE IF EXISTS `mac_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_website` (
  `website_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `type_id_1` smallint(5) unsigned NOT NULL DEFAULT 0,
  `website_name` varchar(60) NOT NULL DEFAULT '',
  `website_sub` varchar(255) NOT NULL DEFAULT '',
  `website_en` varchar(255) NOT NULL DEFAULT '',
  `website_status` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `website_letter` char(1) NOT NULL DEFAULT '',
  `website_color` varchar(6) NOT NULL DEFAULT '',
  `website_lock` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `website_sort` int(10) NOT NULL DEFAULT 0,
  `website_jumpurl` varchar(255) NOT NULL DEFAULT '',
  `website_pic` varchar(1024) NOT NULL DEFAULT '',
  `website_pic_screenshot` text DEFAULT NULL,
  `website_logo` varchar(255) NOT NULL DEFAULT '',
  `website_area` varchar(20) NOT NULL DEFAULT '',
  `website_lang` varchar(10) NOT NULL DEFAULT '',
  `website_level` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `website_time` int(10) unsigned NOT NULL DEFAULT 0,
  `website_time_add` int(10) unsigned NOT NULL DEFAULT 0,
  `website_time_hits` int(10) unsigned NOT NULL DEFAULT 0,
  `website_time_make` int(10) unsigned NOT NULL DEFAULT 0,
  `website_time_referer` int(10) unsigned NOT NULL DEFAULT 0,
  `website_hits` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_hits_day` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_hits_week` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_hits_month` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_score` decimal(3,1) unsigned NOT NULL DEFAULT 0.0,
  `website_score_all` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_score_num` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_up` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_down` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_referer` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_referer_day` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_referer_week` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_referer_month` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `website_tag` varchar(100) NOT NULL DEFAULT '',
  `website_class` varchar(255) NOT NULL DEFAULT '',
  `website_remarks` varchar(100) NOT NULL DEFAULT '',
  `website_tpl` varchar(30) NOT NULL DEFAULT '',
  `website_blurb` varchar(255) NOT NULL DEFAULT '',
  `website_content` mediumtext NOT NULL,
  PRIMARY KEY (`website_id`),
  KEY `type_id` (`type_id`),
  KEY `type_id_1` (`type_id_1`),
  KEY `website_name` (`website_name`),
  KEY `website_en` (`website_en`),
  KEY `website_letter` (`website_letter`),
  KEY `website_sort` (`website_sort`),
  KEY `website_lock` (`website_lock`),
  KEY `website_time` (`website_time`),
  KEY `website_time_add` (`website_time_add`),
  KEY `website_time_referer` (`website_time_referer`),
  KEY `website_hits` (`website_hits`),
  KEY `website_hits_day` (`website_hits_day`),
  KEY `website_hits_week` (`website_hits_week`),
  KEY `website_hits_month` (`website_hits_month`),
  KEY `website_time_make` (`website_time_make`),
  KEY `website_score` (`website_score`),
  KEY `website_score_all` (`website_score_all`),
  KEY `website_score_num` (`website_score_num`),
  KEY `website_up` (`website_up`),
  KEY `website_down` (`website_down`),
  KEY `website_level` (`website_level`),
  KEY `website_tag` (`website_tag`),
  KEY `website_class` (`website_class`),
  KEY `website_referer` (`website_referer`),
  KEY `website_referer_day` (`website_referer_day`),
  KEY `website_referer_week` (`website_referer_week`),
  KEY `website_referer_month` (`website_referer_month`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_website`
--

LOCK TABLES `mac_website` WRITE;
/*!40000 ALTER TABLE `mac_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sql_bfzy_tv'
--

--
-- Dumping routines for database 'sql_bfzy_tv'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-14  1:30:17
