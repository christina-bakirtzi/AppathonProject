-- MariaDB dump 10.17  Distrib 10.4.14-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	10.4.14-MariaDB

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` double NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `username` varchar(25) NOT NULL,
  `name` varchar(60) NOT NULL,
  `birthdate` varchar(45) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('Admin','admin','10/08/1990','admin'),('Christina','Christina B','16/10/2018','christina'),('Christina98','USER 12','15/09/2020','jiji');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) NOT NULL,
  `total_price` double NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(205) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1089,'Lenovo ThinkPad X380 Yoga (i7-8550U/8GB/512GB/FHD/W10)','thisis',1580),(1178,'Lenovo Yoga Slim 7 14ARE05 (R7-4700U/16GB/1TB/FHD/W10s)','one',1098),(1231,'Asus VivoBook E406MA-BV211TS (N4000/4GB/64GB/W10)','asus',421),(2134,'Msystems PC Gaming | Ryzen 5-3400G - 8GB RAM - 240GB SSD - Vega 11 - Win 10 Home','mysec',553.5),(2664,'Laptop Huawei MateBook D14 14\" (Ryzen 5 3500U/8GB/512 SSD/Radeon Vega 8)','huawei',649),(3122,'Dell XPS 13 7390 (i7-1065G7/32GB/1TB/W10)','seven',2300),(3241,'Apple iMac 27\" (i5/8GB/1TB/Radeon Pro 570X/macOS) (2019)','macos',2043),(3877,'Lenovo ThinkPad X380 Yoga (i7-8550U/8GB/512GB/FHD/W10)','ten',1456),(4233,'MSI GF63 Thin 9SC (i5-9300H/8GB/512GB/GeForce GTX 1650 Max Q/FHD 120Hz/W10)','two',975),(4332,'Infinity Gear Core R2','cece',389),(4576,'Dell Alienware Area-51m R2 (i7-10700/16GB/1TB 2x 512GB/GeForce RTX 2070 Super/FHD 300Hz/W10)','five',4020),(5332,'Powertech DMPC-0025 (i5-9600KF/16GB/512GB/GeForce RTX 2070/No OS)','mysec2',1148.6),(5542,'HP 15-db1006nv (R5-3500U/4GB/1TB + 128GB/W10)','four',519),(6554,'Lenovo Legion Y540-17IRH (i7-9750H/16GB/512GB/GeForce RTX 2060/FHD/No OS)','eleven',1432),(7990,'Asus VivoBook 15 X512JP-WB501T (i5-1035G1/8GB/256GB/GeForce MX330/FHD/W10)','three',729),(8467,'ZeroOne PC GameMate R3 Extra (Ryzen 3 3200G/8G/480GB SSD/Radeon(TM) RX 570/No OS)','koo',532.5),(8665,'LAPTOP APPLE MACBOOK 12\'\' RETINA DUAL CORE INTEL CORE I5 1.3GHZ 8GB 512GB SPACE GREY','macbook',1699.9),(8765,'Lenovo ThinkPad X1 Yoga 3rd Gen (i7-8550U/16GB/512GB/4G/W10)','eight',2103),(8776,'Asus ROG Mothership GZ700GX-EV007R (i9-9980HK/64GB/3x 512GB/GeForce RTX 2080/FHD/W10)','six',7369),(9007,'Dell XPS 15 9575 (i5-8305G/8GB/256GB/Radeon RX Vega 870/FHD/W10)','dell',2087.9),(9087,'Lenovo ThinkBook Plus IML (i7-i7-10710U/16GB/512GB/FHD/W10)','nine',1543);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-03 17:30:13
