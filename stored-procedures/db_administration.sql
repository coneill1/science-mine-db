DELIMITER $$

# #######################
# SpecialAccommodation
# #######################
DELIMITER $$
drop procedure if exists `updateSpecialAccommodation`$$
CREATE PROCEDURE `updateSpecialAccommodation`(oldName varchar(45), newName varchar(45))
begin
    update `SpecialAccommodation` set type=newName where type = oldName;
end $$

drop procedure if exists `addSpecialAccommodation` $$
CREATE PROCEDURE `addSpecialAccommodation`(name VARCHAR(45))
BEGIN
    INSERT INTO `SpecialAccommodation` (id, type) VALUES (NULL, name);
end $$

drop procedure if exists `deleteSpecialAccommodation` $$
CREATE PROCEDURE `deleteSpecialAccommodation`(currentType varchar(45))
BEGIN
    select id into @curId from SpecialAccommodation where type = currentType;
    delete from `SpecialAccommodation` where id = @curId;
end $$
DELIMITER ;
# #######################
# SpecialAccommodation END
# #######################

# #######################
# Ethnicity
# #######################
DELIMITER $$
drop procedure if exists `addEthnicity` $$
create procedure `addEthnicity`(newName varchar(45))
begin
    insert into `Ethnicity` (id, name) VALUES (null, newName);
end $$

drop procedure if exists `updateEthnicity` $$
create procedure `updateEthnicity`(oldName varchar(45), newName varchar(45))
begin
    update `Ethnicity` set name = newName where name = oldName;
end $$

drop procedure if exists `deleteEthnicity` $$
create procedure `deleteEthnicity`(_name VARCHAR(45))
begin
    delete from `Ethnicity` where name = _name;
end $$
DELIMITER ;
# #######################
# Ethnicity END
# #######################

# #######################
# AgeRange
# #######################
DELIMITER $$
drop procedure if exists `addAgeRange` $$
create procedure `addAgeRange`(_low int, _high int)
begin
    select count(*) into @count
    from `AgeRange`
    where (low <= _low and _low <= high)
       or (low <= _high and _high <= high)
       or (_low < low and high < _high);
    if (@count = 0)
    then
        insert into `AgeRange` (high, low)
        values (_high, _low);
    ELSE
        select 'duplicate';
    end if;
end $$

drop procedure if exists `updateAgeRange` $$
create procedure `updateAgeRange`(_id int, _low int, _high int)
begin
    # First check if ethnicity exists
    select count(*) into @count from `AgeRange` where id = _id;
    select id into @tmp from `AgeRange` where _low = low or _high = high;
    if (@count = 1 and found_rows() = 0)
    then
        update `AgeRange` set low = _low, high = _high where id = _id;
    ELSE
        select 'not found';
    end if;
end $$
DELIMITER ;
# #######################
# AgeRange END
# #######################

# ####################
# MembershipType
# ####################
DELIMITER $$
drop procedure if exists `addMembershipType` $$
create procedure `addMembershipType`(type varchar(45))
begin
    select name into @tmp from MembershipType where lower(type) = lower(name);
    if (found_rows() = 0)
    then
        insert into MembershipType (name)
        values (type);
    ELSE
        select 'duplicate';
    end if;
end $$

drop procedure if exists `updateMembershipType` $$
create procedure `updateMembershipType`(_id int, type varchar(45))
begin
    select id into @tmp from MembershipType where _id = id;
    if (found_rows() = 1)
    then
        update MembershipType set name = type where id = _id;
    ELSE
        select 'not found';
    end if;
end $$

drop procedure if exists `deleteMembershipType` $$
create procedure `deleteMembershipType`(deleteId int, replaceId int)
begin
    select count(*) into @count from MembershipType where deleteId = id or replaceId = id;
    if (@count = 2)
    then
        start transaction ;
        update `Membership` set membershipTypeId = replaceId where membershipTypeId = deleteId;
        delete from `MembershipType` where id = deleteId;
        commit;
    ELSE
        select 'not found';
    end if;
end $$
DELIMITER ;
# ####################
# MembershipType END
# ####################

# ####################
# Reason
# ####################
DELIMITER $$
drop procedure if exists `addReason` $$
create procedure `addReason`(type varchar(45))
begin
    select name from Reason where lower(type) = lower(name);
    if (found_rows() = 0)
    then
        insert into Reason (id, name)
        values (null, type);
    ELSE
        select 'duplicate';
    end if;
end $$

drop procedure if exists `updateReason` $$
create procedure `updateReason`(_id int, type varchar(45))
begin
    select id from Reason where _id = id;
    if (found_rows() = 1)
    then
        update Reason set name = type where id = _id;
    ELSE
        select 'not found';
    end if;
end $$

drop procedure if exists `deleteReason` $$
create procedure `deleteReason`(deleteId int, replaceId int)
begin
    select count(*) into @count from Reason where deleteId = id or replaceId = id;
    if (@count = 2)
    then
        #     Update suspension reason
        start transaction ;
        update `Suspension` set reasonId = replaceId where reasonId = deleteId;

        #     Update driverToMembership reason
        update `DriverToMembership` set reasonId = replaceId where reasonId = deleteId;

        delete from `Reason` where id = deleteId;
        commit;
    ELSE
        select 'not found';
    end if;
end $$
DELIMITER ;
# ####################
# Reason END
# ####################

# ####################
# Venue
# ####################

delimiter $$

drop procedure if exists `addVenueType` $$
create procedure `addVenueType`(venueName varchar(45))
begin
    select id from `VenueType` where lower(name) = lower(venueName);
    if (found_rows() = 0)
    then
        insert into `VenueType` (name)
        values (venueName);
    ELSE
        select 'duplicate';
    end if;
end $$

drop procedure if exists `updateVenueType` $$
create procedure `updateVenueType`(_id int, venueName varchar(45))
begin
    select id from `VenueType` where id = _id;
    if (found_rows() = 1)
    then
        update `VenueType` set name = venueName where id = _id;
    ELSE
        select 'not found';
    end if;
end $$

drop procedure if exists `deleteVenueType` $$
create procedure `deleteVenueType`(_id int)
begin
    select id from `VenueType` where id = _id;
    if (found_rows() = 1)
    then
        start transaction ;
        delete from `VenueType` where id = _id;
        commit;
    ELSE
        select 'not found';
    end if;
end $$

delimiter ;

# ####################
# Venue END
# ####################

# ####################
# Staff
# ####################

delimiter $$

drop procedure if exists `addStaff` $$
create procedure `addStaff`(_name varchar(45))
begin
    select count(*) into @count from `Staff` where lower(name) = lower(_name);
    if (@count = 0)
    then
        insert into `Staff` (name)
        values (_name);
    ELSE
        select 'duplicate';
    end if;
end $$

drop procedure if exists `updateStaff` $$
create procedure `updateStaff`(_id int, _name varchar(45))
begin
    select count(*) into @count from `Staff` where id = _id;
    if (@count = 0)
    then
        delete from Staff where id = _id;
    ELSE
        select 'not found';
    end if;
end $$

drop procedure if exists `deleteStaff` $$
create procedure `deleteStaff`(_id int)
begin
    select count(*) into @count from `Staff` where id = _id;
    if (@count = 0)
    then
        delete from Staff where id = _id;
    ELSE
        select 'not found';
    end if;
end $$

# ####################
# Staff END
# ####################

# show procedure status where Db = 'ScienceMine';

DELIMITER ;