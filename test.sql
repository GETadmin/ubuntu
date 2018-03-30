-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Table structure for table `so_administrator`
--

DROP TABLE IF EXISTS `so_administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_administrator` (
  `admin_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员的id',
  `admin_name` varchar(26) NOT NULL COMMENT '管理员的名字',
  `admin_password` varchar(32) NOT NULL COMMENT '管理员的密码',
  `admin_real_name` varchar(26) DEFAULT NULL COMMENT '管理员的真实姓名',
  `admin_sex` int(2) DEFAULT NULL COMMENT '管理员性别',
  `admin_work_number` varchar(18) NOT NULL COMMENT '工作编号',
  `admin_api` varchar(26) DEFAULT NULL COMMENT '是否绑定有api',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `phone` char(15) NOT NULL COMMENT '手机',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `user_ip` varchar(32) DEFAULT NULL COMMENT '最近登录用的IP',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `work_state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '工作状态',
  `log_frequency` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `time_add` int(11) unsigned NOT NULL,
  `remarks` varchar(250) DEFAULT NULL COMMENT '备注',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_administrator`
--

LOCK TABLES `so_administrator` WRITE;
/*!40000 ALTER TABLE `so_administrator` DISABLE KEYS */;
INSERT INTO `so_administrator` VALUES (1,'瓜呱呱','7ca715328de9113c290a3ff0af1077fd','吴书宁',1,'01',NULL,NULL,'15777156510','',NULL,'',0,97,0,NULL,1),(2,'晚发费','96a3be3cf272e017046d1b2674a52bd3',NULL,1,'001',NULL,NULL,'032',NULL,NULL,'156132',0,0,1514274107,'165564156',0),(3,'吴书宁','e10adc3949ba59abbe56e057f20f883e',NULL,1,'01',NULL,NULL,'15777156510',NULL,NULL,'1397331617@qq.com',0,12,1514362305,'阿达大厦大',0);
/*!40000 ALTER TABLE `so_administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_api`
--

DROP TABLE IF EXISTS `so_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_api` (
  `api_id` int(10) NOT NULL AUTO_INCREMENT,
  `api_type` varchar(20) NOT NULL COMMENT 'API的类型',
  `openid` varchar(64) NOT NULL COMMENT '第三方登录的open_id',
  `nickname` varchar(300) NOT NULL COMMENT '第三方用户昵称',
  `json` text NOT NULL COMMENT '用户信息',
  `admin_id` int(10) NOT NULL COMMENT '管理员账号ID',
  `token` varchar(100) NOT NULL COMMENT '钥匙',
  `sign` varchar(10) NOT NULL COMMENT '第三方登录标记',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_api`
--

LOCK TABLES `so_api` WRITE;
/*!40000 ALTER TABLE `so_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `so_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_auth_access`
--

DROP TABLE IF EXISTS `so_auth_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_auth_access` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限分配表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_auth_access`
--

LOCK TABLES `so_auth_access` WRITE;
/*!40000 ALTER TABLE `so_auth_access` DISABLE KEYS */;
INSERT INTO `so_auth_access` VALUES (1,1,1),(3,2,1),(2,3,2);
/*!40000 ALTER TABLE `so_auth_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_auth_category`
--

DROP TABLE IF EXISTS `so_auth_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_auth_category` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) NOT NULL,
  `states` tinyint(1) NOT NULL DEFAULT '1',
  `categorys` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_auth_category`
--

LOCK TABLES `so_auth_category` WRITE;
/*!40000 ALTER TABLE `so_auth_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `so_auth_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_auth_group`
--

DROP TABLE IF EXISTS `so_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='权限分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_auth_group`
--

LOCK TABLES `so_auth_group` WRITE;
/*!40000 ALTER TABLE `so_auth_group` DISABLE KEYS */;
INSERT INTO `so_auth_group` VALUES (1,'admin',1,'1,2,4,3'),(2,'wsn',1,''),(3,'超级管理员',1,'1,2,4,3');
/*!40000 ALTER TABLE `so_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_auth_rule`
--

DROP TABLE IF EXISTS `so_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `direct_jump` tinyint(1) unsigned NOT NULL,
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '100',
  `condition` char(100) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_auth_rule`
--

LOCK TABLES `so_auth_rule` WRITE;
/*!40000 ALTER TABLE `so_auth_rule` DISABLE KEYS */;
INSERT INTO `so_auth_rule` VALUES (1,'登录-登录','Login-login',1,0,100,'Login',1),(2,'首页-首页','Index-index',1,0,100,'Index',1),(3,'用户管理-用户中心','User-userinfo',1,0,100,'2',1),(4,'首页-我的桌面','Index-mycore',1,1,100,'',1);
/*!40000 ALTER TABLE `so_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_config`
--

DROP TABLE IF EXISTS `so_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `config_sign` char(30) NOT NULL COMMENT '配置标识',
  `config_name` char(50) NOT NULL COMMENT '配置名称',
  `config_value` text NOT NULL COMMENT '配置值',
  `explain` varchar(300) NOT NULL COMMENT '注释',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_config`
--

LOCK TABLES `so_config` WRITE;
/*!40000 ALTER TABLE `so_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `so_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_controller_power`
--

DROP TABLE IF EXISTS `so_controller_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_controller_power` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controller_name` varchar(50) NOT NULL COMMENT '控制器名称',
  `controller_function` varchar(50) NOT NULL COMMENT '方法名称',
  `need_login` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要登录',
  `need_cached` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要缓存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='方法是否需要登录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_controller_power`
--

LOCK TABLES `so_controller_power` WRITE;
/*!40000 ALTER TABLE `so_controller_power` DISABLE KEYS */;
/*!40000 ALTER TABLE `so_controller_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_information`
--

DROP TABLE IF EXISTS `so_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_information` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(150) NOT NULL DEFAULT '',
  `subtitle` varchar(150) NOT NULL DEFAULT '',
  `columnId` tinyint(3) NOT NULL,
  `typeId` tinyint(3) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `abstract` varchar(200) NOT NULL,
  `author` varchar(22) NOT NULL,
  `source` varchar(100) DEFAULT '#',
  `iscomm` tinyint(1) NOT NULL DEFAULT '1',
  `commstart` tinyint(15) NOT NULL,
  `commend` tinyint(15) NOT NULL,
  `isview` tinyint(1) NOT NULL DEFAULT '0',
  `viewId` tinyint(3) NOT NULL,
  `image` varchar(70) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='user_table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_information`
--

LOCK TABLES `so_information` WRITE;
/*!40000 ALTER TABLE `so_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `so_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_user_ip`
--

DROP TABLE IF EXISTS `so_user_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_user_ip` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ip_address` varchar(30) NOT NULL COMMENT 'IP地址',
  `user_id` int(11) NOT NULL COMMENT '用户ID·',
  `address` varchar(255) NOT NULL COMMENT '物理地址',
  `Browser` varchar(30) NOT NULL COMMENT '浏览器名称',
  `Os` varchar(255) NOT NULL COMMENT '操作系统',
  `start_time` int(11) unsigned NOT NULL COMMENT '开始时间',
  `end_time` int(11) DEFAULT NULL,
  `visited` int(11) DEFAULT NULL,
  `Country` varchar(100) NOT NULL COMMENT '国家',
  `Province` varchar(100) NOT NULL COMMENT '省份',
  `City` varchar(100) NOT NULL COMMENT '城市',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='用户IP表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_user_ip`
--

LOCK TABLES `so_user_ip` WRITE;
/*!40000 ALTER TABLE `so_user_ip` DISABLE KEYS */;
INSERT INTO `so_user_ip` VALUES (46,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(47,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(48,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(49,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(50,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(51,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(52,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(53,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(54,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(55,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(56,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(57,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(58,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(59,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(60,'127.0.0.1',127,'127.0.0.1','127.0.0.1','',127,0,127,'127.0.0.1','127.0.0.1','127.0.0.1'),(61,'127.0.0.1',66,'中国-广西-南宁','Chrome','Windows',1496795216,0,66,'','',''),(62,'127.0.0.1',66,'中国-广西-南宁','Chrome','Windows',1496795356,0,66,'','',''),(63,'127.0.0.1',66,'','Chrome','Windows',1496795452,0,66,'','',''),(64,'127.0.0.1',66,'中国-广西-南宁','Chrome','Windows',1496795491,0,66,'','',''),(65,'127.0.0.1',66,'中国-广西-南宁','Chrome','Windows',1496795537,0,66,'','',''),(66,'127.0.0.1',66,'','Chrome','Windows',1496795587,0,66,'','',''),(67,'127.0.0.1',66,'中国-广西-南宁','Chrome','Windows',1496795603,0,66,'','',''),(68,'127.0.0.1',66,'中国-广西-南宁','Chrome','Windows',1496795755,0,66,'','',''),(69,'127.0.0.1',66,'中国-广西-南宁','Chrome','Windows',1496796760,0,66,'$Country','$Province','$City'),(70,'127.0.0.1',66,'','Chrome','Windows',1496796760,0,66,'$Country','$Province','$City'),(71,'127.0.0.1',66,'中国-广西-南宁','Chrome','Windows',1496796795,0,66,'$Country','$Province','$City'),(72,'127.0.0.1',1,'中国-广西-南宁','Other','Windows',1510906560,0,0,'中国','广西','南宁'),(73,'127.0.0.1',1,'中国-广西-南宁','Other','Windows',1510907274,0,0,'中国','广西','南宁'),(74,'127.0.0.1',1,'中国-广西-南宁','Other','Windows',1510907365,0,0,'中国','广西','南宁'),(75,'127.0.0.1',1,'中国-广西-南宁','Other','Windows',1510907485,0,0,'中国','广西','南宁'),(76,'127.0.0.1',1,'中国-广西-南宁','Other','Windows',1510907970,0,0,'中国','广西','南宁'),(77,'127.0.0.1',1,'中国-广西-南宁','Other','Windows',1510908066,0,0,'中国','广西','南宁'),(78,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1510994115,0,0,'中国','广西','南宁'),(79,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1511372954,0,0,'中国','广西','南宁'),(80,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1511456298,0,0,'中国','广西','南宁'),(81,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1511483373,0,0,'中国','广西','南宁'),(82,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1511557314,0,0,'中国','广西','南宁'),(83,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1511717917,0,0,'中国','广西','南宁'),(84,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1511754618,0,0,'中国','广西','南宁'),(85,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1512551205,0,0,'中国','广西','南宁'),(86,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1512609462,0,0,'中国','广西','南宁'),(87,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1512696923,0,0,'中国','广西','南宁'),(88,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1512784758,0,0,'中国','广西','南宁'),(89,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1512979297,0,0,'中国','广西','南宁'),(90,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1513041248,0,0,'中国','广西','南宁'),(91,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1513127918,0,0,'中国','广西','南宁'),(92,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1513147494,0,0,'中国','广西','南宁'),(93,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1513213805,0,0,'中国','广西','南宁'),(94,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1513234414,0,0,'中国','广西','南宁'),(95,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1513561018,0,0,'中国','广西','南宁'),(96,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1513753579,0,0,'中国','广西','南宁'),(97,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1513825280,0,0,'中国','广西','南宁'),(98,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1513904816,0,0,'中国','广西','南宁'),(99,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1513930878,0,0,'中国','广西','南宁'),(100,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514167024,0,0,'中国','广西','南宁'),(101,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514257585,0,0,'中国','广西','南宁'),(102,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514271579,0,0,'中国','广西','南宁'),(103,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514271687,0,0,'中国','广西','南宁'),(104,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514271746,0,0,'中国','广西','南宁'),(105,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514271825,0,0,'中国','广西','南宁'),(106,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514272164,0,0,'中国','广西','南宁'),(107,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514272188,0,0,'中国','广西','南宁'),(108,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514272259,0,0,'中国','广西','南宁'),(109,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514272461,0,0,'中国','广西','南宁'),(110,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514273519,0,0,'中国','广西','南宁'),(111,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514336955,0,0,'中国','广西','南宁'),(112,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514337113,0,0,'中国','广西','南宁'),(113,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514337273,0,0,'中国','广西','南宁'),(114,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514337339,0,0,'中国','广西','南宁'),(115,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514337385,0,0,'中国','广西','南宁'),(116,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514337928,0,0,'中国','广西','南宁'),(117,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514339398,0,0,'中国','广西','南宁'),(118,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514343765,0,0,'中国','广西','南宁'),(119,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514343950,0,0,'中国','广西','南宁'),(120,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514344084,0,0,'中国','广西','南宁'),(121,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514344169,0,0,'中国','广西','南宁'),(122,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514344300,0,0,'中国','广西','南宁'),(123,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514344643,0,0,'中国','广西','南宁'),(124,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514360682,0,0,'中国','广西','南宁'),(125,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514361771,0,0,'中国','广西','南宁'),(126,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514361988,0,0,'中国','广西','南宁'),(127,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514362010,0,0,'中国','广西','南宁'),(128,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514362200,0,0,'中国','广西','南宁'),(129,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514362254,0,0,'中国','广西','南宁'),(130,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514363652,0,0,'中国','广西','南宁'),(131,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514363755,0,0,'中国','广西','南宁'),(132,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514363930,0,0,'中国','广西','南宁'),(133,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514363949,0,0,'中国','广西','南宁'),(134,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514364014,0,0,'中国','广西','南宁'),(135,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514364074,0,0,'中国','广西','南宁'),(136,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514365849,0,0,'中国','广西','南宁'),(137,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514365898,0,0,'中国','广西','南宁'),(138,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514422882,0,0,'中国','广西','南宁'),(139,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514422939,0,0,'中国','广西','南宁'),(140,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514423146,0,0,'中国','广西','南宁'),(141,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514423175,0,0,'中国','广西','南宁'),(142,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514423347,0,0,'中国','广西','南宁'),(143,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514423366,0,0,'中国','广西','南宁'),(144,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514426410,0,0,'中国','广西','南宁'),(145,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514426735,0,0,'中国','广西','南宁'),(146,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514428199,0,0,'中国','广西','南宁'),(147,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514432713,0,0,'中国','广西','南宁'),(148,'127.0.0.1',3,'中国-广西-南宁','Chrome','Windows',1514443526,0,0,'中国','广西','南宁'),(149,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514444100,0,0,'中国','广西','南宁'),(150,'127.0.0.1',1,'中国-广西-南宁','Chrome','Windows',1514509817,0,0,'中国','广西','南宁'),(151,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521864816,NULL,NULL,'中国','广东','广州'),(152,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521878676,NULL,NULL,'中国','广东','广州'),(153,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521880616,NULL,NULL,'中国','广东','广州'),(154,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521880621,NULL,NULL,'中国','广东','广州'),(155,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521880626,NULL,NULL,'中国','广东','广州'),(156,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521880631,NULL,NULL,'中国','广东','广州'),(157,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521880702,NULL,NULL,'中国','广东','广州'),(158,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521880707,NULL,NULL,'中国','广东','广州'),(159,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521880711,NULL,NULL,'中国','广东','广州'),(160,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521881451,NULL,NULL,'中国','广东','广州'),(161,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521881711,NULL,NULL,'中国','广东','广州'),(162,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521881764,NULL,NULL,'中国','广东','广州'),(163,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521881786,NULL,NULL,'中国','广东','广州'),(164,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521881879,NULL,NULL,'中国','广东','广州'),(165,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521909105,NULL,NULL,'中国','广东','广州'),(166,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521950524,NULL,NULL,'中国','广东','广州'),(167,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521967253,NULL,NULL,'中国','广东','广州'),(168,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521973144,NULL,NULL,'中国','广东','广州'),(169,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521979938,NULL,NULL,'中国','广东','广州'),(170,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521981856,NULL,NULL,'中国','广东','广州'),(171,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1521990724,NULL,NULL,'中国','广东','广州'),(172,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522022990,NULL,NULL,'中国','广东','广州'),(173,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522029471,NULL,NULL,'中国','广东','广州'),(174,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522037675,NULL,NULL,'中国','广东','广州'),(175,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522046049,NULL,NULL,'中国','广东','广州'),(176,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522051308,NULL,NULL,'中国','广东','广州'),(177,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522053195,NULL,NULL,'中国','广东','广州'),(178,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522055493,NULL,NULL,'中国','广东','广州'),(179,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522055503,NULL,NULL,'中国','广东','广州'),(180,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522057187,NULL,NULL,'中国','广东','广州'),(181,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522069721,NULL,NULL,'中国','广东','广州'),(182,'112.95.2.209',1,'中国-广东-广州','Chrome','Linux',1522079702,NULL,NULL,'中国','广东','广州'),(183,'112.95.176.120',1,'中国-广东-广州','Chrome','Linux',1522378036,NULL,NULL,'中国','广东','广州');
/*!40000 ALTER TABLE `so_user_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so_verify_code`
--

DROP TABLE IF EXISTS `so_verify_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so_verify_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id (未login默认0)',
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL COMMENT '验证邮箱',
  `verify` char(10) NOT NULL,
  `type` smallint(5) NOT NULL COMMENT '验证码类型（0注册 1忘记密码 2修改 3绑定 4重置密码）',
  `is_abate` tinyint(1) unsigned NOT NULL COMMENT '是否失效',
  `sort_date` varchar(8) NOT NULL,
  `add_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机验证码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so_verify_code`
--

LOCK TABLES `so_verify_code` WRITE;
/*!40000 ALTER TABLE `so_verify_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `so_verify_code` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-30 12:41:43
