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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actfile`
--

LOCK TABLES `actfile` WRITE;
/*!40000 ALTER TABLE `actfile` DISABLE KEYS */;
INSERT INTO `actfile` VALUES (1,'H:\\OAstorage\\test.txt','test','txt',24,'2018-12-21',1,1),(2,'H:\\OAstorage\\test.txt','test','txt',24,'2018-12-21',1,1),(3,'H:\\OAstorage\\test.txt','test','txt',24,'2018-12-21',1,1),(4,'H:\\OAstorage\\test.txt','test','txt',24,'2018-12-21',1,1),(5,'H:\\OAstorage\\test.txt','test','txt',24,'2018-12-21',1,1),(6,'H:\\OAstorage\\9e11b617-6feb-49e9-8b7d-8fff8702db20.jpg','1512794110649.jpg','jpg',2485399,'2018-05-25',1,1),(7,'D:\\OAstorage\\591cd7f8-aabd-46ba-8b49-630ef23fc238.xls','第8组项目2进度表.xls','xls',29184,'2018-05-28',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'年庆','开趴体','2018-05-12','2018-05-12',1,1,1),(2,'中秋晚会','仙庙烧鸡聚会','2018-08-15','2018-08-16',2,1,1),(4,'测试','测试','2018-08-15','2018-08-15',1,1,1),(5,'测试','测试','2018-08-15','2018-08-15',1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actoption`
--

