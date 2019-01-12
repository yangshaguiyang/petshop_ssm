/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 8.0.12 : Database - petshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`petshop` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `petshop`;

/*Table structure for table `pts_admin` */

DROP TABLE IF EXISTS `pts_admin`;

CREATE TABLE `pts_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `roleId` varchar(200) DEFAULT NULL,
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `pts_admin` */

insert  into `pts_admin`(`id`,`name`,`password`,`roleId`,`salt`) values (1,'admin','fee95e812b13dfaa18fcf5722f4288f1','1','3a8f6ced1f72570c222064784b0cf2fc'),(2,'杨莎','609b75649fc6728847df1b02a6ac5a05','2','8868ea3253631257876adbff1a337b7e'),(8,'小惠','ff7af44086b4a9270ca7c812cbd19e04','3','2e86389e2175c3e2f24620f5bfa8895b');

/*Table structure for table `pts_menu` */

DROP TABLE IF EXISTS `pts_menu`;

CREATE TABLE `pts_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `pids` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL,
  `href` varchar(255) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `clazz` varchar(255) DEFAULT NULL,
  `ishide` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `pts_menu` */

insert  into `pts_menu`(`id`,`pid`,`sort`,`pids`,`text`,`href`,`permission`,`clazz`,`ishide`) values (1,0,10000,'0','系统主页','','sys:index','lnr lnr-home',0),(2,0,20000,'0','系统管理','','sys:manage','lnr lnr-chart-bars',0),(3,2,21000,'0,2','管理员管理','','manage:admin','lnr lnr-chart-bars',0),(4,2,22000,'0,2','部门管理','','manage:dept','lnr lnr-chart-bars',0),(5,2,23000,'0,2','角色管理','/role/list','manage:role','lnr lnr-chart-bars',0),(6,2,24000,'0,2','菜单管理','/Resource/menuList','manage:menu','lnr lnr-chart-bars',0),(7,0,30000,'0','宠物管理','','pet:manage','lnr lnr-code',0),(8,0,40000,'0','宠物主人管理','','petOwner:manage','lnr lnr-cog',0),(9,0,50000,'0','宠物商店管理','','petStore:manage','lnr lnr-alarm',0),(10,3,21100,'0,2,3','管理者查看','/AdminServlet?method=adminList','manage:view',NULL,0),(11,3,21200,'0,2,3','管理者删除','/AdminServlet?method=adminDelete','manage:delete',NULL,1),(12,3,21300,'0,2,3','管理员修改','/AdminServlet?method=adminEdit','manage:edit',NULL,1),(13,3,21400,'0,2,3','管理员增加','/AdminServlet?method=adminAdd','manage:add',NULL,1),(15,7,31000,'0,7','宠物增加','/PetOwnerServlet?method=petAdd','pet:add','lnr lnr-code',1),(16,7,32000,'0,7','宠物修改','/PetOwnerServlet?method=petEdit','pet:edit','lnr lnr-code',1),(18,7,33000,'0,7','宠物删除','/PetOwnerServlet?method=petDelete','pet:delete','lnr lnr-code',1),(23,8,41000,'0,8','宠物主人列表','/petowner/list','petOwner:view','lnr lnr-cog',0),(24,9,51000,'0,9','宠物商店列表','/petstore/list','petStore:view','lnr lnr-alarm',0),(25,8,42000,'0,8','宠物主人修改','/PetOwnerServlet?method=petOwnerEdit','petOwner:edit','lnr lnr-cog',1),(26,8,43000,'0,8','宠物主人增加','/PetOwnerServlet?method=petOwnerAdd','petOwner:add','lnr lnr-cog',1),(27,8,44000,'0,8','宠物主人删除','/PetOwnerServlet?method=petOwnerDelete','petOwner:delete','lnr lnr-cog',1),(28,9,52000,'0,9','宠物商店修改','/PetStoreServlet?method=petStoreEdit','petStore:edit','lnr lnr-alarm',1),(29,9,53000,'0,9','宠物商店增加','/PetStoreServlet?method=petStoreAdd','petStore:add','lnr lnr-alarm',1),(30,9,54000,'0,9','宠物商店删除','/PetStoreServlet?method=petStoreDelete','petStore:delete','lnr lnr-alarm',1),(31,7,34000,'0,7','宠物列表','/pet/list','pet:view','lnr lnr-code',0);

