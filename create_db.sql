-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SM_Membership
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SM_Membership`;

-- -----------------------------------------------------
-- Schema SM_Membership
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SM_Membership` DEFAULT CHARACTER SET utf8;
USE `SM_Membership`;

-- -----------------------------------------------------
-- Table `SM_Membership`.`MembershipType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`MembershipType`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`MembershipType`
(
    `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45)  NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `Id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`AgeRange`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`AgeRange`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`AgeRange`
(
    `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `high` INT UNSIGNED NOT NULL,
    `low`  INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `high_UNIQUE` (`high` ASC),
    UNIQUE INDEX `low_UNIQUE` (`low` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`Ethnicity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`Ethnicity`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`Ethnicity`
(
    `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45)  NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC)
)
    ENGINE = InnoDB
    PACK_KEYS = Default
    ROW_FORMAT = Default;


-- -----------------------------------------------------
-- Table `SM_Membership`.`SpecialAccommodation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`SpecialAccommodation`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`SpecialAccommodation`
(
    `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(45)  NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `type_UNIQUE` (`type` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`Member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`Member`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`Member`
(
    `id`                     INT UNSIGNED            NOT NULL AUTO_INCREMENT,
    `membershipId`           INT UNSIGNED            NULL,
    `firstName`              VARCHAR(45)             NOT NULL,
    `lastName`               VARCHAR(45)             NOT NULL,
    `ageRangeId`             INT UNSIGNED            NOT NULL,
    `ethnicityId`            INT UNSIGNED            NULL,
    `specialAccommodationId` INT UNSIGNED            NULL,
    `gender`                 ENUM ('male', 'female') NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `member_to_ethnicity_fk_idx` (`ethnicityId` ASC),
    INDEX `member_to_accommodation_fk_idx` (`specialAccommodationId` ASC),
    INDEX `member_to_membership_fk_idx` (`membershipId` ASC),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `member_to_age_fk_idx` (`ageRangeId` ASC),
    CONSTRAINT `member_to_age_fk`
        FOREIGN KEY (`ageRangeId`)
            REFERENCES `SM_Membership`.`AgeRange` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `member_to_ethnicity_fk`
        FOREIGN KEY (`ethnicityId`)
            REFERENCES `SM_Membership`.`Ethnicity` (`id`)
            ON DELETE SET NULL
            ON UPDATE NO ACTION,
    CONSTRAINT `member_to_accommodation_fk`
        FOREIGN KEY (`specialAccommodationId`)
            REFERENCES `SM_Membership`.`SpecialAccommodation` (`id`)
            ON DELETE SET NULL
            ON UPDATE NO ACTION,
    CONSTRAINT `member_to_membership_fk`
        FOREIGN KEY (`membershipId`)
            REFERENCES `SM_Membership`.`Membership` (`id`)
            ON DELETE SET NULL
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`Membership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`Membership`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`Membership`
(
    `id`               INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `membershipTypeId` INT UNSIGNED NOT NULL COMMENT 'The value of this will be one of following:\n- Seasonal Membership\n- Annual Membership',
    `isActive`         BIT(1)       NOT NULL,
    `primaryMemberId`  INT UNSIGNED NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `membership_to_membershipType_fk_idx` (`membershipTypeId` ASC),
    UNIQUE INDEX `primaryMemberId_UNIQUE` (`primaryMemberId` ASC),
    CONSTRAINT `membership_to_membershipType_fk`
        FOREIGN KEY (`membershipTypeId`)
            REFERENCES `SM_Membership`.`MembershipType` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `membership_to_member`
        FOREIGN KEY (`primaryMemberId`)
            REFERENCES `SM_Membership`.`Member` (`id`)
            ON DELETE SET NULL
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`ContactInformation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`ContactInformation`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`ContactInformation`
(
    `memberId`    INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `phoneNumber` VARCHAR(10)  NULL,
    `email`       VARCHAR(45)  NULL,
    `companyName` VARCHAR(45)  NULL,
    `street`      VARCHAR(45)  NULL,
    `city`        VARCHAR(45)  NULL,
    `zip`         VARCHAR(10)  NULL,
    `state`       VARCHAR(2)   NULL,
    PRIMARY KEY (`memberId`),
    UNIQUE INDEX `Id_UNIQUE` (`memberId` ASC),
    UNIQUE INDEX `phoneNumber_UNIQUE` (`phoneNumber` ASC),
    UNIQUE INDEX `email_UNIQUE` (`email` ASC),
    CONSTRAINT `contact_to_member_fk`
        FOREIGN KEY (`memberId`)
            REFERENCES `SM_Membership`.`Member` (`id`)
            ON DELETE CASCADE
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`IdCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`IdCard`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`IdCard`
(
    `QRCode`       BLOB(45)     NOT NULL,
    `dateIssued`   DATETIME     NOT NULL,
    `isActive`     BIT(1)       NOT NULL,
    `membershipId` INT UNSIGNED NOT NULL,
    INDEX `id_card_to_membership_fk_idx` (`membershipId` ASC),
    UNIQUE INDEX `QRCode_UNIQUE` (`QRCode`(255) ASC),
    PRIMARY KEY (`QRCode` (255) ASC),
    CONSTRAINT `id_card_to_membership_fk`
        FOREIGN KEY (`membershipId`)
            REFERENCES `SM_Membership`.`Membership` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`Reason`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`Reason`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`Reason`
(
    `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45)  NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`Suspension`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`Suspension`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`Suspension`
(
    `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `membershipId` INT UNSIGNED NOT NULL,
    `start`        DATETIME     NOT NULL,
    `end`          DATETIME     NULL,
    `reasonId`     INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `Id_UNIQUE` (`id` ASC),
    INDEX `membership_Id_idx` (`membershipId` ASC),
    INDEX `start_index` (`start` ASC),
    INDEX `suspension_to_reason_fk_idx` (`reasonId` ASC),
    CONSTRAINT `suspension_to_membership_fk`
        FOREIGN KEY (`membershipId`)
            REFERENCES `SM_Membership`.`Membership` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `suspension_to_reason_fk`
        FOREIGN KEY (`reasonId`)
            REFERENCES `SM_Membership`.`Reason` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`RenewalNotice`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`RenewalNotice`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`RenewalNotice`
(
    `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `dateIssued`   DATETIME     NOT NULL,
    `membershipId` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `renewal_notice_to_membership_fk_idx` (`membershipId` ASC),
    CONSTRAINT `renewal_notice_to_membership_fk`
        FOREIGN KEY (`membershipId`)
            REFERENCES `SM_Membership`.`Membership` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`VenueType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`VenueType`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`VenueType`
(
    `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45)  NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`Staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`Staff`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`Staff`
(
    `id`   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45)  NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`DriverToMembership`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`DriverToMembership`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`DriverToMembership`
(
    `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `reasonId`     INT UNSIGNED NOT NULL,
    `staffId`      INT UNSIGNED NULL,
    `membershipId` INT UNSIGNED NOT NULL,
    `venueId`      INT UNSIGNED NULL,
    `otherReason`  VARCHAR(45)  NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    UNIQUE INDEX `membership_Id_UNIQUE` (`membershipId` ASC),
    INDEX `driver_to_venue_fk_idx` (`venueId` ASC),
    INDEX `driver_to_reason_fk_idx` (`reasonId` ASC),
    INDEX `driver_to_staff_fk_idx` (`staffId` ASC),
    CONSTRAINT `joining_membership_fk`
        FOREIGN KEY (`membershipId`)
            REFERENCES `SM_Membership`.`Membership` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `driver_to_venue_fk`
        FOREIGN KEY (`venueId`)
            REFERENCES `SM_Membership`.`VenueType` (`id`)
            ON DELETE SET NULL
            ON UPDATE NO ACTION,
    CONSTRAINT `driver_to_reason_fk`
        FOREIGN KEY (`reasonId`)
            REFERENCES `SM_Membership`.`Reason` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    CONSTRAINT `driver_to_staff_fk`
        FOREIGN KEY (`staffId`)
            REFERENCES `SM_Membership`.`Staff` (`id`)
            ON DELETE SET NULL
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`Encounter`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`Encounter`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`Encounter`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `venueTypeId` INT UNSIGNED NOT NULL,
    `timeStamp`   DATETIME     NOT NULL,
    `name`        VARCHAR(45)  NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `encounter_to_venue_fk_idx` (`venueTypeId` ASC),
    CONSTRAINT `encounter_to_venue_fk`
        FOREIGN KEY (`venueTypeId`)
            REFERENCES `SM_Membership`.`VenueType` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB
    PACK_KEYS = Default;


-- -----------------------------------------------------
-- Table `SM_Membership`.`MemberEncounterLink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`MemberEncounterLink`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`MemberEncounterLink`
(
    `encounterId` INT UNSIGNED NOT NULL,
    `memberId`    INT UNSIGNED NOT NULL COMMENT 'Contains either the Secondary Member’s Id or the Primary Member’s Id\n',
    PRIMARY KEY (`memberId`, `encounterId`),
    INDEX `link_to_member_fk_idx` (`memberId` ASC),
    CONSTRAINT `link_to_encounter_fk`
        FOREIGN KEY (`encounterId`)
            REFERENCES `SM_Membership`.`Encounter` (`id`)
            ON DELETE CASCADE
            ON UPDATE NO ACTION,
    CONSTRAINT `link_to_member_fk`
        FOREIGN KEY (`memberId`)
            REFERENCES `SM_Membership`.`Member` (`id`)
            ON DELETE CASCADE
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`MembershipPeriod`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`MembershipPeriod`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`MembershipPeriod`
(
    `id`           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `membershipId` INT UNSIGNED NOT NULL,
    `start`        DATETIME     NOT NULL,
    `end`          DATETIME     NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC),
    INDEX `membership_period_to_membership_fk_idx` (`membershipId` ASC),
    CONSTRAINT `membership_period_to_membership_fk`
        FOREIGN KEY (`membershipId`)
            REFERENCES `SM_Membership`.`Membership` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SM_Membership`.`Attendees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`Attendees`;

CREATE TABLE IF NOT EXISTS `SM_Membership`.`Attendees`
(
    `id`          INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `encounterId` INT UNSIGNED NOT NULL,
    `ageRangeId`  INT UNSIGNED NOT NULL,
    `quantity`    INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `attendees_encounter_fk_idx` (`encounterId` ASC),
    INDEX `attendees_ageRange_fk_idx` (`ageRangeId` ASC),
    CONSTRAINT `attendees_encounter_fk`
        FOREIGN KEY (`encounterId`)
            REFERENCES `SM_Membership`.`Encounter` (`id`)
            ON DELETE CASCADE
            ON UPDATE NO ACTION,
    CONSTRAINT `attendees_ageRange_fk`
        FOREIGN KEY (`ageRangeId`)
            REFERENCES `SM_Membership`.`AgeRange` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
)
    ENGINE = InnoDB;

USE `SM_Membership`;

-- -----------------------------------------------------
-- Placeholder table for view `SM_Membership`.`MemberBioView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SM_Membership`.`MemberBioView`
(
    `fName`        INT,
    `lName`        INT,
    `ethnicity`    INT,
    `ageRangeLow`  INT,
    `ageRangeHigh` INT,
    `gender`       INT,
    `membershipId` INT
);

-- -----------------------------------------------------
-- Placeholder table for view `SM_Membership`.`MembershipMembersView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SM_Membership`.`MembershipMembersView`
(
    `membershipId` INT,
    `isActive`     INT,
    `memberId`     INT,
    `firstName`    INT,
    `lastName`     INT
);

-- -----------------------------------------------------
-- Placeholder table for view `SM_Membership`.`PrimaryMemberView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SM_Membership`.`PrimaryMemberView`
(
    `membershipId` INT,
    `firstName`    INT,
    `lastName`     INT
);

-- -----------------------------------------------------
-- Placeholder table for view `SM_Membership`.`MemberContactView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SM_Membership`.`MemberContactView`
(
    `memberId`    INT,
    `firstName`   INT,
    `lastName`    INT,
    `email`       INT,
    `phoneNumber` INT,
    `companyName` INT,
    `street`      INT,
    `city`        INT,
    `zip`         INT,
    `state`       INT
);

-- -----------------------------------------------------
-- View `SM_Membership`.`MemberBioView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`MemberBioView`;
DROP VIEW IF EXISTS `SM_Membership`.`MemberBioView`;
USE `SM_Membership`;
CREATE OR REPLACE VIEW `MemberBioView` AS
select `firstName`,
       `lastName`,
       E.`name` as `ethnicity`,
       A.`low`  as `ageRangeLow`,
       A.`high` as `ageRangeHigh`,
       `gender`,
       `membershipId`
from `Member` as M
         left join `Ethnicity` as E on E.`id` = M.`ethnicityId`
         left join `AgeRange` as A on A.`id` = M.`ageRangeId`;

-- -----------------------------------------------------
-- View `SM_Membership`.`MembershipMembersView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`MembershipMembersView`;
DROP VIEW IF EXISTS `SM_Membership`.`MembershipMembersView`;
USE `SM_Membership`;
CREATE OR REPLACE VIEW `MembershipMembersView` AS
select M.id as membershipId, isActive, Member.id as memberId, firstName, lastName
from Membership M
         left join Member on M.id = Member.membershipId;

-- -----------------------------------------------------
-- View `SM_Membership`.`PrimaryMemberView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`PrimaryMemberView`;
DROP VIEW IF EXISTS `SM_Membership`.`PrimaryMemberView`;
USE `SM_Membership`;
CREATE OR REPLACE VIEW `PrimaryMemberView` AS
select M.id as membershipId, firstName, lastName
from `Membership` as M
         left join `Member` on Member.id = M.primaryMemberId;

-- -----------------------------------------------------
-- View `SM_Membership`.`MemberContactView`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SM_Membership`.`MemberContactView`;
DROP VIEW IF EXISTS `SM_Membership`.`MemberContactView`;
USE `SM_Membership`;
CREATE OR REPLACE VIEW `MemberContactView` AS
select memberId,
       firstName,
       lastName,
       email,
       phoneNumber,
       companyName,
       street,
       city,
       zip,
       state
from `Member`
         left join `ContactInformation` on ContactInformation.memberId = Member.id;

SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