LOCK TABLES `actoption` WRITE;
/*!40000 ALTER TABLE `actoption` DISABLE KEYS */;
INSERT INTO `actoption` VALUES (1,'活动选项1',2,1),(2,'活动选项2',2,1),(4,'测试',2,1),(5,'测试',2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actvote`
--

LOCK TABLES `actvote` WRITE;
/*!40000 ALTER TABLE `actvote` DISABLE KEYS */;
INSERT INTO `actvote` VALUES (1,'2018-05-12',1,1),(2,'2018-12-12',1,2);
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
  `title` varchar(45) NOT NULL,
  `descript` text NOT NULL,
  `createtime` date NOT NULL,
  `dept` int(11) NOT NULL,
  `employee` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `announce_employee_idx` (`employee`),
  KEY `announce_dept_idx` (`dept`),
  CONSTRAINT `announce_dept` FOREIGN KEY (`dept`) REFERENCES `dept` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `announce_employee` FOREIGN KEY (`employee`) REFERENCES `employee` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announce`
--

LOCK TABLES `announce` WRITE;
/*!40000 ALTER TABLE `announce` DISABLE KEYS */;
INSERT INTO `announce` VALUES (1,'超级信心','超级修改信息','2018-05-19',1,1),(2,'公告2','公告2','2015-12-03',1,2),(3,'公告2','添加计划','2018-05-25',3,3),(4,'销售部公告','公告1','2018-06-02',2,1),(5,'测试长度和富文本','<p><strong>这是一个测试</strong></p>\r\n\r\n<p><q>这是一个测试</q></p>\r\n\r\n<blockquote>\r\n<p>这是一个测试</p>\r\n</blockquote>\r\n\r\n<ol>\r\n	<li>这是一个测试</li>\r\n</ol>\r\n\r\n<p><s>这是一个测试</s></p>','2018-06-02',1,1),(6,'这是一个公告发布测试','<p>这是一个公告发布测试</p><p><b>这是一个公告发布测试</b></p><p><b><i>这是一个公告发布测试</i></b></p><p style=\"text-align: center; \"><b><i><u>这是一个公告发布测试</u></i></b></p><p style=\"text-align: right; \"><b><i><u><strike>这是一个公告发布测试</strike></u></i></b></p><p style=\"text-align: left;\"><b><i><u><strike><img src=\"http://localhost:8080/layui/images/face/27.gif\" alt=\"[疑问]\"><img src=\"http://localhost:8080/layui/images/face/66.gif\" alt=\"[奥特曼]\"><img src=\"http://localhost:8080/layui/images/face/14.gif\" alt=\"[亲亲]\"><img src=\"http://localhost:8080/layui/images/face/16.gif\" alt=\"[太开心]\"><img src=\"http://localhost:8080/layui/images/face/31.gif\" alt=\"[汗]\"><img src=\"http://localhost:8080/layui/images/face/43.gif\" alt=\"[黑线]\"><br></strike></u></i></b></p>','2018-06-05',1,1),(7,'测试测试','<p>这是一个公告发布测试</p><p><b>这是一个公告发布测试</b></p><p><b><i>这是一个公告发布测试</i></b></p><p style=\"text-align: center; \"><b><i><u>这是一个公告发布测试</u></i></b></p><p style=\"text-align: right; \"><b><i><u><strike>这是一个公告发布测试</strike></u></i></b></p><p style=\"text-align: left;\"><b><i><u><strike><img src=\"http://localhost:8080/layui/images/face/27.gif\" alt=\"[疑问]\"><img src=\"http://localhost:8080/layui/images/face/66.gif\" alt=\"[奥特曼]\"><img src=\"http://localhost:8080/layui/images/face/14.gif\" alt=\"[亲亲]\"><img src=\"http://localhost:8080/layui/images/face/16.gif\" alt=\"[太开心]\"><img src=\"http://localhost:8080/layui/images/face/31.gif\" alt=\"[汗]\"><img src=\"http://localhost:8080/layui/images/face/43.gif\" alt=\"[黑线]\"><br></strike></u></i></b></p>','2018-06-07',3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES (1,'公司','公司'),(2,'销售部','销售'),(3,'设计部','设计'),(4,'虚拟部','虚拟'),(6,'虚部','虚拟'),(7,'拟部','虚拟'),(8,'非虚拟部','虚拟'),(11,'那虚拟部','虚拟'),(13,'坏虚拟部','虚拟'),(14,'大虚拟部','虚拟'),(15,'小虚拟部','虚拟'),(16,'多虚拟部','虚拟'),(17,'少虚拟部','虚拟'),(18,'页面层测试','页面层测试');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'A001','123','在职','2018-04-01'),(2,'A002','123','在职','2018-05-12'),(3,'A003','123','在职','2018-05-12'),(5,'A004','123','在职','2018-05-17'),(7,'A005','123','在职','2018-05-17'),(9,'A006','123','在职','2018-05-17');
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
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `info_employee` FOREIGN KEY (`id`) REFERENCES `employee` (`uuid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeinfo`
--

LOCK TABLES `employeeinfo` WRITE;
/*!40000 ALTER TABLE `employeeinfo` DISABLE KEYS */;
INSERT INTO `employeeinfo` VALUES (1,'赵云','男','25','15222174221','123@email.com','广东省肇庆市肇庆学院','1.png'),(2,'王畅','女','18','1112312123','38829932@qq.com','广东省肇庆市',NULL),(3,'饿哦','男','19','1123211212','32434128455@qq.com','广东身肇庆市',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (1,'经理','经理',2,'2015-01-01',1,1),(2,'总监','总监',2,'2015-01-02',1,2),(3,'总裁','总裁',3,'2015-01-01',2,1),(5,'测试','测试',3,'2015-01-01',3,1),(6,'测试','测试',3,'2015-01-01',1,1),(7,'测试','测试',3,'2015-01-01',1,1),(10,'新职位','描述',1,'2018-05-11',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (2,'上班','2018-05-12','2018-05-12','2018-05-12','未开始',1),(3,'下班','2018-05-12','2018-05-12','2018-05-12','进行中',1),(5,'测试','2018-05-12','2018-05-12','2018-05-12','进行中',1),(6,'测试','2018-05-12','2018-05-12','2018-05-12','进行中',1),(7,'测试','2018-05-12','2018-05-12','2018-05-12','进行中',1);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT,
  `descript` text NOT NULL,
  `begintime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endtime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activity` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `vote_act_idx` (`activity`),
  CONSTRAINT `vote_act` FOREIGN KEY (`activity`) REFERENCES `activity` (`uuid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-07 20:30:03
