DELIMITER $$

# #######################
# SpecialAccommodation
# #######################

drop procedure if exists `updateSpecialAccommodation`$$
CREATE PROCEDURE `updateSpecialAccommodation`(_id int, newName varchar(45))
begin
  # First check if accommodation exists, then do nothing, otherwise update
  select count(*) into @count from `SpecialAccommodation` where id = _id;
  if (@count != 0)
  then
    update `SpecialAccommodation` set type=newName where id = _id;
  end if;
end $$

drop procedure if exists `addSpecialAccommodation` $$
CREATE PROCEDURE `addSpecialAccommodation`(name VARCHAR(45))
BEGIN
  #   First check if already present, and do nothing
  SELECT count(*) into @count FROM `SpecialAccommodation` WHERE LOWER(type) = LOWER(name);
  IF (@count = 0)
  THEN
    INSERT INTO `SpecialAccommodation` (id, type) VALUES (NULL, name);
  END IF;
end $$

drop procedure if exists `deleteSpecialAccommodation` $$
CREATE PROCEDURE `deleteSpecialAccommodation`(deleteId int, replaceId int)
BEGIN
  #   First check if exists, then delete
  SELECT count(*) into @count FROM `SpecialAccommodation` WHERE id = deleteId or id = replaceId;
  IF (@count = 2)
  THEN
    start transaction ;
    #   Update all members that had the special accommodation to be deleted with the replace special accommodation
    update Member set specialAccommodationId = replaceId where specialAccommodationId = deleteId;
    delete from `SpecialAccommodation` where id = deleteId;
    commit;
  END IF;
end $$

# #######################
# SpecialAccommodation END
# #######################

# #######################
# Ethnicity
# #######################

drop procedure if exists `addEthnicity` $$
create procedure `addEthnicity`(newName varchar(45))
begin
  # First check if ethnicity exists
  select count(*) into @count from `Ethnicity` where lower(name) = lower(newName);
  if (@count = 0)
  then
    insert into `Ethnicity` (id, name) VALUES (null, newName);
  end if;
end $$

drop procedure if exists `updateEthnicity` $$
create procedure `updateEthnicity`(_id int, newName varchar(45))
begin
  # First check if ethnicity exists
  select count(*) into @count from `Ethnicity` where id = _id;
  if (@count = 1)
  then
    update `Ethnicity` set name = newName where id = _id;
  end if;
end $$

drop procedure if exists `deleteEthnicity` $$
create procedure `deleteEthnicity`(deleteId int, replaceId int)
begin
  # First check if ethnicity exists
  select count(*) into @count from `Ethnicity` where id = deleteId or replaceId;
  if (@count = 2)
  then
    start transaction ;
    #     update member
    update `Member` set ethnicityId = replaceId where ethnicityId = deleteId;

    delete from `Ethnicity` where id = deleteId;
    commit;
  end if;
end $$

# #######################
# Ethnicity END
# #######################

# #######################
# AgeRange
# #######################

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
  end if;
end $$

# #######################
# AgeRange END
# #######################

# ####################
# MembershipType
# ####################

drop procedure if exists `addMembershipType` $$
create procedure `addMembershipType`(type varchar(45))
begin
  select name into @tmp from MembershipType where lower(type) = lower(name);
  if (found_rows() = 0)
  then
    insert into MembershipType (name)
    values (type);
  end if;
end $$

drop procedure if exists `updateMembershipType` $$
create procedure `updateMembershipType`(_id int, type varchar(45))
begin
  select id into @tmp from MembershipType where _id = id;
  if (found_rows() = 1)
  then
    update MembershipType set name = type where id = _id;
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
  end if;
end $$

# ####################
# MembershipType END
# ####################

# ####################
# Reason
# ####################

drop procedure if exists `addReason` $$
create procedure `addReason`(type varchar(45))
begin
  select name from Reason where lower(type) = lower(name);
  if (found_rows() = 0)
  then
    insert into Reason (id, name)
    values (null, type);
  end if;
end $$

drop procedure if exists `updateReason` $$
create procedure `updateReason`(_id int, type varchar(45))
begin
  select id from Reason where _id = id;
  if (found_rows() = 1)
  then
    update Reason set name = type where id = _id;
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
  end if;
end $$

# ####################
# Reason END
# ####################

# ####################
# Venue
# ####################

delimiter $$

drop procedure if exists `addVenue` $$
create procedure `addVenue`(venueName varchar(45))
begin
  select id from `Venue` where lower(name) = lower(venueName);
  if (found_rows() = 0)
  then
    insert into `Venue` (name)
    values (venueName);
  end if;
end $$

drop procedure if exists `updateVenue` $$
create procedure `updateVenue`(_id int, venueName varchar(45))
begin
  select id from `Venue` where id = _id;
  if (found_rows() = 1)
  then
    update `Venue` set name = venueName where id = _id;
  end if;
end $$

drop procedure if exists `deleteVenue` $$
create procedure `deleteVenue`(_id int)
begin
  select id from `Venue` where id = _id;
  if (found_rows() = 1)
  then
    start transaction ;
    delete from `Venue` where id = _id;
    commit;
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
  end if;
end $$

drop procedure if exists `updateStaff` $$
create procedure `updateStaff`(_id int, _name varchar(45))
begin
  update `Staff` set name = _name where id = _id;
end $$

drop procedure if exists `deleteStaff` $$
create procedure `deleteStaff`(_id int)
begin
  delete from `Staff` where id = _id;
end $$

# ####################
# Staff END
# ####################

# show procedure status where Db = 'ScienceMine';

DELIMITER ;