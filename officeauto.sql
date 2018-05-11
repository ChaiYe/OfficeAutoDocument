-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: officeauto
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `actfile`
--

DROP TABLE IF EXISTS `actfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actfile` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(1000) NOT NULL,
  `name` varchar(255) NOT NULL,
  `format` varchar(100) NOT NULL,
  `size` int(11) NOT NULL,
  `createtime` date NOT NULL,
  `activity` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `actfile_activity_idx` (`activity`),
  KEY `actfile_employee_idx` (`employee`),
  CONSTRAINT `actfile_activity` FOREIGN KEY (`activity`) REFERENCES `activity` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `actfile_employee` FOREIGN KEY (`employee`) REFERENCES `employee` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actfile`
--

LOCK TABLES `actfile` WRITE;
/*!40000 ALTER TABLE `actfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `actfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `descript` text NOT NULL,
  `begintime` date NOT NULL,
  `endtime` date NOT NULL,
  `state` int(11) NOT NULL COMMENT '状态， 待审批，正在进行，已结束',
  `dept` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `activity_employee_idx` (`employee`),
  KEY `activity_dept_idx` (`dept`),
  CONSTRAINT `activity_dept` FOREIGN KEY (`dept`) REFERENCES `dept` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `activity_employee` FOREIGN KEY (`employee`) REFERENCES `employee` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actoption`
--

DROP TABLE IF EXISTS `actoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actoption` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `descript` varchar(255) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '0',
  `activity` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `option_activity_idx` (`activity`),
  CONSTRAINT `option_activity` FOREIGN KEY (`activity`) REFERENCES `activity` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actoption`
--

LOCK TABLES `actoption` WRITE;
/*!40000 ALTER TABLE `actoption` DISABLE KEYS */;
/*!40000 ALTER TABLE `actoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actvote`
--

DROP TABLE IF EXISTS `actvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actvote` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `votetime` date NOT NULL,
  `actoption` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `actvote_actoption_idx` (`actoption`),
  KEY `actvote_employee_idx` (`employee`),
  CONSTRAINT `actvote_actoption` FOREIGN KEY (`actoption`) REFERENCES `actoption` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `actvote_employee` FOREIGN KEY (`employee`) REFERENCES `employee` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actvote`
--

LOCK TABLES `actvote` WRITE;
/*!40000 ALTER TABLE `actvote` DISABLE KEYS */;
/*!40000 ALTER TABLE `actvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announce`
--

DROP TABLE IF EXISTS `announce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announce` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `descript` text NOT NULL,
  `createtime` date NOT NULL,
  `dept` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `announce_employee_idx` (`employee`),
  KEY `announce_dept_idx` (`dept`),
  CONSTRAINT `announce_dept` FOREIGN KEY (`dept`) REFERENCES `dept` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `announce_employee` FOREIGN KEY (`employee`) REFERENCES `employee` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announce`
--

LOCK TABLES `announce` WRITE;
/*!40000 ALTER TABLE `announce` DISABLE KEYS */;
/*!40000 ALTER TABLE `announce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dept` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `descript` text NOT NULL COMMENT '部门简介',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '工号',
  `account` varchar(255) NOT NULL COMMENT '登录账号',
  `password` varchar(255) NOT NULL,
  `state` varchar(45) NOT NULL COMMENT '员工状态',
  `createtime` date NOT NULL COMMENT '入职时间',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `account_UNIQUE` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeinfo`
--

DROP TABLE IF EXISTS `employeeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeeinfo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `info_employee` FOREIGN KEY (`id`) REFERENCES `employee` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeinfo`
--

LOCK TABLES `employeeinfo` WRITE;
/*!40000 ALTER TABLE `employeeinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '职位名称',
  `descript` text NOT NULL COMMENT '描述',
  `authority` int(11) NOT NULL COMMENT '权限',
  `worktime` date NOT NULL COMMENT '就职时间',
  `dept` int(11) NOT NULL,
  `employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `job_dept_idx` (`dept`),
  KEY `job_employee_idx` (`employee`),
  CONSTRAINT `job_dept` FOREIGN KEY (`dept`) REFERENCES `dept` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `job_employee` FOREIGN KEY (`employee`) REFERENCES `employee` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `descipt` text NOT NULL,
  `createtime` date NOT NULL COMMENT '制定时间',
  `begintime` date NOT NULL,
  `endtime` date NOT NULL,
  `state` varchar(255) NOT NULL,
  `employee` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `plan_emplpyee_idx` (`employee`),
  CONSTRAINT `plan_emplpyee` FOREIGN KEY (`employee`) REFERENCES `employee` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-11 16:42:09
