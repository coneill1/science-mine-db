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
    start transaction ;
    call validateAgeRange(_low, _high, null);
    insert into `AgeRange` (high, low)
    values (_high, _low);
    commit;
end $$

drop procedure if exists `validateAgeRange` $$
create procedure `validateAgeRange`(_low int, _high int, _id int)
begin
    if (_id is null) then
        select count(*) into @count
        from `AgeRange`
        where (low <= _low and _low <= high)
           or (low <= _high and _high <= high)
           or (_low < low and high < _high);
        if (@count > 0)
        then
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Duplicate record', MYSQL_ERRNO = 1062;
        end if;
    ELSE
        select count(*) into @count
        from `AgeRange`
        where ((low <= _low and _low <= high)
            or (low <= _high and _high <= high)
            or (_low < low and high < _high))
          and id != _id;
        if (@count > 0)
        then
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Duplicate record', MYSQL_ERRNO = 1062;
        end if;
    end if;
end $$

drop procedure if exists `updateAgeRange` $$
create procedure `updateAgeRange`(_id int, _low int, _high int)
begin
    # First check if ageRange exists
    select count(*) into @count from `AgeRange` where id = _id;
    if (@count = 1)
    then
        start transaction ;
        call validateAgeRange(_low, _high, _id);
        update `AgeRange` set low = _low, high = _high where id = _id;
        commit;
    end if;
end $$

drop procedure if exists `deleteAgeRange` $$
create procedure `deleteAgeRange`(_id int)
begin
    start transaction ;
    delete from `AgeRange` where id = _id;
    commit;
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
    insert into MembershipType (name)
    values (type);
end $$

drop procedure if exists `updateMembershipType` $$
create procedure `updateMembershipType`(_id int, type varchar(45))
begin
    update MembershipType set name = type where id = _id;
end $$

drop procedure if exists `deleteMembershipType` $$
create procedure `deleteMembershipType`(_id int)
begin
    start transaction ;
    delete from `MembershipType` where id = _id;
    commit;
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
    insert into Reason (id, name)
    values (null, type);
end $$

drop procedure if exists `updateReason` $$
create procedure `updateReason`(_id int, type varchar(45))
begin
    update Reason set name = type where id = _id;
end $$

drop procedure if exists `deleteReason` $$
create procedure `deleteReason`(_id int)
begin
    #     Update suspension reason
    start transaction ;
    delete from `Reason` where id = _id;
    commit;
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
    insert into `VenueType` (name)
    values (venueName);
end $$

drop procedure if exists `updateVenueType` $$
create procedure `updateVenueType`(_id int, venueName varchar(45))
begin
    update `VenueType` set name = venueName where id = _id;
end $$

drop procedure if exists `deleteVenueType` $$
create procedure `deleteVenueType`(_id int)
begin
    start transaction ;
    delete from `VenueType` where id = _id;
    commit;
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
    insert into `Staff` (name)
    values (_name);
end $$

drop procedure if exists `updateStaff` $$
create procedure `updateStaff`(_id int, _name varchar(45))
begin
    delete from Staff where id = _id;
end $$

drop procedure if exists `deleteStaff` $$
create procedure `deleteStaff`(_id int)
begin
    delete from Staff where id = _id;
end $$

# ####################
# Staff END
# ####################

# show procedure status where Db = 'ScienceMine';

DELIMITER ;