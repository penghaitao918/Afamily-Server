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

/*Table structure for table `student_user` */

DROP TABLE IF EXISTS `student_user`;

CREATE TABLE `student_user` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `student_id` varchar(10) NOT NULL COMMENT '学号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `user_name` varchar(50) NOT NULL COMMENT '姓名',
  `user_portrait` longblob NOT NULL COMMENT '头像',
  `sex` int(2) NOT NULL COMMENT '性别（0男1女）',
  `grade` varchar(10) NOT NULL COMMENT '年级',
  `classes` varchar(10) NOT NULL COMMENT '班级',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `student_user` */

insert  into `student_user`(`user_id`,`student_id`,`password`,`user_name`,`user_portrait`,`sex`,`grade`,`classes`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','小涛哈哈哈','',0,'大一','120402');

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
