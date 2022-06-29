-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_tapaton
-- ------------------------------------------------------
-- Server version	5.7.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Administrador'),(4,'Encargado'),(3,'Gerente'),(2,'Visitante');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(46,2,4),(48,2,8),(50,2,12),(52,2,16),(53,2,20),(54,2,24),(55,2,28),(45,2,32),(47,2,36),(49,2,40),(51,2,44),(56,3,17),(57,3,18),(58,3,19),(59,3,20),(60,3,21),(61,3,22),(62,3,23),(63,3,24),(64,3,25),(65,3,26),(66,3,27),(67,3,28),(68,3,29),(69,3,30),(70,3,31),(71,3,32),(72,3,33),(73,3,34),(74,3,35),(75,3,36),(76,3,37),(77,3,38),(78,3,39),(79,3,40),(80,3,41),(81,3,42),(82,3,43),(83,3,44),(97,4,4),(99,4,8),(101,4,12),(103,4,16),(104,4,20),(90,4,21),(105,4,24),(92,4,25),(106,4,28),(94,4,29),(96,4,32),(84,4,33),(98,4,36),(86,4,37),(100,4,40),(88,4,41),(102,4,44);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add equipo',7,'add_equipo'),(26,'Can change equipo',7,'change_equipo'),(27,'Can delete equipo',7,'delete_equipo'),(28,'Can view equipo',7,'view_equipo'),(29,'Can add aprendiz',8,'add_aprendiz'),(30,'Can change aprendiz',8,'change_aprendiz'),(31,'Can delete aprendiz',8,'delete_aprendiz'),(32,'Can view aprendiz',8,'view_aprendiz'),(33,'Can add fondo',9,'add_fondo'),(34,'Can change fondo',9,'change_fondo'),(35,'Can delete fondo',9,'delete_fondo'),(36,'Can view fondo',9,'view_fondo'),(37,'Can add tapa',10,'add_tapa'),(38,'Can change tapa',10,'change_tapa'),(39,'Can delete tapa',10,'delete_tapa'),(40,'Can view tapa',10,'view_tapa'),(41,'Can add detalle fondo',11,'add_detallefondo'),(42,'Can change detalle fondo',11,'change_detallefondo'),(43,'Can delete detalle fondo',11,'delete_detallefondo'),(44,'Can view detalle fondo',11,'view_detallefondo'),(45,'Can add backup',12,'add_backup'),(46,'Can change backup',12,'change_backup'),(47,'Can delete backup',12,'delete_backup'),(48,'Can view backup',12,'view_backup');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$VLSRWlbhwbHNNl51ZCSIfm$3NrZgqSIeVtRFLyopQADioAjx7oGU/5Rvcr2upWAZ4Q=','2022-06-17 11:58:02.326763',1,'admin','','','',1,1,'2022-04-22 12:20:56.247642'),(2,'pbkdf2_sha256$320000$hwVud4YXg6nPquNpS31U68$kW/APCaCGmNs5klNBTE7DdvP8nDihfqSEiHVfBexR/w=',NULL,0,'gerente','','','',0,1,'2022-05-23 18:30:43.000000'),(3,'pbkdf2_sha256$320000$XF65B6qBqjZ45D9zUQVevj$n67Mdaqs6RKEwRSajPE9o4eRaU+bqmsYzwgkImb5hU8=','2022-05-26 20:53:14.757606',0,'empleado','','','',0,1,'2022-05-23 18:31:01.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,2,3),(1,3,4);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contabilidad_detallefondo`
--

DROP TABLE IF EXISTS `contabilidad_detallefondo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contabilidad_detallefondo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` varchar(4) NOT NULL,
  `pagado` tinyint(1) NOT NULL,
  `equipo_id` bigint(20) DEFAULT NULL,
  `fondo_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contabilidad_detalle_equipo_id_49f76b39_fk_personal_` (`equipo_id`),
  KEY `contabilidad_detalle_fondo_id_0122d198_fk_contabili` (`fondo_id`),
  CONSTRAINT `contabilidad_detalle_equipo_id_49f76b39_fk_personal_` FOREIGN KEY (`equipo_id`) REFERENCES `personal_equipo` (`id`),
  CONSTRAINT `contabilidad_detalle_fondo_id_0122d198_fk_contabili` FOREIGN KEY (`fondo_id`) REFERENCES `contabilidad_fondo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contabilidad_detallefondo`
--

LOCK TABLES `contabilidad_detallefondo` WRITE;
/*!40000 ALTER TABLE `contabilidad_detallefondo` DISABLE KEYS */;
INSERT INTO `contabilidad_detallefondo` VALUES (2,'2500',1,3,2),(3,'2500',1,1,3),(4,'2500',1,2,4),(5,'2500',1,1,5),(6,'2500',1,3,6),(7,'2500',0,3,7),(8,'2500',0,3,8);
/*!40000 ALTER TABLE `contabilidad_detallefondo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contabilidad_fondo`
--

DROP TABLE IF EXISTS `contabilidad_fondo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contabilidad_fondo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contabilidad_fondo`
--

LOCK TABLES `contabilidad_fondo` WRITE;
/*!40000 ALTER TABLE `contabilidad_fondo` DISABLE KEYS */;
INSERT INTO `contabilidad_fondo` VALUES (2,'2022-04-08'),(3,'2022-04-22'),(4,'2022-05-16'),(5,'2022-05-16'),(6,'2022-05-27'),(7,'2022-06-03'),(8,'2022-06-10');
/*!40000 ALTER TABLE `contabilidad_fondo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contabilidad_tapa`
--

DROP TABLE IF EXISTS `contabilidad_tapa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contabilidad_tapa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `aprendiz_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contabilidad_tapa_aprendiz_id_96c06fbd_fk_personal_aprendiz_id` (`aprendiz_id`),
  CONSTRAINT `contabilidad_tapa_aprendiz_id_96c06fbd_fk_personal_aprendiz_id` FOREIGN KEY (`aprendiz_id`) REFERENCES `personal_aprendiz` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contabilidad_tapa`
--

LOCK TABLES `contabilidad_tapa` WRITE;
/*!40000 ALTER TABLE `contabilidad_tapa` DISABLE KEYS */;
INSERT INTO `contabilidad_tapa` VALUES (1,'2022-04-08',75,6),(2,'2022-04-08',30,9),(3,'2022-04-08',45,19),(4,'2022-04-08',30,12),(5,'2022-04-08',129,18),(6,'2022-04-08',15,25),(7,'2022-04-08',21,23),(8,'2022-04-08',105,20),(9,'2022-04-08',120,24),(10,'2022-04-08',31,22),(11,'2022-04-08',30,14),(12,'2022-04-08',45,5),(13,'2022-04-08',60,4),(14,'2022-04-08',60,11),(15,'2022-04-08',15,8),(16,'2022-04-08',15,15),(17,'2022-04-08',60,13),(19,'2022-04-08',180,2),(20,'2022-04-08',120,3),(21,'2022-04-08',75,10),(22,'2022-04-22',375,12),(23,'2022-04-22',300,18),(24,'2022-04-22',552,19),(25,'2022-04-22',45,9),(26,'2022-04-22',215,6),(27,'2022-04-22',30,17),(28,'2022-04-22',30,21),(29,'2022-05-20',120,20),(30,'2022-04-22',120,14),(31,'2022-04-22',120,5),(32,'2022-04-22',53,24),(33,'2022-04-22',110,10),(34,'2022-04-22',67,3),(35,'2022-04-22',65,7),(36,'2022-04-22',65,16),(37,'2022-04-22',150,2),(38,'2022-04-22',30,4),(39,'2022-04-22',105,13),(40,'2022-04-22',30,11),(41,'2022-04-22',30,15),(42,'2022-04-22',30,8),(43,'2022-04-29',31,25),(44,'2022-04-29',210,8),(45,'2022-04-29',15,12),(46,'2022-04-29',120,19),(47,'2022-04-29',109,17),(48,'2022-04-29',605,13),(49,'2022-04-29',150,16),(50,'2022-04-29',450,2),(51,'2022-04-29',110,24),(52,'2022-04-29',30,9),(53,'2022-04-29',30,3),(54,'2022-04-29',30,26),(55,'2022-04-29',224,18),(56,'2022-04-29',120,10),(57,'2022-04-29',555,20),(58,'2022-04-29',13,6),(59,'2022-04-29',100,7),(60,'2022-04-29',76,21),(61,'2022-04-29',126,15),(62,'2022-04-29',16,14),(63,'2022-04-29',388,5),(64,'2022-05-13',151,4),(65,'2022-05-13',31,15),(66,'2022-05-13',82,11),(67,'2022-05-13',271,8),(68,'2022-05-13',81,21),(69,'2022-05-13',70,9),(70,'2022-05-13',135,19),(71,'2022-05-13',190,6),(72,'2022-05-13',127,17),(73,'2022-05-16',500,3),(74,'2022-05-16',500,2),(75,'2022-05-16',100,10),(76,'2022-05-16',25,7),(77,'2022-05-16',28,16),(78,'2022-05-16',205,12),(79,'2022-05-16',607,18),(80,'2022-05-16',181,25),(81,'2022-05-16',118,14),(82,'2022-05-16',583,20),(83,'2022-05-20',50,3),(84,'2022-05-20',160,7),(85,'2022-05-20',158,12),(86,'2022-05-20',48,8),(87,'2022-05-20',20,11),(88,'2022-05-20',136,24),(89,'2022-05-20',270,2),(90,'2022-05-20',25,9),(91,'2022-05-20',282,20),(92,'2022-05-20',200,10),(93,'2022-05-20',80,26),(94,'2022-05-20',30,15),(95,'2022-05-20',291,13),(96,'2022-05-20',190,6),(97,'2022-05-20',390,18),(98,'2022-05-27',153,13),(99,'2022-05-27',16,26),(100,'2022-05-27',120,10),(101,'2022-05-27',168,21),(102,'2022-05-27',26,3),(103,'2022-05-27',364,15),(104,'2022-05-27',410,18),(105,'2022-05-27',203,8),(106,'2022-05-27',151,12),(107,'2022-05-27',341,4),(108,'2022-05-27',129,16),(109,'2022-05-27',119,6),(110,'2022-05-27',100,2),(111,'2022-05-27',127,19),(112,'2022-05-27',308,20),(113,'2022-05-27',18,22),(114,'2022-05-27',233,17),(115,'2022-05-27',207,5),(116,'2022-06-03',306,25),(117,'2022-06-03',1221,20),(118,'2022-06-03',45,9),(119,'2022-06-03',158,12),(120,'2022-06-03',400,18),(121,'2022-06-03',142,17),(122,'2022-06-03',150,8),(123,'2022-06-03',15,4),(124,'2022-06-03',31,11),(125,'2022-06-03',182,13),(126,'2022-06-03',16,3),(127,'2022-06-03',170,10),(128,'2022-06-03',51,14),(129,'2022-06-03',556,19),(130,'2022-06-03',30,2),(131,'2022-06-03',15,16),(132,'2022-06-03',6,7),(133,'2022-06-03',48,6),(134,'2022-06-03',265,5),(135,'2022-06-10',154,4),(136,'2022-06-10',280,11),(137,'2022-06-10',1510,2),(138,'2022-06-10',73,9),(139,'2022-06-10',61,8),(140,'2022-06-10',101,3),(141,'2022-06-10',266,19),(142,'2022-06-10',547,15),(143,'2022-06-10',215,17),(144,'2022-06-10',118,13),(145,'2022-06-10',575,18),(146,'2022-06-10',175,5),(147,'2022-06-10',86,7),(148,'2022-06-10',296,12),(149,'2022-06-10',215,10),(150,'2022-06-10',262,20),(151,'2022-06-10',3,22),(152,'2022-06-10',123,6),(153,'2022-06-17',100,10),(154,'2022-06-17',4,4),(155,'2022-06-17',14,22),(156,'2022-06-17',23,9),(157,'2022-06-17',16,7),(158,'2022-06-17',254,21),(159,'2022-06-17',119,17),(160,'2022-06-17',49,3),(161,'2022-06-17',60,8),(162,'2022-06-17',77,19),(163,'2022-06-17',343,12),(164,'2022-06-17',411,18),(165,'2022-06-17',346,2),(166,'2022-06-17',101,13),(167,'2022-06-17',783,6),(168,'2022-06-17',621,20),(169,'2022-06-17',1374,5);
/*!40000 ALTER TABLE `contabilidad_tapa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-04-22 18:41:11.572084','1','Administrador',1,'[{\"added\": {}}]',3,1),(2,'2022-04-22 18:41:45.972706','2','Visitante',1,'[{\"added\": {}}]',3,1),(3,'2022-05-23 18:21:40.231001','3','Gerente',1,'[{\"added\": {}}]',3,1),(4,'2022-05-23 18:27:56.150788','2','Visitante',2,'[]',3,1),(5,'2022-05-23 18:29:04.676022','4','Encargado',1,'[{\"added\": {}}]',3,1),(6,'2022-05-23 18:30:44.110658','2','gerente',1,'[{\"added\": {}}]',4,1),(7,'2022-05-23 18:31:02.053579','3','empleado',1,'[{\"added\": {}}]',4,1),(8,'2022-05-23 18:31:45.982926','3','empleado',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(9,'2022-05-23 18:31:56.278351','2','gerente',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(10,'2022-05-26 20:51:38.104501','4','Encargado',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'contabilidad','detallefondo'),(9,'contabilidad','fondo'),(10,'contabilidad','tapa'),(5,'contenttypes','contenttype'),(12,'gestion','backup'),(8,'personal','aprendiz'),(7,'personal','equipo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-04-22 12:03:41.776811'),(2,'auth','0001_initial','2022-04-22 12:03:49.859866'),(3,'admin','0001_initial','2022-04-22 12:03:51.651411'),(4,'admin','0002_logentry_remove_auto_add','2022-04-22 12:03:51.705778'),(5,'admin','0003_logentry_add_action_flag_choices','2022-04-22 12:03:51.748846'),(6,'contenttypes','0002_remove_content_type_name','2022-04-22 12:03:52.789542'),(7,'auth','0002_alter_permission_name_max_length','2022-04-22 12:03:52.909188'),(8,'auth','0003_alter_user_email_max_length','2022-04-22 12:03:53.026847'),(9,'auth','0004_alter_user_username_opts','2022-04-22 12:03:53.078965'),(10,'auth','0005_alter_user_last_login_null','2022-04-22 12:03:53.640720'),(11,'auth','0006_require_contenttypes_0002','2022-04-22 12:03:53.685953'),(12,'auth','0007_alter_validators_add_error_messages','2022-04-22 12:03:53.748965'),(13,'auth','0008_alter_user_username_max_length','2022-04-22 12:03:53.851578'),(14,'auth','0009_alter_user_last_name_max_length','2022-04-22 12:03:53.969603'),(15,'auth','0010_alter_group_name_max_length','2022-04-22 12:03:54.099983'),(16,'auth','0011_update_proxy_permissions','2022-04-22 12:03:54.149956'),(17,'auth','0012_alter_user_first_name_max_length','2022-04-22 12:03:54.264350'),(18,'personal','0001_initial','2022-04-22 12:03:55.788255'),(19,'contabilidad','0001_initial','2022-04-22 12:03:58.872789'),(20,'contabilidad','0002_rename_equipo_id_detallefondo_equipo_and_more','2022-04-22 12:04:05.297830'),(21,'contabilidad','0003_alter_tapa_cantidad_alter_tapa_fecha','2022-04-22 12:04:06.145584'),(22,'personal','0002_rename_equipo_id_aprendiz_equipo','2022-04-22 12:04:07.729024'),(23,'personal','0003_equipo_puntos_alter_equipo_nombre','2022-04-22 12:04:08.478763'),(24,'personal','0004_alter_equipo_puntos','2022-04-22 12:04:09.234015'),(25,'personal','0005_alter_equipo_puntos','2022-04-22 12:04:09.991523'),(26,'sessions','0001_initial','2022-04-22 12:04:10.515058'),(27,'contabilidad','0002_alter_detallefondo_options_alter_fondo_options_and_more','2022-05-23 20:31:33.613857'),(28,'personal','0002_alter_aprendiz_options_alter_equipo_options_and_more','2022-05-23 20:31:33.691739'),(29,'personal','0003_rename_activo_aprendiz_estado','2022-05-23 20:32:37.631858'),(30,'gestion','0001_initial','2022-06-03 20:22:37.203393'),(31,'gestion','0002_rename_uploadedfile_backup_archivo_and_more','2022-06-03 20:38:55.982004'),(32,'gestion','0003_alter_backup_archivo','2022-06-06 14:19:24.259617');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3xt0mjbpeiub8z3afffcd7rdp5mp2rwb','.eJxVjMsOwiAQRf-FtSEZoDxcuvcbCMwMUjWQlHZl_Hdt0oVu7znnvkRM21rjNniJM4mzAHH63XLCB7cd0D21W5fY27rMWe6KPOiQ1078vBzu30FNo35rg0RqQlQKwbMvSKEQOUWO0Fg2oSAnDYAZyHvNBQOT0t7YAtZNQbw_IHM5Cw:1nhyCy:B55_GLQjWGzasCyzrBGx40bItFa0CqCn5Zb6RAf-HU8','2022-05-06 18:40:44.289418'),('5b72nlydckvg84un6dkq16fvg7j3sxe2','.eJxVjMsOwiAQRf-FtSEZoDxcuvcbCMwMUjWQlHZl_Hdt0oVu7znnvkRM21rjNniJM4mzAHH63XLCB7cd0D21W5fY27rMWe6KPOiQ1078vBzu30FNo35rg0RqQlQKwbMvSKEQOUWO0Fg2oSAnDYAZyHvNBQOT0t7YAtZNQbw_IHM5Cw:1ntxpg:rOTyb0fw0YA16hDn5Zp7M2w1fQYfA1CBkyvENVRGOeg','2022-06-08 20:42:16.778516'),('9vd4jr9660sizeamp8ugwj9z29vlwib5','.eJxVjMsOwiAQRf-FtSEZoDxcuvcbCMwMUjWQlHZl_Hdt0oVu7znnvkRM21rjNniJM4mzAHH63XLCB7cd0D21W5fY27rMWe6KPOiQ1078vBzu30FNo35rg0RqQlQKwbMvSKEQOUWO0Fg2oSAnDYAZyHvNBQOT0t7YAtZNQbw_IHM5Cw:1nuekh:6Xsr9GSnYwduEKdSata_04L5luDOVnG0JMsaOnXDHgA','2022-06-10 18:31:59.959846'),('dai41nqw6c21v2nfgreqamd4mzduilyp','.eJxVjMsOwiAQRf-FtSEZoDxcuvcbCMwMUjWQlHZl_Hdt0oVu7znnvkRM21rjNniJM4mzAHH63XLCB7cd0D21W5fY27rMWe6KPOiQ1078vBzu30FNo35rg0RqQlQKwbMvSKEQOUWO0Fg2oSAnDYAZyHvNBQOT0t7YAtZNQbw_IHM5Cw:1nx7pu:fM-A7eNx3QJMQqsO1gkEi7iZHCju3egjOLWcy8zEiTo','2022-06-17 13:59:34.944693'),('gjow9vt83zbj9zsvo6otqwc1mghgodc5','.eJxVjMsOwiAQRf-FtSEZoDxcuvcbCMwMUjWQlHZl_Hdt0oVu7znnvkRM21rjNniJM4mzAHH63XLCB7cd0D21W5fY27rMWe6KPOiQ1078vBzu30FNo35rg0RqQlQKwbMvSKEQOUWO0Fg2oSAnDYAZyHvNBQOT0t7YAtZNQbw_IHM5Cw:1nx7J3:OD1rrLaRimrK4AfMowRIkIiF8jXBOnNFQm16dLfbM_w','2022-06-17 13:25:37.971781'),('obfbiy3cx5tyxdvpt6lqopobmxmp5hea','.eJxVjMsOwiAQRf-FtSEZoDxcuvcbCMwMUjWQlHZl_Hdt0oVu7znnvkRM21rjNniJM4mzAHH63XLCB7cd0D21W5fY27rMWe6KPOiQ1078vBzu30FNo35rg0RqQlQKwbMvSKEQOUWO0Fg2oSAnDYAZyHvNBQOT0t7YAtZNQbw_IHM5Cw:1nx6S1:JGyO1ZWIcVqw53_gAAMNyD5oaJkSatsdDygXRe7ENE0','2022-06-17 12:30:49.681831'),('rovw2klmu5328ymxjg5smtzdq1zjw6zg','.eJxVjMsOwiAQRf-FtSEZoDxcuvcbCMwMUjWQlHZl_Hdt0oVu7znnvkRM21rjNniJM4mzAHH63XLCB7cd0D21W5fY27rMWe6KPOiQ1078vBzu30FNo35rg0RqQlQKwbMvSKEQOUWO0Fg2oSAnDYAZyHvNBQOT0t7YAtZNQbw_IHM5Cw:1nuKXb:hwVtaOvQo_4_KgGho2It_ZxuY0UbOPXTTZfyzzC6uws','2022-06-09 20:57:07.439843'),('sjhzmyom4veiinpa6tlu8ooaub70feje','.eJxVjMsOwiAQRf-FtSEZoDxcuvcbCMwMUjWQlHZl_Hdt0oVu7znnvkRM21rjNniJM4mzAHH63XLCB7cd0D21W5fY27rMWe6KPOiQ1078vBzu30FNo35rg0RqQlQKwbMvSKEQOUWO0Fg2oSAnDYAZyHvNBQOT0t7YAtZNQbw_IHM5Cw:1nzeO2:wIu9wX-dAEQlV5aLwGSzByhnLVsksbu9243OoRjHE6U','2022-06-24 13:09:14.634884'),('xtrplodi22tx2z9xnb004omx9ogwkr81','.eJxVjMsOwiAQRf-FtSEZoDxcuvcbCMwMUjWQlHZl_Hdt0oVu7znnvkRM21rjNniJM4mzAHH63XLCB7cd0D21W5fY27rMWe6KPOiQ1078vBzu30FNo35rg0RqQlQKwbMvSKEQOUWO0Fg2oSAnDYAZyHvNBQOT0t7YAtZNQbw_IHM5Cw:1nwmnj:A9vuQfYUp0ojqbtjswLOgADpqqmliMe-hC0C0OGmIew','2022-06-16 15:31:55.342816'),('z7jsa5k7ctz15qymzlhi57nyj49a1uen','.eJxVjMsOwiAQRf-FtSG8y7h07zeQAQapGkhKuzL-uzbpQrf3nHNfLOC21rANWsKc2ZlpdvrdIqYHtR3kO7Zb56m3dZkj3xV-0MGvPdPzcrh_BxVH_dZk42RBFMAiAcl6JWMkcoBSgMkyxQkQcjE2Ze2UFgq8RycKmWItKfb-APRJOBY:1ntszo:V7wPU0dFYiqTgiyQj5mkx7yeiww9DOvIZcWh_jWtRB8','2022-06-08 15:32:24.528744'),('zw8dcqmzkf0je8u6zj64kyr75h1fuig3','.eJxVjMsOwiAQRf-FtSG8y7h07zeQAQapGkhKuzL-uzbpQrf3nHNfLOC21rANWsKc2ZlpdvrdIqYHtR3kO7Zb56m3dZkj3xV-0MGvPdPzcrh_BxVH_dZk42RBFMAiAcl6JWMkcoBSgMkyxQkQcjE2Ze2UFgq8RycKmWItKfb-APRJOBY:1ntEn2:YSUhzyRZLIc4P77gSAiRpCiUH_KWF4aY1SfSO5yIL9g','2022-06-06 20:36:32.191583'),('zy5nr94e7g11zdm92s1mclao56rsqhm7','.eJxVjMsOwiAQRf-FtSEZoDxcuvcbCMwMUjWQlHZl_Hdt0oVu7znnvkRM21rjNniJM4mzAHH63XLCB7cd0D21W5fY27rMWe6KPOiQ1078vBzu30FNo35rg0RqQlQKwbMvSKEQOUWO0Fg2oSAnDYAZyHvNBQOT0t7YAtZNQbw_IHM5Cw:1o2Aby:of38EaLVovpbGgVqTc-EyOcKc61aIIICoUlCNYuSqB8','2022-07-01 11:58:02.328757');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gestion_backup`
--

DROP TABLE IF EXISTS `gestion_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gestion_backup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gestion_backup`
--

LOCK TABLES `gestion_backup` WRITE;
/*!40000 ALTER TABLE `gestion_backup` DISABLE KEYS */;
INSERT INTO `gestion_backup` VALUES (3,'copia','backup/personal.equipo.json','2022-06-06 14:22:38.966942'),(4,'Copia de Seguridad','backup/Copia_6-06-22_4k0qegV.sql','2022-06-07 15:51:28.467271'),(5,'Copia de Seguridad','backup/BKP_2022-06-07_ICHn4wu.sql','2022-06-07 15:52:42.696586'),(6,'Copia de Seguridad','backup/BKP_2022-06-07_rXhsZ8y.sql','2022-06-10 13:09:03.865162'),(7,'Copia de Seguridad','backup/BKP_2022-06-10_fATmnjg.sql','2022-06-17 11:57:54.769692');
/*!40000 ALTER TABLE `gestion_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_aprendiz`
--

DROP TABLE IF EXISTS `personal_aprendiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_aprendiz` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `documento` varchar(10) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `equipo_id` bigint(20) DEFAULT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `documento` (`documento`),
  KEY `personal_aprendiz_equipo_id_f64701f0_fk_personal_equipo_id` (`equipo_id`),
  CONSTRAINT `personal_aprendiz_equipo_id_f64701f0_fk_personal_equipo_id` FOREIGN KEY (`equipo_id`) REFERENCES `personal_equipo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_aprendiz`
--

LOCK TABLES `personal_aprendiz` WRITE;
/*!40000 ALTER TABLE `personal_aprendiz` DISABLE KEYS */;
INSERT INTO `personal_aprendiz` VALUES (2,'Jose David','Acevedo Chaparro','1002558847','M',5,'1'),(3,'Juan Camilo','Alba Maldonado','1000161450','M',5,'1'),(4,'Sebastian','Rodriguez Diaz','1053604031','M',1,'1'),(5,'Leydi Marian','Galindo Suarez','1002367133','F',4,'1'),(6,'Verónica Daniela','Escobar Briceño','1140417172','F',3,'1'),(7,'Alix Adriana','Vergara Perez','1192725481','F',5,'1'),(8,'Cindi Lorena','Diaz Cardozo','1002727576','F',1,'1'),(9,'Miguel Angel','Gamez Guerrero','1002559432','M',3,'1'),(10,'Eliana Julieth','Rojas Flórez','1002460359','F',5,'1'),(11,'Germán Jaset','Cuesta Becerra','1002458696','M',1,'1'),(12,'Maikoll Yecid','Trujillo Talero','1010150024','M',2,'1'),(13,'Pablo Alberto','Perez Aguirre','1002558945','M',1,'1'),(14,'Jorge Iván','Diaz Estupiñan','1192749502','M',4,'1'),(15,'Johan Aldemar','Lemus Castañeda','1006442915','M',1,'1'),(16,'Sergio Andres','Moreno Rojas','1007442194','M',5,'1'),(17,'Yenssi Daniela','Castro Garcia','1002459437','F',3,'1'),(18,'Johana Katherine','Soler Corredor','1002727280','F',2,'1'),(19,'Franklin Alejandro','Cáceres Salinas','1001118051','M',3,'1'),(20,'Angie Natalia','Pinzón Sanabria','1005344215','F',4,'1'),(21,'Sara Valentina','Briceño Perez','1002559459','F',3,'1'),(22,'Joselin','Alfaro Olmos','1116542333','M',4,'1'),(23,'Cristian Santiago','Correcha Montañez','1057570068','M',2,'0'),(24,'Brayan Camilo','Figueredo Pulido','1002607801','M',4,'1'),(25,'Lina Xiomara','Ladino Fernandez','105412000','F',2,'1'),(26,'Brayan Alexander','Rivera Gomez','1002366006','M',2,'1'),(27,'Antony','Botello','1049641572','M',6,'0');
/*!40000 ALTER TABLE `personal_aprendiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_equipo`
--

DROP TABLE IF EXISTS `personal_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_equipo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `puntos` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_equipo_nombre_a7115494_uniq` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_equipo`
--

LOCK TABLES `personal_equipo` WRITE;
/*!40000 ALTER TABLE `personal_equipo` DISABLE KEYS */;
INSERT INTO `personal_equipo` VALUES (1,'Backyardigans',0),(2,'World of caps',0),(3,'Los innombrables',0),(4,'Las tapitas rojas',0),(5,'El tapazo',0),(6,'El inge',0);
/*!40000 ALTER TABLE `personal_equipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-29  7:36:30
