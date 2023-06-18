-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: nini.ccggztrbdcst.us-east-2.rds.amazonaws.com    Database: NINI
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `client_order`
--

DROP TABLE IF EXISTS `client_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_order` (
  `Serial_id` char(5) NOT NULL,
  `Serial_type` int NOT NULL,
  `Checkbox_id` int NOT NULL,
  PRIMARY KEY (`Serial_id`),
  KEY `fk_checkbox_checbox_item_idx` (`Checkbox_id`),
  CONSTRAINT `fk_client_order_checbox` FOREIGN KEY (`Checkbox_id`) REFERENCES `checkbox` (`Checkbox_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_order`
--

LOCK TABLES `client_order` WRITE;
/*!40000 ALTER TABLE `client_order` DISABLE KEYS */;
INSERT INTO `client_order` VALUES ('00000',0,0),('10101',1,101),('10102',1,102),('20201',2,201),('20202',2,202),('30301',3,301),('30302',3,302),('30303',3,303),('30401',3,401),('30402',3,402),('30403',3,403),('30404',3,404),('30405',3,405),('30406',3,406),('30501',3,501),('30502',3,502),('30503',3,503),('30504',3,504),('30505',3,505),('30601',3,601),('30602',3,602),('30603',3,603),('30604',3,604),('30605',3,605),('30606',3,606),('30607',3,607),('30608',3,608),('30609',3,609),('30610',3,610),('30701',3,701),('30702',3,702),('30703',3,703),('30704',3,704),('30705',3,705),('30706',3,706),('30707',3,707),('30708',3,708),('30709',3,709),('30801',3,801),('30802',3,802),('30803',3,803),('30804',3,804),('30805',3,805),('30806',3,806),('30899',3,899);
/*!40000 ALTER TABLE `client_order` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-14 11:50:29