/*Table structure for table `pts_pet` */

DROP TABLE IF EXISTS `pts_pet`;

CREATE TABLE `pts_pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `typename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `health` int(1) DEFAULT NULL,
  `love` int(3) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `ownerId` int(8) DEFAULT NULL,
  `storeId` int(8) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `owner_Id_fk` (`ownerId`),
  KEY `store_Id_fk` (`storeId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `pts_pet` */

insert  into `pts_pet`(`id`,`name`,`typename`,`health`,`love`,`birthday`,`ownerId`,`storeId`,`price`,`photo`) values (2,'大藏','藏獒',0,85,'2018-08-10',2,2,5000,'/Public/img/pet2.jpg'),(3,'贵子','贵宾犬',1,70,'2018-09-10',3,1,3200,'/Public/img/pet3.jpg'),(4,'小松','松狮',1,0,'2018-01-01',1,3,8000,'/Public/img/pet4.jpg'),(5,'小牧','边境牧羊犬',1,60,'2018-01-11',2,2,5500,'/Public/img/pet5.jpg'),(7,'阿吉','吉娃娃',0,20,'2018-01-01',3,2,7000,'/Public/img/pet6.jpg'),(11,'大牧','德国牧羊犬',1,100,'2018-01-01',1,3,6000,'/Public/img/pet7.jpg'),(12,'小秋','秋田犬',1,100,'2018-10-15',3,1,2800,'/Public/img/pet8.jpg'),(13,'小胡','蝴蝶犬',0,80,'2018-10-02',4,4,3000,'/Public/img/pet9.jpg'),(14,'美美','博美犬',1,99,'2018-10-09',5,1,2500,'/Public/img/pet10.jpg'),(15,'阿杜','杜宾犬',0,100,'2018-10-07',6,5,2000,'/Public/img/pet11.jpg'),(16,'旺财','柴犬',1,80,'2018-10-14',2,5,3000,'/Public/img/pet12.jpg'),(19,'哈皮','哈士奇',1,100,'2018-01-01',5,4,1500,'/Public/img/pet1.jpg');

/*Table structure for table `pts_petowner` */

DROP TABLE IF EXISTS `pts_petowner`;

CREATE TABLE `pts_petowner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `money` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `pts_petowner` */

insert  into `pts_petowner`(`id`,`name`,`password`,`money`) values (1,'小智','1234',1000),(2,'小刚','456',90),(3,'小霞','789',80),(4,'小杰','998',60),(5,'小敏','911',80),(6,'小惠','520',100),(8,'小黄','454',100),(9,'小小','6565',1000),(11,'小牛','6868',1500),(12,'美美','8888',8888),(14,'小乔','888',666);

/*Table structure for table `pts_petstore` */

DROP TABLE IF EXISTS `pts_petstore`;

CREATE TABLE `pts_petstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `balance` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `pts_petstore` */

insert  into `pts_petstore`(`id`,`name`,`password`,`balance`) values (1,'天天宠物店','12345',1500),(2,'美丽宠物店','4567',800),(3,'萌萌宠物店','6789',1000),(4,'呆萌宠物店','6868',666),(5,'精英宠物店','9999',666),(6,'惠子宠物店','9898',10000),(7,'明星宠物店','8888',9999);

/*Table structure for table `pts_role` */

DROP TABLE IF EXISTS `pts_role`;

CREATE TABLE `pts_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `resouceId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `pts_role` */

insert  into `pts_role`(`id`,`name`,`resouceId`) values (1,'超级管理员','1,2,3,4,5,6,7,8,9,10,11,12,13,15,16,18,23,24,25,26,27,28,29,30,31'),(2,'系统管理员','1,2,3,4,5,6,7,8,9,10,11,12,13'),(3,'业务管理员','15,16,18,23,24,25,26,27,28,29,30,31');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
