/*
SQLyog Ultimate v10.42 
MySQL - 5.5.5-10.1.9-MariaDB : Database - acm_family
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`acm_family` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `acm_family`;

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `account` varchar(50) NOT NULL COMMENT '登录账号',
  `address` varchar(20) NOT NULL COMMENT 'IP',
  `port` int(10) NOT NULL COMMENT '端口',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间',
  `logout_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '注销时间',
  `flag_login` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`id`,`account`,`address`,`port`,`login_time`,`logout_time`,`flag_login`) values (1,'adminTest','1192.168.1.1',30000,'2016-04-04 15:44:41','2016-04-04 15:46:48',0),(2,'adminTest','1192.168.1.2',30000,'2016-04-04 15:45:36','2016-04-04 15:47:17',0),(3,'admin','1192.168.1.3',30000,'2016-04-04 15:46:29','2016-04-04 15:47:05',0),(5,'admin','/192.168.56.101',36703,'2016-04-04 16:13:22','2016-04-04 16:13:36',0);

/*Table structure for table `student_user` */

DROP TABLE IF EXISTS `student_user`;

CREATE TABLE `student_user` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `student_id` varchar(10) NOT NULL COMMENT '学号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `user_name` varchar(50) NOT NULL COMMENT '姓名',
  `user_portrait` longblob NOT NULL COMMENT '头像',
  `sex` varchar(2) NOT NULL DEFAULT '-' COMMENT '性别',
  `classes` varchar(10) NOT NULL COMMENT '班级',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `student_user` */

insert  into `student_user`(`user_id`,`student_id`,`password`,`user_name`,`user_portrait`,`sex`,`classes`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','小涛哈哈哈','hnfgghghgfgfgb','男','120402');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `login_id` varchar(50) NOT NULL COMMENT '登录ID',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`login_id`,`user_name`,`password`) values (1,'admin','小涛','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
