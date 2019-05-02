SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

use SM_Membership;

-- -----------------------------------------------------
-- Table `MembershipType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MembershipType` ;

CREATE TABLE IF NOT EXISTS `MembershipType` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AgeRange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AgeRange` ;

CREATE TABLE IF NOT EXISTS `AgeRange` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `high` INT UNSIGNED NOT NULL,
  `low` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `high_UNIQUE` (`high` ASC),
  UNIQUE INDEX `low_UNIQUE` (`low` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ethnicity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Ethnicity` ;

CREATE TABLE IF NOT EXISTS `Ethnicity` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
PACK_KEYS = Default
ROW_FORMAT = Default;


-- -----------------------------------------------------
-- Table `SpecialAccommodation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpecialAccommodation` ;

CREATE TABLE IF NOT EXISTS `SpecialAccommodation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `type_UNIQUE` (`type` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Member` ;

CREATE TABLE IF NOT EXISTS `Member` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `membershipId` INT UNSIGNED NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `ageRangeId` INT UNSIGNED NOT NULL,
  `ethnicityId` INT UNSIGNED NOT NULL DEFAULT 10001,
  `specialAccommodationId` INT UNSIGNED NOT NULL DEFAULT 10001,
  `gender` ENUM('male', 'female') NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `member_to_ethnicity_fk_idx` (`ethnicityId` ASC),
  INDEX `member_to_accommodation_fk_idx` (`specialAccommodationId` ASC),
  INDEX `member_to_membership_fk_idx` (`membershipId` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `member_to_age_fk_idx` (`ageRangeId` ASC),
  CONSTRAINT `member_to_age_fk`
    FOREIGN KEY (`ageRangeId`)
    REFERENCES `AgeRange` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `member_to_ethnicity_fk`
    FOREIGN KEY (`ethnicityId`)
    REFERENCES `Ethnicity` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `member_to_accommodation_fk`
    FOREIGN KEY (`specialAccommodationId`)
    REFERENCES `SpecialAccommodation` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `member_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `Membership` (`id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = Default;


-- -----------------------------------------------------
-- Table `Membership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Membership` ;

CREATE TABLE IF NOT EXISTS `Membership` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `membershipTypeId` INT UNSIGNED NOT NULL COMMENT 'The value of this will be one of following:\n- Seasonal Membership\n- Annual Membership',
  `isActive` BIT(1) NOT NULL,
  `primaryMemberId` INT UNSIGNED NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `membership_to_membershipType_fk_idx` (`membershipTypeId` ASC),
  UNIQUE INDEX `primaryMemberId_UNIQUE` (`primaryMemberId` ASC),
  CONSTRAINT `membership_to_membershipType_fk`
    FOREIGN KEY (`membershipTypeId`)
    REFERENCES `MembershipType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `membership_to_member`
    FOREIGN KEY (`primaryMemberId`)
    REFERENCES `Member` (`id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ContactInformation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ContactInformation` ;

CREATE TABLE IF NOT EXISTS `ContactInformation` (
  `memberId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `phoneNumber` VARCHAR(10) NULL,
  `email` VARCHAR(45) NULL,
  `companyName` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `zip` VARCHAR(10) NULL,
  `state` VARCHAR(2) NULL,
  PRIMARY KEY (`memberId`),
  UNIQUE INDEX `Id_UNIQUE` (`memberId` ASC),
  CONSTRAINT `contact_to_member_fk`
    FOREIGN KEY (`memberId`)
    REFERENCES `Member` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `IdCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `IdCard` ;

CREATE TABLE IF NOT EXISTS `IdCard` (
  `QRCode` BLOB(45) NOT NULL,
  `dateIssued` DATETIME NOT NULL,
  `isActive` BIT(1) NOT NULL,
  `memberId` INT UNSIGNED NOT NULL,
  UNIQUE INDEX `QRCode_UNIQUE` (`QRCode`(255) ASC),
  PRIMARY KEY (`QRCode` (255) ASC),
  INDEX `id_card_to_membership_fk_idx` (`memberId` ASC),
  CONSTRAINT `id_card_to_membership_fk`
    FOREIGN KEY (`memberId`)
    REFERENCES `Member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Reason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Reason` ;

CREATE TABLE IF NOT EXISTS `Reason` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Suspension`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Suspension` ;

CREATE TABLE IF NOT EXISTS `Suspension` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `membershipId` INT UNSIGNED NOT NULL,
  `start` DATETIME NOT NULL,
  `end` DATETIME NULL,
  `reasonId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Id_UNIQUE` (`id` ASC),
  INDEX `membership_Id_idx` (`membershipId` ASC),
  INDEX `start_index` (`start` ASC),
  INDEX `suspension_to_reason_fk_idx` (`reasonId` ASC),
  CONSTRAINT `suspension_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `suspension_to_reason_fk`
    FOREIGN KEY (`reasonId`)
    REFERENCES `Reason` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RenewalNotice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RenewalNotice` ;

CREATE TABLE IF NOT EXISTS `RenewalNotice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dateIssued` DATETIME NOT NULL,
  `membershipId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `renewal_notice_to_membership_fk_idx` (`membershipId` ASC),
  CONSTRAINT `renewal_notice_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `VenueType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `VenueType` ;

CREATE TABLE IF NOT EXISTS `VenueType` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Staff` ;

CREATE TABLE IF NOT EXISTS `Staff` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DriverToMembership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DriverToMembership` ;

CREATE TABLE IF NOT EXISTS `DriverToMembership` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `reasonId` INT UNSIGNED NOT NULL,
  `staffId` INT UNSIGNED NULL,
  `membershipId` INT UNSIGNED NOT NULL,
  `venueId` INT UNSIGNED NULL,
  `otherReason` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `membership_Id_UNIQUE` (`membershipId` ASC),
  INDEX `driver_to_venue_fk_idx` (`venueId` ASC),
  INDEX `driver_to_reason_fk_idx` (`reasonId` ASC),
  INDEX `driver_to_staff_fk_idx` (`staffId` ASC),
  CONSTRAINT `joining_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `driver_to_venue_fk`
    FOREIGN KEY (`venueId`)
    REFERENCES `VenueType` (`id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT `driver_to_reason_fk`
    FOREIGN KEY (`reasonId`)
    REFERENCES `Reason` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `driver_to_staff_fk`
    FOREIGN KEY (`staffId`)
    REFERENCES `Staff` (`id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Encounter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Encounter` ;

CREATE TABLE IF NOT EXISTS `Encounter` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `venueTypeId` INT UNSIGNED NOT NULL,
  `timeStamp` DATETIME NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `encounter_to_venue_fk_idx` (`venueTypeId` ASC),
  CONSTRAINT `encounter_to_venue_fk`
    FOREIGN KEY (`venueTypeId`)
    REFERENCES `VenueType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
PACK_KEYS = Default;


-- -----------------------------------------------------
-- Table `MemberEncounterLink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MemberEncounterLink` ;

CREATE TABLE IF NOT EXISTS `MemberEncounterLink` (
  `encounterId` INT UNSIGNED NOT NULL,
  `memberId` INT UNSIGNED NOT NULL COMMENT 'Contains either the Secondary Member’s Id or the Primary Member’s Id\n',
  PRIMARY KEY (`memberId`, `encounterId`),
  INDEX `link_to_member_fk_idx` (`memberId` ASC),
  CONSTRAINT `link_to_encounter_fk`
    FOREIGN KEY (`encounterId`)
    REFERENCES `Encounter` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `link_to_member_fk`
    FOREIGN KEY (`memberId`)
    REFERENCES `Member` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MembershipPeriod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MembershipPeriod` ;

CREATE TABLE IF NOT EXISTS `MembershipPeriod` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `membershipId` INT UNSIGNED NOT NULL,
  `start` DATETIME NOT NULL,
  `end` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `membership_period_to_membership_fk_idx` (`membershipId` ASC),
  CONSTRAINT `membership_period_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Attendees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Attendees` ;

CREATE TABLE IF NOT EXISTS `Attendees` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `encounterId` INT UNSIGNED NOT NULL,
  `ageRangeId` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `attendees_encounter_fk_idx` (`encounterId` ASC),
  INDEX `attendees_ageRange_fk_idx` (`ageRangeId` ASC),
  CONSTRAINT `attendees_encounter_fk`
    FOREIGN KEY (`encounterId`)
    REFERENCES `Encounter` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `attendees_ageRange_fk`
    FOREIGN KEY (`ageRangeId`)
    REFERENCES `AgeRange` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `AgeRange`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `AgeRange` (`id`, `high`, `low`) VALUES (DEFAULT, 31, 18);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Ethnicity`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `Ethnicity` (`id`, `name`) VALUES (10001, 'Unknown');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpecialAccommodation`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `SpecialAccommodation` (`id`, `type`) VALUES (10001, 'None');

COMMIT;

-- -----------------------------------------------------
-- Data for table `MembershipType`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `MembershipType` (`id`, `name`) VALUES (10001, 'Annual');

COMMIT;

