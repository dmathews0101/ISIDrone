CREATE DATABASE  IF NOT EXISTS `isidrone` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `isidrone`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: isidrone
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(45) COLLATE utf8_bin NOT NULL COMMENT 'House number',
  `appt` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'Appartment number',
  `street` varchar(45) COLLATE utf8_bin NOT NULL,
  `zip` varchar(45) COLLATE utf8_bin NOT NULL,
  `city` varchar(45) COLLATE utf8_bin NOT NULL,
  `state` varchar(45) COLLATE utf8_bin NOT NULL,
  `country` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'1','','Rue','A0A 0A0','Ville','Province','Pays');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autologin`
--

DROP TABLE IF EXISTS `autologin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autologin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(40) COLLATE utf8_bin NOT NULL,
  `user` int(10) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_UNIQUE` (`token`),
  KEY `fk_user_autoLogin_idx` (`user`),
  CONSTRAINT `fk_user_autoLogin` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autologin`
--

LOCK TABLES `autologin` WRITE;
/*!40000 ALTER TABLE `autologin` DISABLE KEYS */;
/*!40000 ALTER TABLE `autologin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'The name of the category',
  `description` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT 'Description for the category',
  `order` smallint(4) NOT NULL COMMENT 'Displaying order',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Tous',NULL,0),(2,'Avec Caméra',NULL,1),(3,'Récréatif',NULL,2),(4,'Performance',NULL,3),(5,'Matériaux',NULL,4);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;

DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `isidrone`.`category_BEFORE_DELETE` BEFORE DELETE ON `category` FOR EACH ROW
    DELETE FROM product WHERE category = OLD.id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `featured_product`
--

DROP TABLE IF EXISTS `featured_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `featured_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_product_idx` (`product`),
  CONSTRAINT `fk_product_product` FOREIGN KEY (`product`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_product`
--

LOCK TABLES `featured_product` WRITE;
/*!40000 ALTER TABLE `featured_product` DISABLE KEYS */;
INSERT INTO `featured_product` VALUES (1,1),(2,2),(3,5),(6,12),(4,16),(5,17);
/*!40000 ALTER TABLE `featured_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`),
  KEY `INDEX_USER` (`user_id`),
  CONSTRAINT `FK_USER_ORDER` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;

DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `isidrone`.`order_BEFORE_DELETE` BEFORE DELETE ON `order` FOR EACH ROW
    DELETE FROM `order_info` WHERE order_id = OLD.id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_info`
--

DROP TABLE IF EXISTS `order_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_info` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_product_idx` (`product_id`),
  CONSTRAINT `FK_ORDER_INFO_PRODUCT` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_order_info` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_info`
--

LOCK TABLES `order_info` WRITE;
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category` int(10) unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8_bin NOT NULL,
  `description` mediumtext COLLATE utf8_bin,
  `price` decimal(10,2) DEFAULT NULL,
  `serialNumber` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `imgName` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `stockQty` int(11) NOT NULL DEFAULT '0',
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_category_products_idx` (`category`),
  CONSTRAINT `fk_category_products` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (0,2,'DJI Phantom 2 Vision','Caméra 14 Mpix/1080p intégrée + cardan 3 axes pour une meilleure stabilité dans les conditions difficiles',959.99,'sfsd','1.jpg',4,1),(1,3,'Tera Mini Quadrocoptère','Une caméra efficace intégrée sur la tête de quadrocoptère vous permet de la prise de photo ou vidéo',48.99,'hgfg','2.jpg',5,1),(2,2,'Parrot AR.Drone 2.0 Elite','Parrot AR.Drone 2.0 Elite Edition propose 1 batterie normale 1000mAh, une nouvelle carène, un jeu de 4 hélices (2 noires et 2 de la couleur du camouflage), le tout dans un superbe nouveau packaging de la couleur du camouflage.',269.99,'dfgg','3.jpg',3,1),(3,3,'BlueBeach Mini Quadcopter','Le plus petit drone dans le monde avec 4 LED!',19.99,'ksghd','4.jpg',2,1),(4,2,'XT-XINTE Hubsan X4','Batterie, 4x pales de rechange, 1x Notice d\'utilisation en français envoyée par courriel lors de votre achat.',149.99,'gdfg','5.jpg',6,1),(5,3,'Hélicoptère RC Syma','Modèle S107 spécialement conçu pour être utilisé en intérieur',18.99,'lfhdb','6.jpg',3,1),(6,5,'Hélices Hubsan X4','Vol très stable et fuselage léger. Convient parfaitement pour un débutant de 12 ans et +.',2.99,'gdfg','7.jpg',4,1),(7,3,'HUBSAN X4 H107C Mini','Volez en intérieur ou en extérieur avec ce drone quadricoptère. Prenez de la hauteur et réalisez de superbes vidéos! Distance de contrôle jusqu\'à 50 mètres !',52.99,'dgdf','8.jpg',1,1),(8,2,'JJRC H12C-5','Le système de 6 axes permet le quad à être lancée à la main.',92.99,'gdfgh','9.jpg',7,1),(9,2,'EiioX Mini RC Quadcopter','Six feux à LED, les allumer et éteindre à distance pour économiser l\'énergie.',256.99,'jsfhfd','10.jpg',5,1),(10,4,'XT-XINTE Walkera TALI','Walkera TALI H500 FPV Drone Hexacopter RTF With DEVO F12E Battery G-3D Gimbal Charger ILOOK+ Full Set',1578.99,'dghdf','11.jpg',5,1),(11,5,'Parrot PF070105 Hélice','Compatibilité :BeBop Drone',10.99,'bdfdf','12.jpg',6,1),(12,2,'BlueBeach JJRC','Avec la caméra 2.0MP HD pour la vidéo et photo; LED; Retournement à 360 degrés',74.99,'dghdf','13.jpg',3,1),(13,3,'Hubsan X4 V2 H107L','Volez en intérieur ou en extérieur avec ce drone quadricoptère. Distance de contrôle jusqu\'à 50 mètres!',47.99,'rvcvn','14.jpg',4,1),(14,3,'Drone robot NOIR','Structure principale en résine ABS légère et résistante. Quatre puissants moteurs.',40.99,'hdhdf','15.jpg',6,1),(15,3,'Revell Control - 23987',' Il volde en 4 voies, radiocommande 2,4ghz d\'une portée de 50m. charge via la radio commande ou un câble usb fournis',50.99,'dfhdf','16.jpg',3,1),(16,4,'3D Robotics Iris+','3D Robotics Iris+ Quadcopter Personal Drone',1741.99,'ghedf','17.jpg',2,1),(17,5,'Akku-King Batterie','Pour Parrot AR.Drone 1.0 Quadricoptère, Quadrocopter - Li-Polymer 2600mAh 11.1V',45.99,'gdfhdg','18.jpg',7,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;

DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `isidrone`.`product_BEFORE_DELETE` BEFORE DELETE ON `product` FOR EACH ROW
	DELETE FROM featured_product WHERE product = OLD.id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lastName` varchar(45) COLLATE utf8_bin NOT NULL,
  `firstName` varchar(45) COLLATE utf8_bin NOT NULL,
  `email` varchar(45) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `ship_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_shipping_address_idx` (`ship_address_id`),
  CONSTRAINT `FK_user_shipping_address` FOREIGN KEY (`ship_address_id`) REFERENCES `address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Test','test','test@mail.com','d5b4f7d2f7c345d6c810820ce250e7699ce78e45',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;

DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `isidrone`.`user_BEFORE_DELETE` BEFORE DELETE ON `user` FOR EACH ROW
BEGIN
    DELETE FROM `autologin` WHERE user = OLD.id;
    DELETE FROM `order` WHERE user_id = OLD.id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;

DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `isidrone`.`user_AFTER_DELETE` AFTER DELETE ON `user` FOR EACH ROW
    DELETE FROM `address` WHERE id = OLD.ship_address_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-07 21:07:16
