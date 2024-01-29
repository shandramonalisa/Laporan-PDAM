/*
SQLyog Ultimate v8.55 
MySQL - 5.5.5-10.4.28-MariaDB : Database - dbpetshop_klp6
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dbpetshop_klp6` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `dbpetshop_klp6`;

/*Table structure for table `barang` */

DROP TABLE IF EXISTS `barang`;

CREATE TABLE `barang` (
  `barangid` char(10) NOT NULL,
  `barangnama` varchar(50) DEFAULT NULL,
  `barangmerkid` char(10) DEFAULT NULL,
  `barangjenisid` char(10) DEFAULT NULL,
  `barangsupplierid` char(10) DEFAULT NULL,
  `barangsatuan` varchar(20) DEFAULT NULL,
  `barangharga` double DEFAULT NULL,
  `barangstok` int(255) DEFAULT NULL,
  PRIMARY KEY (`barangid`),
  KEY `barangmerkid` (`barangmerkid`),
  KEY `barangjenisid` (`barangjenisid`),
  KEY `barangsupplierid` (`barangsupplierid`),
  CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`barangmerkid`) REFERENCES `merk` (`idmerk`) ON UPDATE CASCADE,
  CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`barangjenisid`) REFERENCES `jenis` (`idjenis`) ON UPDATE CASCADE,
  CONSTRAINT `barang_ibfk_3` FOREIGN KEY (`barangsupplierid`) REFERENCES `supplier` (`supplierid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `barang` */

LOCK TABLES `barang` WRITE;

insert  into `barang`(`barangid`,`barangnama`,`barangmerkid`,`barangjenisid`,`barangsupplierid`,`barangsatuan`,`barangharga`,`barangstok`) values ('B001','Makanan Kucing','M002','J001','S002','Bks',85000,100),('B002','Obat Parasit','M003','J001','S001','Btl',60000,100),('B003','Kandang Hewan','M003','J003','S002','Unit',135000,100),('B004','Sisir Kucing','M003','J002','S002','Pcs',12000,50),('B005','Kalung Kucing','M001','J002','S001','Pcs',25000,100),('B006','Vitamin Hewan','M002','J001','S001','Bks',14000,100),('B007','Pasir Kucing','M003','J002','S002','Bks',50000,50),('B008','Mainan Hewan','M003','J002','S002','Unit',45000,50),('B009','Set Alat Makan Hewan','M003','J002','S002','Unit',90000,100);

UNLOCK TABLES;

/*Table structure for table `jenis` */

DROP TABLE IF EXISTS `jenis`;

CREATE TABLE `jenis` (
  `idjenis` char(10) NOT NULL,
  `namajenis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idjenis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `jenis` */

LOCK TABLES `jenis` WRITE;

insert  into `jenis`(`idjenis`,`namajenis`) values ('J001','Makanan'),('J002','Aksesoris'),('J003','Kandang');

UNLOCK TABLES;

/*Table structure for table `merk` */

DROP TABLE IF EXISTS `merk`;

CREATE TABLE `merk` (
  `idmerk` char(10) NOT NULL,
  `namamerk` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idmerk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `merk` */

LOCK TABLES `merk` WRITE;

insert  into `merk`(`idmerk`,`namamerk`) values ('M001','Royal Cats'),('M002','Wishkas'),('M003','Winter');

UNLOCK TABLES;

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `supplierid` char(10) NOT NULL,
  `suppliernama` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `nohp` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`supplierid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `supplier` */

LOCK TABLES `supplier` WRITE;

insert  into `supplier`(`supplierid`,`suppliernama`,`alamat`,`nohp`) values ('S001','RCC Store','Jl. Pampangan ','021 45678'),('S002','TJ Store','Jl. Damar ','021 67890');

UNLOCK TABLES;

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `t_idbarang` char(10) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `harga` double DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `t_idbarang` (`t_idbarang`),
  KEY `id_transaksi` (`id_transaksi`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`t_idbarang`) REFERENCES `barang` (`barangid`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transaksi` */

LOCK TABLES `transaksi` WRITE;

insert  into `transaksi`(`id_transaksi`,`tanggal`,`t_idbarang`,`qty`,`total`,`harga`) values (1,'2024-01-01','B001',2,170000,85000),(2,'2024-01-03','B003',1,135000,135000),(3,'2024-01-10','B002',2,120000,60000),(4,'2024-01-17','B006',3,42000,14000);

UNLOCK TABLES;

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `iduser` char(10) NOT NULL,
  `namauser` varchar(30) DEFAULT NULL,
  `password` char(200) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `user` */

LOCK TABLES `user` WRITE;

insert  into `user`(`iduser`,`namauser`,`password`,`level`) values ('A001','Hana','$2y$10$VSLxvLye3U0RXxsFahIapuCTJqbbvG8pFl3INAYNFzVhLMoR68i4.',1),('A002','Suzy','$2y$10$/ckLplWnTIXrOKFiltGYvOgXtVSHvJIopbCdO7o7aXn.F/ou/zXIi',2);

UNLOCK TABLES;

/* Trigger structure for table `transaksi` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `tai_transaksi` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `tai_transaksi` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
update barang set barangstok=barangstok - new.qty where barangid=new.t_idbarang;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
