-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema NINI
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema NINI
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NINI` DEFAULT CHARACTER SET utf8 ;
USE `NINI` ;

-- -----------------------------------------------------
-- Table `NINI`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NINI`.`category` (
  `Category_id` INT NOT NULL,
  `Category_name` CHAR(50) NULL,
  PRIMARY KEY (`Category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NINI`.`checkbox`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NINI`.`checkbox` (
  `Checkbox_id` INT NOT NULL,
  `Category_id` INT NOT NULL,
  `Type_number` INT NOT NULL,
  `Checkbox_p_prompt` VARCHAR(255) NULL,
  `Checkbox_n_prompt` TEXT NULL,
  INDEX `fk_checkbox_item_category_idx` (`Category_id` ASC) VISIBLE,
  PRIMARY KEY (`Checkbox_id`),
  CONSTRAINT `fk_checkbox_category`
    FOREIGN KEY (`Category_id`)
    REFERENCES `NINI`.`category` (`Category_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NINI`.`client_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NINI`.`client_order` (
  `Serial_id` CHAR(5) NOT NULL,
  `Serial_type` INT NOT NULL,
  `Checkbox_id` INT NOT NULL,
  PRIMARY KEY (`Serial_id`),
  INDEX `fk_checkbox_checbox_item_idx` (`Checkbox_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_order_checbox`
    FOREIGN KEY (`Checkbox_id`)
    REFERENCES `NINI`.`checkbox` (`Checkbox_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NINI`.`checkpoint_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NINI`.`checkpoint_model` (
  `Cp_model_id` INT NOT NULL,
  `Cp_model_name` CHAR(50) NULL,
  PRIMARY KEY (`Cp_model_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NINI`.`result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NINI`.`result` (
  `No` INT NOT NULL AUTO_INCREMENT,
  `Image` LONGBLOB,
  `Created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`No`))
  
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `NINI`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `NINI`;
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (01, '성별');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (02, '동물귀');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (03, '꼬리');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (04, '머리 스타일');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (05, '머리 장식');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (06, '머리색');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (07, '눈색');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (08, '옷 스타일');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (00, '기본 값');

COMMIT;


-- -----------------------------------------------------
-- Data for table `NINI`.`checkbox`
-- -----------------------------------------------------
START TRANSACTION;
USE `NINI`;
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0000, 00, 00, '(chibi), anime drawing, simple, only character, full body, the front of full body, standing, 4K, 8K, best quality, masterpiece, (white background), solo, SD, {SD}', '(jpeg artifacts), (blurry), (blurred), (blur), bad anatomy, worst quality, bad quality, disfigured, deformed, malformed, mutant, gross, disgusting, out of frame, monochrome, poorly drawn, extra limbs, extra fingers, missing limbs, misshaped, poorly drawn, mutated hands and fingers, ugly, fat, cubism, text, logo, duplicate, bad eyes, misaligned eyes, deformed mouth, lowres, signature, watermark, username, dots, error, cropped, easynegative, material, halo');
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0101, 01, 01, ' one girl, cute, smile, light smile, happy', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0102, 01, 02, '(one boy), (male focus), (short hair), (male hair), (male)', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0201, 02, 01, NULL, 'fused animal ears, animal ears on human, tail on human');
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0202, 02, 02, 'animal ears, animal ears fluff', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0301, 03, 01, NULL, 'tail on human, tail, animal tail, cat tail, dog tail');
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0302, 03, 02, 'cat tail', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0303, 03, 03, 'dog tail, wolf tail', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0401, 04, 01, 'short hair', '');
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0402, 04, 02, 'long hair', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0403, 04, 03, 'pigtails hair, plaits hair', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0404, 04, 04, 'updo, updo hair, bun, bun hair', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0405, 04, 05, 'braided hair', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0406, 04, 06, 'ponytail', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0501, 05, 01, NULL, ' (hair ornament:1.4, headgear:1.4, hat:1.4, hair accessory:1.4, headpiece:1.4)');
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0502, 05, 02, 'hair clip, hair ornament', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0503, 05, 03, 'hair flower', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0504, 05, 04, 'hair ribbon', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0505, 05, 05, 'hat', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0601, 06, 01, 'pink', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0602, 06, 02, 'red', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0603, 06, 03, 'orange', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0604, 06, 04, 'blond', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0605, 06, 05, 'green', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0606, 06, 06, 'blue', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0607, 06, 07, 'purple', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0608, 06, 08, 'brown', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0609, 06, 09, 'white', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0610, 06, 10, 'black', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0701, 07, 01, 'pink', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0702, 07, 02, 'red', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0703, 07, 03, 'orange', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0704, 07, 04, 'yellow', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0705, 07, 05, 'green', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0706, 07, 06, 'blue', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0707, 07, 07, 'purple', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0708, 07, 08, 'brown', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0709, 07, 09, 'black', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0801, 08, 01, '<lora:last1234:0.5>, red hanbok', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0802, 08, 02, 'dress', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0803, 08, 03, 'kimono', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0804, 08, 04, 'hakama', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0805, 08, 05, 'school uniform', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0806, 08, 06, 'pajama', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0899, 08, 99, 'hanbok, bandana', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `NINI`.`client_order`
-- -----------------------------------------------------
START TRANSACTION;
USE `NINI`;
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('00000', 0, 0000);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('10101', 1, 0101);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('10102', 1, 0102);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('20201', 2, 0201);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('20202', 2, 0202);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30301', 3, 0301);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30302', 3, 0302);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30303', 3, 0303);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30401', 3, 0401);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30402', 3, 0402);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30403', 3, 0403);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30404', 3, 0404);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30405', 3, 0405);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30406', 3, 0406);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30501', 3, 0501);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30502', 3, 0502);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30503', 3, 0503);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30504', 3, 0504);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30505', 3, 0505);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30601', 3, 0601);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30602', 3, 0602);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30603', 3, 0603);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30604', 3, 0604);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30605', 3, 0605);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30606', 3, 0606);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30607', 3, 0607);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30608', 3, 0608);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30609', 3, 0609);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30610', 3, 0610);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30701', 3, 0701);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30702', 3, 0702);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30703', 3, 0703);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30704', 3, 0704);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30705', 3, 0705);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30706', 3, 0706);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30707', 3, 0707);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30708', 3, 0708);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30709', 3, 0709);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30801', 3, 0801);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30802', 3, 0802);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30803', 3, 0803);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30804', 3, 0804);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30805', 3, 0805);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30806', 3, 0806);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`) VALUES ('30899', 3, 0899);

COMMIT;


-- -----------------------------------------------------
-- Data for table `NINI`.`checkpoint_model`
-- -----------------------------------------------------
START TRANSACTION;
USE `NINI`;
INSERT INTO `NINI`.`checkpoint_model` (`Cp_model_id`, `Cp_model_name`) VALUES (01, 'qteamixQ_gamma');
INSERT INTO `NINI`.`checkpoint_model` (`Cp_model_id`, `Cp_model_name`) VALUES (02, 'meinamix_meinaV10');
INSERT INTO `NINI`.`checkpoint_model` (`Cp_model_id`, `Cp_model_name`) VALUES (03, 'cetusMix_Coda2');

COMMIT;




SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
