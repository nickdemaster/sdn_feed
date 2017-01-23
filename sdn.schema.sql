-- MySQL dump 10.13  Distrib 5.5.35, for osx10.6 (i386)
--
-- Host: localhost    Database: sdn
-- ------------------------------------------------------
-- Server version	5.5.35

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
-- Current Database: `sdn`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sdn` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sdn`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `sdn_id` int(11) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `address3` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `stateOrProvince` varchar(255) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `postalCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=24840 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `akaList`
--

DROP TABLE IF EXISTS `akaList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `akaList` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `sdn_id` int(11) DEFAULT NULL,
  `type` varchar(500) DEFAULT NULL,
  `category` varchar(500) DEFAULT NULL,
  `lastName` varchar(500) DEFAULT NULL,
  `firstName` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=24892 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `citizenship`
--

DROP TABLE IF EXISTS `citizenship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `citizenship` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `sdn_id` int(11) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `mainEntry` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14627 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dateOfBirth`
--

DROP TABLE IF EXISTS `dateOfBirth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dateOfBirth` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `sdn_id` int(11) DEFAULT NULL,
  `dateOfBirth` varchar(45) DEFAULT NULL,
  `mainEntry` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14849 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idList`
--

DROP TABLE IF EXISTS `idList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idList` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `sdn_id` int(11) DEFAULT NULL,
  `idType` varchar(255) DEFAULT NULL,
  `idNumber` varchar(255) DEFAULT NULL,
  `idCountry` varchar(255) DEFAULT NULL,
  `issueDate` varchar(255) DEFAULT NULL,
  `expirationDate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `unique` (`sdn_id`,`idType`,`idNumber`,`idCountry`,`issueDate`,`expirationDate`)
) ENGINE=InnoDB AUTO_INCREMENT=114846 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nationality` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `sdn_id` int(11) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `mainEntry` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14844 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phoneFax`
--

DROP TABLE IF EXISTS `phoneFax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phoneFax` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `sdn_id` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `unique` (`sdn_id`,`type`,`number`)
) ENGINE=InnoDB AUTO_INCREMENT=1105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `placeOfBirth`
--

DROP TABLE IF EXISTS `placeOfBirth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `placeOfBirth` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `sdn_id` int(11) DEFAULT NULL,
  `placeOfBirth` varchar(255) DEFAULT NULL,
  `mainEntry` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14848 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program` (
  `sdn_id` int(11) NOT NULL,
  `program` varchar(45) NOT NULL,
  PRIMARY KEY (`sdn_id`,`program`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sdnList`
--

DROP TABLE IF EXISTS `sdnList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sdnList` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(5000) DEFAULT NULL,
  `lastName` varchar(5000) DEFAULT NULL,
  `title` varchar(5000) DEFAULT NULL,
  `sdnType` varchar(5000) DEFAULT NULL,
  `remarks` varchar(5000) DEFAULT NULL,
  `modified_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16450 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vesselInfo`
--

DROP TABLE IF EXISTS `vesselInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vesselInfo` (
  `sdn_id` int(11) NOT NULL DEFAULT '0',
  `callSign` varchar(45) NOT NULL DEFAULT '',
  `vesselType` varchar(45) NOT NULL DEFAULT '',
  `vesselFlag` varchar(45) NOT NULL DEFAULT '',
  `vesselOwner` varchar(255) NOT NULL DEFAULT '',
  `tonnage` varchar(45) NOT NULL DEFAULT '',
  `grossRegisteredTonnage` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`sdn_id`,`callSign`,`vesselType`,`vesselFlag`,`vesselOwner`,`tonnage`,`grossRegisteredTonnage`)
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

-- Dump completed on 2014-02-06 14:49:41
