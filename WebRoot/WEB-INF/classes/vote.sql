/*
SQLyog Ultimate - MySQL GUI v8.21 
MySQL - 5.0.67-community-nt : Database - vote
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vote` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `vote`;

/*Table structure for table `vote_item` */

DROP TABLE IF EXISTS `vote_item`;

CREATE TABLE `vote_item` (
  `vi_id` int(11) NOT NULL auto_increment,
  `vo_id` int(11) NOT NULL,
  `vs_id` int(11) NOT NULL,
  `vu_id` int(11) NOT NULL,
  PRIMARY KEY  (`vi_id`),
  KEY `FK_vote_subject_vote_item` (`vs_id`),
  KEY `FK_vote_option_vote_item` (`vo_id`),
  KEY `FK_vote_user_vote_item` (`vu_id`),
  CONSTRAINT `FK_vote_option_vote_item` FOREIGN KEY (`vo_id`) REFERENCES `vote_option` (`vo_id`),
  CONSTRAINT `FK_vote_subject_vote_item` FOREIGN KEY (`vs_id`) REFERENCES `vote_subject` (`vs_id`),
  CONSTRAINT `FK_vote_user_vote_item` FOREIGN KEY (`vu_id`) REFERENCES `vote_user` (`vu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=gbk;

/*Data for the table `vote_item` */

insert  into `vote_item`(`vi_id`,`vo_id`,`vs_id`,`vu_id`) values (1,1,1,1),(2,2,1,2),(3,1,1,2),(4,1,1,2),(6,1,1,1),(7,5,2,1),(10,28,6,2),(11,1,1,1),(12,2,1,1),(13,1,1,1),(14,1,1,1),(15,1,1,1),(16,1,1,1),(17,5,2,2),(18,6,2,2);

/*Table structure for table `vote_option` */

DROP TABLE IF EXISTS `vote_option`;

CREATE TABLE `vote_option` (
  `vo_id` int(11) NOT NULL auto_increment,
  `vo_option` varchar(50) NOT NULL,
  `vs_id` int(11) NOT NULL,
  `vo_order` int(11) default NULL,
  PRIMARY KEY  (`vo_id`),
  KEY `FK_vote_subject_vote_option` (`vs_id`),
  CONSTRAINT `FK_vote_subject_vote_option` FOREIGN KEY (`vs_id`) REFERENCES `vote_subject` (`vs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=gbk;

/*Data for the table `vote_option` */

insert  into `vote_option`(`vo_id`,`vo_option`,`vs_id`,`vo_order`) values (1,'古天乐',1,NULL),(2,'吴彦祖',1,NULL),(3,'张学友',1,NULL),(4,'梁朝伟',1,NULL),(5,'刘亦菲',2,NULL),(6,'佟丽娅',2,NULL),(7,'朱茵',2,NULL),(8,'刘诗诗',2,NULL),(28,'英雄联盟',6,0),(29,'冰封王座',6,0),(30,'穿越火线',6,0),(31,'梦幻三国',6,0),(98,'得瑟得瑟',7,0),(99,'得瑟得瑟1',7,0);

/*Table structure for table `vote_subject` */

DROP TABLE IF EXISTS `vote_subject`;

CREATE TABLE `vote_subject` (
  `vs_id` int(11) NOT NULL auto_increment,
  `vs_titles` varchar(50) NOT NULL,
  `vs_type` int(11) NOT NULL,
  PRIMARY KEY  (`vs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

/*Data for the table `vote_subject` */

insert  into `vote_subject`(`vs_id`,`vs_titles`,`vs_type`) values (1,'选出你心中的男神',1),(2,'选出你心中的女神',2),(6,'选出你最喜欢的游戏',2),(7,'为而为2',1);

/*Table structure for table `vote_user` */

DROP TABLE IF EXISTS `vote_user`;

CREATE TABLE `vote_user` (
  `vu_id` int(11) NOT NULL auto_increment,
  `vu_name` varchar(50) NOT NULL,
  `vu_passworld` varchar(50) NOT NULL,
  `flag` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=gbk;

/*Data for the table `vote_user` */

insert  into `vote_user`(`vu_id`,`vu_name`,`vu_passworld`,`flag`) values (1,'小胖','123',1),(2,'小明','234',0),(3,'小黄','345',0),(4,'宋小宝','111',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
