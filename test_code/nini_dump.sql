-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: NINI
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `Category_id` int NOT NULL,
  `Category_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`Category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (0,'기본 값'),(1,'성별'),(2,'동물귀'),(3,'꼬리'),(4,'머리 스타일'),(5,'머리 장식'),(6,'머리색'),(7,'눈색'),(8,'옷 스타일');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `checkbox` VALUES (0,0,0,'(chibi), anime drawing, simple, only character, full body, the front of full body, standing, 4K, 8K, best quality, masterpiece, (white background), solo, SD, {SD}','(jpeg artifacts), (blurry), (blurred), (blur), bad anatomy, worst quality, bad quality, disfigured, deformed, malformed, mutant, gross, disgusting, out of frame, monochrome, poorly drawn, extra limbs, extra fingers, missing limbs, misshaped, poorly drawn, mutated hands and fingers, ugly, fat, cubism, text, logo, duplicate, bad eyes, misaligned eyes, deformed mouth, lowres, signature, watermark, username, dots, error, cropped, easynegative, material, halo'),(101,1,1,' one girl, cute, smile, light smile, happy',NULL),(102,1,2,'(one boy), (male focus), (short hair), (male hair), (male)',NULL),(201,2,1,NULL,'fused animal ears, animal ears on human, tail on human'),(202,2,2,'animal ears, animal ears fluff',NULL),(301,3,1,NULL,'tail on human, tail, animal tail, cat tail, dog tail'),(302,3,2,'cat tail',NULL),(303,3,3,'dog tail, wolf tail',NULL),(401,4,1,'short hair',''),(402,4,2,'long hair',NULL),(403,4,3,'pigtails hair, plaits hair',NULL),(404,4,4,'updo, updo hair, bun, bun hair',NULL),(405,4,5,'braided hair',NULL),(406,4,6,'ponytail',NULL),(501,5,1,NULL,' (hair ornament:1.4, headgear:1.4, hat:1.4, hair accessory:1.4, headpiece:1.4)'),(502,5,2,'hair clip, hair ornament',NULL),(503,5,3,'hair flower',NULL),(504,5,4,'hair ribbon',NULL),(505,5,5,'hat',NULL),(601,6,1,'pink',NULL),(602,6,2,'red',NULL),(603,6,3,'orange',NULL),(604,6,4,'blond',NULL),(605,6,5,'green',NULL),(606,6,6,'blue',NULL),(607,6,7,'purple',NULL),(608,6,8,'brown',NULL),(609,6,9,'white',NULL),(610,6,10,'black',NULL),(701,7,1,'pink',NULL),(702,7,2,'red',NULL),(703,7,3,'orange',NULL),(704,7,4,'yellow',NULL),(705,7,5,'green',NULL),(706,7,6,'blue',NULL),(707,7,7,'purple',NULL),(708,7,8,'brown',NULL),(709,7,9,'black',NULL),(801,8,1,'<lora:last1234:0.5>, (color) hanbok',NULL),(802,8,2,'dress',NULL),(803,8,3,'kimono',NULL),(804,8,4,'hakama',NULL),(805,8,5,'school uniform',NULL),(806,8,6,'pajama',NULL),(899,8,99,'<lora:BlueSD:0.5>, <lora:maplestory20:.0.2>, <lora:GenshinStickers:0.7>, <lora:last:0.3>, hanbok, bandana',NULL);
/*!40000 ALTER TABLE `checkbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkpoint_model`
--

DROP TABLE IF EXISTS `checkpoint_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkpoint_model` (
  `Cp_model_id` int NOT NULL,
  `Cp_model_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`Cp_model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkpoint_model`
--

LOCK TABLES `checkpoint_model` WRITE;
/*!40000 ALTER TABLE `checkpoint_model` DISABLE KEYS */;
INSERT INTO `checkpoint_model` VALUES (1,'qteamixQ_gamma'),(2,'meinamix_meinaV9'),(3,'cetusMix_Coda2');
/*!40000 ALTER TABLE `checkpoint_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_order`
--

DROP TABLE IF EXISTS `client_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_order` (
  `Serial_id` char(7) NOT NULL,
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

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `No` int NOT NULL AUTO_INCREMENT,
  `Serial_id` char(7) DEFAULT NULL,
  `Created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`No`),
  KEY `fk_result_checkbox_idx` (`Serial_id`),
  CONSTRAINT `fk_result_client_order` FOREIGN KEY (`Serial_id`) REFERENCES `client_order` (`Serial_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,NULL,NULL);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-02 19:46:03
