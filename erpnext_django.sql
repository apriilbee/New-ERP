-- MySQL dump 10.16  Distrib 10.1.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: erpnext_django
-- ------------------------------------------------------
-- Server version	10.1.14-MariaDB-1~xenial

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_auth_user_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` (`email_address_id`),
  CONSTRAINT `account_ema_email_address_id_5b7f8c58_fk_account_emailaddress_id` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(22,'Can add site',8,'add_site'),(23,'Can change site',8,'change_site'),(24,'Can delete site',8,'delete_site'),(25,'Can add email address',9,'add_emailaddress'),(26,'Can change email address',9,'change_emailaddress'),(27,'Can delete email address',9,'delete_emailaddress'),(28,'Can add email confirmation',10,'add_emailconfirmation'),(29,'Can change email confirmation',10,'change_emailconfirmation'),(30,'Can delete email confirmation',10,'delete_emailconfirmation'),(31,'Can add social application',11,'add_socialapp'),(32,'Can change social application',11,'change_socialapp'),(33,'Can delete social application',11,'delete_socialapp'),(34,'Can add social account',12,'add_socialaccount'),(35,'Can change social account',12,'change_socialaccount'),(36,'Can delete social account',12,'delete_socialaccount'),(37,'Can add social application token',13,'add_socialtoken'),(38,'Can change social application token',13,'change_socialtoken'),(39,'Can delete social application token',13,'delete_socialtoken'),(40,'Can add account emailaddress',14,'add_accountemailaddress'),(41,'Can change account emailaddress',14,'change_accountemailaddress'),(42,'Can delete account emailaddress',14,'delete_accountemailaddress'),(43,'Can add account emailconfirmation',15,'add_accountemailconfirmation'),(44,'Can change account emailconfirmation',15,'change_accountemailconfirmation'),(45,'Can delete account emailconfirmation',15,'delete_accountemailconfirmation'),(46,'Can add auth group',16,'add_authgroup'),(47,'Can change auth group',16,'change_authgroup'),(48,'Can delete auth group',16,'delete_authgroup'),(49,'Can add auth group permissions',17,'add_authgrouppermissions'),(50,'Can change auth group permissions',17,'change_authgrouppermissions'),(51,'Can delete auth group permissions',17,'delete_authgrouppermissions'),(52,'Can add auth permission',18,'add_authpermission'),(53,'Can change auth permission',18,'change_authpermission'),(54,'Can delete auth permission',18,'delete_authpermission'),(55,'Can add auth user',19,'add_authuser'),(56,'Can change auth user',19,'change_authuser'),(57,'Can delete auth user',19,'delete_authuser'),(58,'Can add auth user groups',20,'add_authusergroups'),(59,'Can change auth user groups',20,'change_authusergroups'),(60,'Can delete auth user groups',20,'delete_authusergroups'),(61,'Can add auth user user permissions',21,'add_authuseruserpermissions'),(62,'Can change auth user user permissions',21,'change_authuseruserpermissions'),(63,'Can delete auth user user permissions',21,'delete_authuseruserpermissions'),(64,'Can add django admin log',22,'add_djangoadminlog'),(65,'Can change django admin log',22,'change_djangoadminlog'),(66,'Can delete django admin log',22,'delete_djangoadminlog'),(67,'Can add django content type',23,'add_djangocontenttype'),(68,'Can change django content type',23,'change_djangocontenttype'),(69,'Can delete django content type',23,'delete_djangocontenttype'),(70,'Can add django migrations',24,'add_djangomigrations'),(71,'Can change django migrations',24,'change_djangomigrations'),(72,'Can delete django migrations',24,'delete_djangomigrations'),(73,'Can add django session',25,'add_djangosession'),(74,'Can change django session',25,'change_djangosession'),(75,'Can delete django session',25,'delete_djangosession'),(76,'Can add django site',26,'add_djangosite'),(77,'Can change django site',26,'change_djangosite'),(78,'Can delete django site',26,'delete_djangosite'),(79,'Can add socialaccount socialaccount',27,'add_socialaccountsocialaccount'),(80,'Can change socialaccount socialaccount',27,'change_socialaccountsocialaccount'),(81,'Can delete socialaccount socialaccount',27,'delete_socialaccountsocialaccount'),(82,'Can add socialaccount socialapp',28,'add_socialaccountsocialapp'),(83,'Can change socialaccount socialapp',28,'change_socialaccountsocialapp'),(84,'Can delete socialaccount socialapp',28,'delete_socialaccountsocialapp'),(85,'Can add socialaccount socialapp sites',29,'add_socialaccountsocialappsites'),(86,'Can change socialaccount socialapp sites',29,'change_socialaccountsocialappsites'),(87,'Can delete socialaccount socialapp sites',29,'delete_socialaccountsocialappsites'),(88,'Can add socialaccount socialtoken',30,'add_socialaccountsocialtoken'),(89,'Can change socialaccount socialtoken',30,'change_socialaccountsocialtoken'),(90,'Can delete socialaccount socialtoken',30,'delete_socialaccountsocialtoken'),(91,'Can add web app erp user',31,'add_webapperpuser'),(92,'Can change web app erp user',31,'change_webapperpuser'),(93,'Can delete web app erp user',31,'delete_webapperpuser'),(94,'Can add user_ sites',32,'add_user_sites'),(95,'Can change user_ sites',32,'change_user_sites'),(96,'Can delete user_ sites',32,'delete_user_sites');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (14,'pbkdf2_sha256$24000$Z5qYKztHEnbw$yFKNjJ6uXNBwP6B81IdXDkgi9CLjgYxJaIskz96TIsk=','2016-07-08 06:20:58.080010',1,'Administrator','','','',1,1,'2016-07-08 06:09:21.449855');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (29,'2016-07-08 06:10:17.558306','2','User_Sites object',3,'',32,14);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'account','emailaddress'),(10,'account','emailconfirmation'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'sites','site'),(12,'socialaccount','socialaccount'),(11,'socialaccount','socialapp'),(13,'socialaccount','socialtoken'),(14,'web_app','accountemailaddress'),(15,'web_app','accountemailconfirmation'),(16,'web_app','authgroup'),(17,'web_app','authgrouppermissions'),(18,'web_app','authpermission'),(19,'web_app','authuser'),(20,'web_app','authusergroups'),(21,'web_app','authuseruserpermissions'),(22,'web_app','djangoadminlog'),(23,'web_app','djangocontenttype'),(24,'web_app','djangomigrations'),(25,'web_app','djangosession'),(26,'web_app','djangosite'),(27,'web_app','socialaccountsocialaccount'),(28,'web_app','socialaccountsocialapp'),(29,'web_app','socialaccountsocialappsites'),(30,'web_app','socialaccountsocialtoken'),(32,'web_app','user_sites'),(31,'web_app','webapperpuser');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-06-30 18:45:19.605693'),(2,'auth','0001_initial','2016-06-30 18:45:27.432901'),(3,'admin','0001_initial','2016-06-30 18:45:29.151886'),(4,'admin','0002_logentry_remove_auto_add','2016-06-30 18:45:29.275965'),(5,'contenttypes','0002_remove_content_type_name','2016-06-30 18:45:30.361800'),(6,'auth','0002_alter_permission_name_max_length','2016-06-30 18:45:31.024046'),(7,'auth','0003_alter_user_email_max_length','2016-06-30 18:45:31.922033'),(8,'auth','0004_alter_user_username_opts','2016-06-30 18:45:31.982742'),(9,'auth','0005_alter_user_last_login_null','2016-06-30 18:45:32.580720'),(10,'auth','0006_require_contenttypes_0002','2016-06-30 18:45:32.636798'),(11,'auth','0007_alter_validators_add_error_messages','2016-06-30 18:45:32.702037'),(12,'sessions','0001_initial','2016-06-30 18:45:33.229770'),(13,'web_app','0001_initial','2016-06-30 18:45:33.525102'),(14,'web_app','0002_auto_20160630_1802','2016-06-30 18:45:33.851979'),(15,'web_app','0003_erp_user_user','2016-06-30 18:54:26.463962'),(16,'web_app','0004_remove_erp_user_user','2016-06-30 18:54:26.969437'),(17,'web_app','0005_delete_erp_user','2016-06-30 18:54:27.147880'),(18,'web_app','0006_erp_user','2016-06-30 18:59:43.671183'),(19,'web_app','0007_erp_user_email','2016-06-30 19:15:00.296175'),(20,'account','0001_initial','2016-07-01 02:09:41.040104'),(21,'account','0002_email_max_length','2016-07-01 02:09:41.847437'),(22,'sites','0001_initial','2016-07-01 02:09:42.261727'),(23,'sites','0002_alter_domain_unique','2016-07-01 02:09:42.496645'),(24,'socialaccount','0001_initial','2016-07-01 02:09:47.978083'),(25,'socialaccount','0002_token_max_lengths','2016-07-01 02:09:51.114092'),(26,'socialaccount','0003_extra_data_default_dict','2016-07-01 02:09:51.197468'),(27,'web_app','0008_auto_20160706_1045','2016-07-06 10:45:57.823975'),(28,'web_app','0008_auto_20160707_1137','2016-07-07 18:35:43.316740'),(29,'web_app','0009_auto_20160707_1334','2016-07-07 18:35:43.427900'),(30,'web_app','0010_user_sites','2016-07-07 18:35:43.472463'),(31,'web_app','0011_auto_20160707_1828','2016-07-07 18:35:43.517207'),(32,'web_app','0012_auto_20160707_1832','2016-07-07 18:35:43.584122'),(33,'web_app','0013_auto_20160707_1834','2016-07-07 18:35:43.684262');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('37ebb24kmdhm5cs9eht7dx1sz7vjr3px','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-22 06:01:29.920813'),('3qr2d1am747x1skobpc14hvsf3fkuwqj','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-18 08:56:16.246917'),('5oyjm7a4zf99an6dzfzyrimw3330qct6','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-20 10:50:17.686866'),('7a5chmfjz22fmao409c7jfb7gogom7tw','Y2E5YzRjNjhhNDk1ZDA3NDBhZDUwMDUwN2ZhMzgwNmZmZWM4N2Y3NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjY1MTMzYmIxYzYyYjQ0MTY3YTI3NDc1ZGY0NTZlNmU1ODkzYjZmOTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-07-21 13:36:04.300862'),('8x92vrp0l4hjdz2b4rbsnt93p0iq1zmm','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-21 19:02:38.363838'),('9zer0j5yhsklmo2d1dwr87z5oxbj6cr4','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-22 03:21:47.777830'),('a2lsqgic5dl8ma2vh1357d055ojgwopk','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-19 02:11:27.870093'),('cpdgp92dmta3bb8zopjj1hz08nb812ab','NzljOGM2ZjRlZjRlMTQzZTU3NGIyZDVkMGI0NGY1ZWNmZTliM2RiODp7Il9hdXRoX3VzZXJfaGFzaCI6IjA1NWNkZmVmZTY1YWQ1OTUxZjIxYjY4ZTRkZmFkN2VlYmI2OGNjZDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxNCJ9','2016-07-22 06:20:58.125902'),('dawhz5zotl01xoab2cuw9pbp5llq8sot','NGVkMzM5MzI1Y2VhMTI0MGQyOTRjZTM2Y2U4ZjI0NGYxYWJlMjhjNzp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiYjU2YTIzZjhkNGYzMTZhZWQzZDY3NDA4ZGEzM2FiNWJiNTljYjMxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEwIn0=','2016-07-15 07:26:36.701394'),('gje4059b114wfwf0l6q43hxg6tmzd4mf','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-21 18:56:47.052691'),('mzwkzfx0d512aiad6xxntorw9am3ix78','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-21 05:32:43.684832'),('tpkinh8s4aii4479fse3gcbh6vv1yvjh','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-22 01:58:26.729418'),('vj5jfu4se1mpyefzy8kstslwp6jpaqcq','ZjNjZTBkMzBjMGI5M2I0MzZkMzA5MDRkNGU0NmU3YzUyMTZhOWRjMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiMGQ0NmRmYmM5ZmZkNTJjYjVkZGFiZmI0YTdkYWY5NzAyOGNhYWI1NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUifQ==','2016-07-18 08:40:11.273487'),('x1nbhdv6bgzz45umzxcejrcc7da279kj','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-21 07:56:17.987660'),('xfk3iuafg8zrikggoytproijl7rl6r6x','MzQ1ZGUwYTE1NTc5YTY0N2RkY2FmYzNjODU2ZGMzODBkZDkzOGMyMjp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9oYXNoIjoiZWNhM2E1NzI0MTgwMzgxMTIxYTNlMmYzMzQ5YWZiODI1YmFhZjdiYiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYifQ==','2016-07-19 02:06:43.910062');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com'),(2,'facebook.com','Facebook');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'facebook','Facebook','1637853046532533','265b14cbfef17a2ffaf47b7bc39a143b','');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccoun_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,2);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialacco_account_id_951f210e_fk_socialaccount_socialaccount_id` (`account_id`),
  CONSTRAINT `socialacco_account_id_951f210e_fk_socialaccount_socialaccount_id` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_soci_app_id_636a42d7_fk_socialaccount_socialapp_id` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_app_user_sites`
--

DROP TABLE IF EXISTS `web_app_user_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_app_user_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(254) NOT NULL,
  `site_name` varchar(254) NOT NULL,
  `db_name` varchar(254) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `site_name` (`site_name`),
  UNIQUE KEY `db_name` (`db_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_app_user_sites`
--

LOCK TABLES `web_app_user_sites` WRITE;
/*!40000 ALTER TABLE `web_app_user_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `web_app_user_sites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-08 14:21:14
