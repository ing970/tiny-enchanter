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
-- Table structure for table `checkbox`
--

DROP TABLE IF EXISTS `checkbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkbox` (
  `Checkbox_id` int NOT NULL,
  `Category_id` int NOT NULL,
  `Type_number` int NOT NULL,
  `Checkbox_p_prompt` varchar(255) DEFAULT NULL,
  `Checkbox_n_prompt` text,
  PRIMARY KEY (`Checkbox_id`),
  KEY `fk_checkbox_item_category_idx` (`Category_id`),
  CONSTRAINT `fk_checkbox_category` FOREIGN KEY (`Category_id`) REFERENCES `category` (`Category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkbox`
--

LOCK TABLES `checkbox` WRITE;
/*!40000 ALTER TABLE `checkbox` DISABLE KEYS */;
INSERT INTO `checkbox` VALUES (0,0,0,'(chibi), anime drawing, simple, only character, full body, the front of full body, standing, 4K, 8K, best quality, masterpiece, (white background), solo, SD, {SD}','(jpeg artifacts), (blurry), (blurred), (blur), bad anatomy, worst quality, bad quality, disfigured, deformed, malformed, mutant, gross, disgusting, out of frame, monochrome, poorly drawn, extra limbs, extra fingers, missing limbs, misshaped, poorly drawn, mutated hands and fingers, ugly, fat, cubism, text, logo, duplicate, bad eyes, misaligned eyes, deformed mouth, lowres, signature, watermark, username, dots, error, cropped, easynegative, material, halo'),(101,1,1,' one girl, cute, smile, light smile, happy',NULL),(102,1,2,'((one boy), (male focus), (short hair), (male hair), (male))',NULL),(201,2,1,NULL,'fused animal ears, animal ears on human, tail on human'),(202,2,2,'animal ears, animal ears fluff',NULL),(301,3,1,NULL,'tail on human, tail, animal tail, cat tail, dog tail'),(302,3,2,'cat tail',NULL),(303,3,3,'dog tail, wolf tail',NULL),(401,4,1,'short hair',''),(402,4,2,'long hair',NULL),(403,4,3,'pigtails hair',NULL),(404,4,4,'updo, updo hair, bun, bun hair',NULL),(405,4,5,'braided hair, plaits hair',NULL),(406,4,6,'ponytail',NULL),(501,5,1,NULL,' (hair ornament:1.4, headgear:1.4, hat:1.4, hair accessory:1.4, headpiece:1.4)'),(502,5,2,'hair clip, hair ornament',NULL),(503,5,3,'hair flower, hair ornament',NULL),(504,5,4,'hair ribbon, hair ornament',NULL),(505,5,5,'hat',NULL),(601,6,1,'pink',NULL),(602,6,2,'red',NULL),(603,6,3,'orange',NULL),(604,6,4,'blond',NULL),(605,6,5,'green',NULL),(606,6,6,'blue',NULL),(607,6,7,'purple',NULL),(608,6,8,'brown',NULL),(609,6,9,'white',NULL),(610,6,10,'black',NULL),(701,7,1,'pink',NULL),(702,7,2,'red',NULL),(703,7,3,'orange',NULL),(704,7,4,'yellow',NULL),(705,7,5,'green',NULL),(706,7,6,'blue',NULL),(707,7,7,'purple',NULL),(708,7,8,'brown',NULL),(709,7,9,'black',NULL),(801,8,1,'<lora:last1234:0.5>, red hanbok',NULL),(802,8,2,'dress',NULL),(803,8,3,'kimono',NULL),(804,8,4,'hakama',NULL),(805,8,5,'school uniform',NULL),(806,8,6,'pajama',NULL),(899,8,99,'<lora:last:0.3>, hanbok, bandana',NULL);
/*!40000 ALTER TABLE `checkbox` ENABLE KEYS */;
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

-- Dump completed on 2023-06-14 11:50:35
