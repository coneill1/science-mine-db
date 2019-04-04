-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SM_Membership_Test
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SM_Membership_Test` ;

-- -----------------------------------------------------
-- Schema SM_Membership_Test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SM_Membership_Test` DEFAULT CHARACTER SET utf8 ;
USE `SM_Membership_Test` ;

-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`MembershipType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`MembershipType` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`MembershipType` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`AgeRange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`AgeRange` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`AgeRange` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `high` INT UNSIGNED NOT NULL,
  `low` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`Ethnicity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`Ethnicity` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`Ethnicity` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`SpecialAccommodation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`SpecialAccommodation` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`SpecialAccommodation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`Member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`Member` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`Member` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `membershipId` INT UNSIGNED NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `ageRangeId` INT UNSIGNED NOT NULL,
  `ethnicityId` INT UNSIGNED NULL,
  `specialAccommodationId` INT UNSIGNED NULL,
  `gender` ENUM('male', 'female') NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `member_to_age_fk_idx` (`ageRangeId` ASC),
  INDEX `member_to_ethnicity_fk_idx` (`ethnicityId` ASC),
  INDEX `member_to_accommodation_fk_idx` (`specialAccommodationId` ASC),
  INDEX `member_to_membership_fk_idx` (`membershipId` ASC),
  CONSTRAINT `member_to_age_fk`
    FOREIGN KEY (`ageRangeId`)
    REFERENCES `SM_Membership_Test`.`AgeRange` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `member_to_ethnicity_fk`
    FOREIGN KEY (`ethnicityId`)
    REFERENCES `SM_Membership_Test`.`Ethnicity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `member_to_accommodation_fk`
    FOREIGN KEY (`specialAccommodationId`)
    REFERENCES `SM_Membership_Test`.`SpecialAccommodation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `member_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `SM_Membership_Test`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`Membership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`Membership` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`Membership` (
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
    REFERENCES `SM_Membership_Test`.`MembershipType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `membership_to_member`
    FOREIGN KEY (`primaryMemberId`)
    REFERENCES `SM_Membership_Test`.`Member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`ContactInformation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`ContactInformation` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`ContactInformation` (
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
    REFERENCES `SM_Membership_Test`.`Member` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`IdCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`IdCard` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`IdCard` (
  `QRCode` BLOB(45) NOT NULL,
  `dateIssued` DATETIME NOT NULL,
  `isActive` BIT(1) NOT NULL,
  `membershipId` INT UNSIGNED NOT NULL,
  INDEX `id_card_to_membership_fk_idx` (`membershipId` ASC),
  UNIQUE INDEX `QRCode_UNIQUE` (`QRCode`(255) ASC),
  PRIMARY KEY (`QRCode` (255) ASC),
  CONSTRAINT `id_card_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `SM_Membership_Test`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`Reason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`Reason` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`Reason` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`Suspension`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`Suspension` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`Suspension` (
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
    REFERENCES `SM_Membership_Test`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `suspension_to_reason_fk`
    FOREIGN KEY (`reasonId`)
    REFERENCES `SM_Membership_Test`.`Reason` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`RenewalNotice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`RenewalNotice` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`RenewalNotice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dateIssued` DATETIME NOT NULL,
  `membershipId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `renewal_notice_to_membership_fk_idx` (`membershipId` ASC),
  CONSTRAINT `renewal_notice_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `SM_Membership_Test`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`Venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`Venue` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`Venue` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`Staff` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`Staff` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`DriverToMembership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`DriverToMembership` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`DriverToMembership` (
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
    REFERENCES `SM_Membership_Test`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `driver_to_venue_fk`
    FOREIGN KEY (`venueId`)
    REFERENCES `SM_Membership_Test`.`Venue` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `driver_to_reason_fk`
    FOREIGN KEY (`reasonId`)
    REFERENCES `SM_Membership_Test`.`Reason` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `driver_to_staff_fk`
    FOREIGN KEY (`staffId`)
    REFERENCES `SM_Membership_Test`.`Staff` (`id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`Encounter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`Encounter` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`Encounter` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `venueId` INT UNSIGNED NOT NULL,
  `timeStamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `encounter_to_venue_fk_idx` (`venueId` ASC),
  CONSTRAINT `encounter_to_venue_fk`
    FOREIGN KEY (`venueId`)
    REFERENCES `SM_Membership_Test`.`Venue` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`AttendeeType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`AttendeeType` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`AttendeeType` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`EncounterLink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`EncounterLink` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`EncounterLink` (
  `encounterId` INT UNSIGNED NOT NULL,
  `attendeeTypeId` INT UNSIGNED NOT NULL COMMENT 'The attendee type will be the following values:\n- Primary Member\n- Secondary Member\n- Visitor',
  `ageRangeId` INT UNSIGNED NOT NULL,
  `gender` ENUM('male', 'female') NOT NULL,
  `memberId` INT UNSIGNED NULL COMMENT 'Contains either the Secondary Member’s Id or the Primary Member’s Id\n',
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  INDEX `link_to_age_range_fk_idx` (`ageRangeId` ASC),
  INDEX `encounter_to_attendee_type_fk_idx` (`attendeeTypeId` ASC),
  INDEX `link_to_member_fk_idx` (`memberId` ASC),
  CONSTRAINT `link_to_encounter_fk`
    FOREIGN KEY (`encounterId`)
    REFERENCES `SM_Membership_Test`.`Encounter` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `link_to_age_range_fk`
    FOREIGN KEY (`ageRangeId`)
    REFERENCES `SM_Membership_Test`.`AgeRange` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `encounter_to_attendee_type_fk`
    FOREIGN KEY (`attendeeTypeId`)
    REFERENCES `SM_Membership_Test`.`AttendeeType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `link_to_member_fk`
    FOREIGN KEY (`memberId`)
    REFERENCES `SM_Membership_Test`.`Member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership_Test`.`MembershipPeriod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership_Test`.`MembershipPeriod` ;

CREATE TABLE IF NOT EXISTS `SM_Membership_Test`.`MembershipPeriod` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `membershipId` INT UNSIGNED NOT NULL,
  `start` DATETIME NOT NULL,
  `end` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `membership_period_to_membership_fk_idx` (`membershipId` ASC),
  CONSTRAINT `membership_period_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `SM_Membership_Test`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
