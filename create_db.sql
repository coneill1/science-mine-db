-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ScienceMine
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ScienceMine
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ScienceMine` DEFAULT CHARACTER SET utf8 ;
USE `ScienceMine` ;

-- -----------------------------------------------------
-- Table `ScienceMine`.`MembershipType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`MembershipType` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`MembershipType` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`Membership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`Membership` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`Membership` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `membershipTypeId` INT UNSIGNED NOT NULL COMMENT 'The value of this will be one of following:\n- Seasonal Membership\n- Annual Membership',
  `isActive` BIT(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `membership_to_membershipType_fk_idx` (`membershipTypeId` ASC),
  CONSTRAINT `membership_to_membershipType_fk`
    FOREIGN KEY (`membershipTypeId`)
    REFERENCES `ScienceMine`.`MembershipType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`AgeRange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`AgeRange` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`AgeRange` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `high` INT UNSIGNED NOT NULL,
  `low` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`Ethnicity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`Ethnicity` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`Ethnicity` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`SpecialAccommodation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`SpecialAccommodation` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`SpecialAccommodation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`Member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`Member` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`Member` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `membershipId` INT UNSIGNED NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `ageRangeId` INT UNSIGNED NOT NULL,
  `ethinicityId` INT UNSIGNED NULL,
  `specialAccommodationId` INT UNSIGNED NULL,
  `gender` ENUM('male', 'female') NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `member_to_age_fk_idx` (`ageRangeId` ASC),
  INDEX `member_to_ethnicity_fk_idx` (`ethinicityId` ASC),
  INDEX `member_to_accommodation_fk_idx` (`specialAccommodationId` ASC),
  INDEX `member_to_membership_fk_idx` (`membershipId` ASC),
  CONSTRAINT `member_to_age_fk`
    FOREIGN KEY (`ageRangeId`)
    REFERENCES `ScienceMine`.`AgeRange` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `member_to_ethnicity_fk`
    FOREIGN KEY (`ethinicityId`)
    REFERENCES `ScienceMine`.`Ethnicity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `member_to_accommodation_fk`
    FOREIGN KEY (`specialAccommodationId`)
    REFERENCES `ScienceMine`.`SpecialAccommodation` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `member_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `ScienceMine`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`PrimaryMember`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`PrimaryMember` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`PrimaryMember` (
  `memberId` INT UNSIGNED NOT NULL,
  `membershipId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`memberId`),
  CONSTRAINT `primary_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `ScienceMine`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `primary_to_member_fk`
    FOREIGN KEY (`memberId`)
    REFERENCES `ScienceMine`.`Member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`ContactInformation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`ContactInformation` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`ContactInformation` (
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
    REFERENCES `ScienceMine`.`Member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`IdCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`IdCard` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`IdCard` (
  `QRCode` BLOB(45) NOT NULL,
  `dateIssued` DATETIME NOT NULL,
  `isActive` BIT(1) NOT NULL,
  `membershipId` INT UNSIGNED NOT NULL,
  INDEX `id_card_to_membership_fk_idx` (`membershipId` ASC),
  UNIQUE INDEX `QRCode_UNIQUE` (`QRCode`(255) ASC),
  PRIMARY KEY (`QRCode` (255)),
  CONSTRAINT `id_card_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `ScienceMine`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`Reason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`Reason` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`Reason` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`Suspension`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`Suspension` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`Suspension` (
  `Id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `membershipId` INT UNSIGNED NOT NULL,
  `start` DATETIME NOT NULL,
  `end` DATETIME NULL,
  `reasonId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `Id_UNIQUE` (`Id` ASC),
  INDEX `membership_Id_idx` (`membershipId` ASC),
  INDEX `start_index` (`start` ASC),
  INDEX `suspension_to_reason_fk_idx` (`reasonId` ASC),
  CONSTRAINT `suspension_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `ScienceMine`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `suspension_to_reason_fk`
    FOREIGN KEY (`reasonId`)
    REFERENCES `ScienceMine`.`Reason` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`RenewalNotice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`RenewalNotice` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`RenewalNotice` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `dateIssued` DATETIME NOT NULL,
  `membershipId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `renewal_notice_to_membership_fk_idx` (`membershipId` ASC),
  CONSTRAINT `renewal_notice_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `ScienceMine`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`Venue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`Venue` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`Venue` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`Staff` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`Staff` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`DriverToMembership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`DriverToMembership` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`DriverToMembership` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `reasonId` INT UNSIGNED NOT NULL,
  `staffId` INT UNSIGNED NOT NULL,
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
    REFERENCES `ScienceMine`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `driver_to_venue_fk`
    FOREIGN KEY (`venueId`)
    REFERENCES `ScienceMine`.`Venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `driver_to_reason_fk`
    FOREIGN KEY (`reasonId`)
    REFERENCES `ScienceMine`.`Reason` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `driver_to_staff_fk`
    FOREIGN KEY (`staffId`)
    REFERENCES `ScienceMine`.`Staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`SecondaryMember`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`SecondaryMember` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`SecondaryMember` (
  `memberId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `primaryMemberId` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`memberId`),
  UNIQUE INDEX `id_UNIQUE` (`memberId` ASC),
  INDEX `secondary_to_primary_fk_idx` (`primaryMemberId` ASC),
  CONSTRAINT `secondary_to_primary_fk`
    FOREIGN KEY (`primaryMemberId`)
    REFERENCES `ScienceMine`.`PrimaryMember` (`membershipId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `secondary_to_member_fk`
    FOREIGN KEY (`memberId`)
    REFERENCES `ScienceMine`.`Member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`Encounter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`Encounter` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`Encounter` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `venueId` INT UNSIGNED NOT NULL,
  `timeStamp` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `encounter_to_venue_fk_idx` (`venueId` ASC),
  CONSTRAINT `encounter_to_venue_fk`
    FOREIGN KEY (`venueId`)
    REFERENCES `ScienceMine`.`Venue` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`AttendeeType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`AttendeeType` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`AttendeeType` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`MemberEncounterLink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`MemberEncounterLink` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`MemberEncounterLink` (
  `encounterId` INT UNSIGNED NOT NULL,
  `attendeeTypeId` INT UNSIGNED NOT NULL COMMENT 'The attendee type will be the following values:\n- Primary Member\n- Secondary Member\n- Visitor',
  `ageRangeId` INT UNSIGNED NOT NULL,
  `gender` ENUM('male', 'female') NOT NULL,
  `memberId` INT UNSIGNED NOT NULL COMMENT 'Contains either the Secondary Member’s Id or the Primary Member’s Id\n',
  PRIMARY KEY (`encounterId`, `memberId`),
  INDEX `link_to_age_range_fk_idx` (`ageRangeId` ASC),
  INDEX `encounter_to_attendee_type_fk_idx` (`attendeeTypeId` ASC),
  INDEX `link_to_member_fk_idx` (`memberId` ASC),
  CONSTRAINT `link_to_encounter_fk`
    FOREIGN KEY (`encounterId`)
    REFERENCES `ScienceMine`.`Encounter` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `link_to_age_range_fk`
    FOREIGN KEY (`ageRangeId`)
    REFERENCES `ScienceMine`.`AgeRange` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `encounter_to_attendee_type_fk`
    FOREIGN KEY (`attendeeTypeId`)
    REFERENCES `ScienceMine`.`AttendeeType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `link_to_member_fk`
    FOREIGN KEY (`memberId`)
    REFERENCES `ScienceMine`.`Member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ScienceMine`.`MembershipPeriod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ScienceMine`.`MembershipPeriod` ;

CREATE TABLE IF NOT EXISTS `ScienceMine`.`MembershipPeriod` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `membershipId` INT UNSIGNED NOT NULL,
  `start` DATETIME NOT NULL,
  `end` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `membership_period_to_membership_fk_idx` (`membershipId` ASC),
  CONSTRAINT `membership_period_to_membership_fk`
    FOREIGN KEY (`membershipId`)
    REFERENCES `ScienceMine`.`Membership` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
