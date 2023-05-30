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
-- Table `NINI`.`checkpoint_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NINI`.`checkpoint_model` (
  `Cp_model_id` INT NOT NULL,
  `Cp_model_name` CHAR(50) NULL,
  PRIMARY KEY (`Cp_model_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NINI`.`client_order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NINI`.`client_order` (
  `Serial_id` CHAR(7) NOT NULL,
  `Serial_type` INT NOT NULL,
  `Checkbox_id` INT NOT NULL,
  `Cp_model_id` INT NULL,
  PRIMARY KEY (`Serial_id`),
  INDEX `fk_checkbox_checbox_item_idx` (`Checkbox_id` ASC) VISIBLE,
  INDEX `fk_checkbox_checkpoint_model_idx` (`Cp_model_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_order_checbox`
    FOREIGN KEY (`Checkbox_id`)
    REFERENCES `NINI`.`checkbox` (`Checkbox_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_client_order_checkpoint_model`
    FOREIGN KEY (`Cp_model_id`)
    REFERENCES `NINI`.`checkpoint_model` (`Cp_model_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NINI`.`result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NINI`.`result` (
  `No` INT NOT NULL AUTO_INCREMENT,
  `Serial_id` CHAR(7) NULL,
  `Created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`No`),
  INDEX `fk_result_checkbox_idx` (`Serial_id` ASC) VISIBLE,
  CONSTRAINT `fk_result_client_order`
    FOREIGN KEY (`Serial_id`)
    REFERENCES `NINI`.`client_order` (`Serial_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `NINI`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `NINI`;
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (01, '성별');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (02, '동물귀');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (03, '머리 길이');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (04, '머리색');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (05, '눈색');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (06, '꼬리');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (07, '머리 장식');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (08, '옷');
INSERT INTO `NINI`.`category` (`Category_id`, `Category_name`) VALUES (00, '기본 값');

COMMIT;


-- -----------------------------------------------------
-- Data for table `NINI`.`checkbox`
-- -----------------------------------------------------
START TRANSACTION;
USE `NINI`;
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0101, 01, 01, '1 girl', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0102, 01, 02, '1 boy', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0201, 02, 01, 'animal ears', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0301, 03, 01, 'short hair', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0302, 03, 02, 'long hair', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0401, 04, 01, '{color} hair', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0501, 05, 01, '{color} eyes', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0601, 06, 01, 'tail', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0701, 07, 01, 'hair ribbon', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0702, 07, 02, 'hair clip', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0703, 07, 03, 'hair flower', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0704, 07, 04, 'ribbon', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0705, 07, 05, 'black ribbon', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0706, 07, 06, 'star hair ornament', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0801, 08, 01, 'dress', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0802, 08, 02, 'princess dress', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0803, 08, 03, 'apanese clothes', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0804, 08, 04, 'kimono', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0805, 08, 05, 'hakama', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0806, 08, 06, 'school uniform', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0807, 08, 07, 'pajama', NULL);
INSERT INTO `NINI`.`checkbox` (`Checkbox_id`, `Category_id`, `Type_number`, `Checkbox_p_prompt`, `Checkbox_n_prompt`) VALUES (0000, 00, 00, '(chibi), anime drawing, simple, only chracter, full body, the front of full body, standing, 4K, 8K, best quality, masterpiece, (white background), solo', '(jpeg artifacts), (blurry), (blurred), (blur), bad anatomy, worst quality, bad quality, disfigured, deformed, malformed, mutant, gross, disgusting, out of frame, monochrome, poorly drawn, extra limbs, extra fingers, missing limbs, misshaped, poorly drawn, mutated hands and fingers, ugly, fat, cubism, text, logo, duplicate, bad eyes, misaligned eyes, deformed mouth, lowres, signature, watermark, username, dots, error, cropped, easynegative');

COMMIT;


-- -----------------------------------------------------
-- Data for table `NINI`.`checkpoint_model`
-- -----------------------------------------------------
START TRANSACTION;
USE `NINI`;
INSERT INTO `NINI`.`checkpoint_model` (`Cp_model_id`, `Cp_model_name`) VALUES (01, 'qteamixQ_gamma');
INSERT INTO `NINI`.`checkpoint_model` (`Cp_model_id`, `Cp_model_name`) VALUES (02, 'meinamix_meinaV9');
INSERT INTO `NINI`.`checkpoint_model` (`Cp_model_id`, `Cp_model_name`) VALUES (03, 'cetusMix_Coda2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `NINI`.`client_order`
-- -----------------------------------------------------
START TRANSACTION;
USE `NINI`;
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('1010101', 1, 0101, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('1010201', 1, 0102, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3020101', 3, 0201, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('2030101', 2, 0301, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('2030201', 2, 0302, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3040101', 3, 0401, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3050101', 3, 0501, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3060101', 3, 0601, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3070101', 3, 0701, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3070201', 3, 0702, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3070301', 3, 0703, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3070401', 3, 0704, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3070501', 3, 0705, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3070601', 3, 0706, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3080101', 3, 0801, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3080201', 3, 0802, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3080301', 3, 0803, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3080401', 3, 0804, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3080501', 3, 0805, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3080601', 3, 0806, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('3080701', 3, 0807, 01);
INSERT INTO `NINI`.`client_order` (`Serial_id`, `Serial_type`, `Checkbox_id`, `Cp_model_id`) VALUES ('0000000', 0, 0000, 00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `NINI`.`result`
-- -----------------------------------------------------
START TRANSACTION;
USE `NINI`;
INSERT INTO `NINI`.`result` (`No`, `Serial_id`, `Created_at`) VALUES (01, NULL, NULL);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
