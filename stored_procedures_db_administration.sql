# #######################
# SpecialAccommodation
# #######################

drop procedure if exists `updateSpecialAccommodation`;
CREATE PROCEDURE `updateSpecialAccommodation`(oldName varchar(45), newName varchar(45))
begin
  # First check if accommodation exists, then do nothing, otherwise update
  select id into @_id from `SpecialAccommodation` where lower(type) = lower(oldName);
  if (FOUND_ROWS() != 0)
  then
    update `SpecialAccommodation` set type=newName where id = @_id;
  end if;
end;

drop procedure if exists `addSpecialAccommodation`;
CREATE PROCEDURE `addSpecialAccommodation`(name VARCHAR(45))
BEGIN
  #   First check if already present, and do nothing
  SELECT id FROM `SpecialAccommodation` WHERE LOWER(type) = LOWER(name);
  IF (FOUND_ROWS() = 0)
  THEN
    INSERT INTO `SpecialAccommodation` (id, type) VALUES (NULL, name);
  END IF;
end;

drop procedure if exists `deleteSpecialAccommodation`;
CREATE PROCEDURE `deleteSpecialAccommodation`(name VARCHAR(45))
BEGIN
  #   First check if exists, then delete
  SELECT id INTO @id FROM `SpecialAccommodation` WHERE LOWER(type) = LOWER(name);
  IF (FOUND_ROWS() = 1)
  THEN
    #     update member info
    update Member set specialAccommodationId = null where id = @id;

    delete from `SpecialAccommodation` where id = @id;
  END IF;
end;

# #######################
# SpecialAccommodation END
# #######################

# #######################
# Ethnicity
# #######################

drop procedure if exists `addEthnicity`;
create procedure `addEthnicity`(newName varchar(45))
begin
  # First check if ethnicity exists
  select id from `Ethnicity` where lower(name) = lower(newName);
  if (FOUND_ROWS() = 0)
  then
    insert into `Ethnicity` (id, name) VALUES (null, newName);
  end if;
end;

drop procedure if exists `updateEthnicity`;
create procedure `updateEthnicity`(_id int, newName varchar(45))
begin
  # First check if ethnicity exists
  select id from `Ethnicity` where id = _id;
  if (FOUND_ROWS() = 1)
  then
    update `Ethnicity` set name = newName where id = _id;
  end if;
end;

select id into @id
from Reason
where lower(name) = 'other';
drop procedure if exists `deleteEthnicity`;
create procedure `deleteEthnicity)`(_id int, newName varchar(45))
begin
  # First check if ethnicity exists
  select id from `Ethnicity` where id = _id;
  if (FOUND_ROWS() = 1)
  then
    #     update member
    update `Member` set ethinicityId = null where id = _id;

    delete from `Ethnicity` where id = _id;
  end if;
end;

# #######################
# Ethnicity END
# #######################

# #######################
# AgeRange
# #######################

drop procedure if exists `addAgeRange`;
create procedure `addAgeRange`(_low int, _high int)
begin
  # First check if ethnicity exists
  select id from `AgeRange` where low = _low or high = _high;
  if (FOUND_ROWS() = 0)
  then
    insert into `AgeRange` (high, low)
    values (_high, _low);
  end if;
end;

drop procedure if exists `updateAgeRange`;
create procedure `updateAgeRange`(_id int, _low int, _high int)
begin
  # First check if ethnicity exists
  select id from `AgeRange` where id = _id;
  if (FOUND_ROWS() = 1)
  then
    update `AgeRange` set low = _low, high = _high where id = _id;
  end if;
end;

# #######################
# AgeRange END
# #######################

# ####################
# MembershipType
# ####################

drop procedure if exists `addMembershipType`;
create procedure `addMembershipType`(type varchar(45))
begin
  select name from MembershipType where lower(type) = lower(name);
  if (found_rows() = 0)
  then
    insert into MembershipType (id)
    values (type);
  end if;
end;

drop procedure if exists `updateMembershipType`;
create procedure `addMembershipType`(_id int, type varchar(45))
begin
  select id from MembershipType where _id = id;
  if (found_rows() = 1)
  then
    update MembershipType set name = type where id = _id;
  end if;
end;

# ####################
# MembershipType END
# ####################

# ####################
# Reason
# ####################

drop procedure if exists `addReason`;
create procedure `addReason`(type varchar(45))
begin
  select name from Reason where lower(type) = lower(name);
  if (found_rows() = 0)
  then
    insert into Reason (id)
    values (type);
  end if;
end;

drop procedure if exists `updateReason`;
create procedure `updateReason`(_id int, type varchar(45))
begin
  select id from Reason where _id = id;
  if (found_rows() = 1)
  then
    update Reason set name = type where id = _id;
  end if;
end;

drop procedure if exists `deleteReason`;
create procedure `deleteReason`(_id int)
begin
  select id from Reason where _id = id;
  if (found_rows() = 1)
  then
    select id into @id from Reason where lower(name) = 'other';
    #     Update suspension reason
    update `Suspension` set reasonId = @id where reasonId = _id;

    #     Update driverToMembership reason
    update `DriverToMembership` set reasonId = @id where reasonId = _id;

    delete from `Reason` where id = _id;
  end if;
end;

# ####################
# Reason END
# ####################

# ####################
# Venue
# ####################

drop procedure if exists `addVenue`;
create procedure `addVenue`(venueName varchar(45))
begin
  select id from `Venue` where lower(name) = lower(venueName);
  if (found_rows() = 0)
  then
    insert into `Venue` (name)
    values (venueName);
  end if;
end;

drop procedure if exists `updateVenue`;
create procedure `updateVenue`(_id int, venueName varchar(45))
begin
  select id from `Venue` where id = _id;
  if (found_rows() = 1)
  then
    update `Venue` set name = venueName where id = _id;
  end if;
end;

drop procedure if exists `deleteVenue`;
create procedure `deleteVenue`(_id int)
begin
  select id from `Venue` where id = _id;
  if (found_rows() = 1)
  then
    update `DriverToMembership` set venueId = null where venueId = _id;
    update `Encounter` set venueId = null where venueId = _id;
    delete from `Venue` where id = _id;
  end if;
end;

# ####################
# Venue END
# ####################

# ####################
# Staff
# ####################

drop procedure if exists `addStaff`;
create procedure `addStaff`(_name varchar(45))
begin
  select id from `Staff` where lower(name) = lower(_name);
  if (found_rows() = 0)
  then
    insert into `Staff` (name)
    values (_name);
  end if;
end;

drop procedure if exists `updateStaff`;
create procedure `updateStaff`(_id int, _name varchar(45))
begin
  select id from `Staff` where lower(name) = lower(_name);
  if (found_rows() = 0)
  then
    update `Staff` set name = _name where id = _id;
  end if;
end;

drop procedure if exists `deleteStaff`;
create procedure `deleteStaff`(_id int)
begin
  select id from `Staff` where id = _id;
  if (found_rows() = 1)
  then
    update `DriverToMembership` set staffId = null where staffId = _id;
    delete from `Staff` where id = _id;
  end if;
end;

# ####################
# Staff END
# ####################

# show procedure status where Db = 'ScienceMine'