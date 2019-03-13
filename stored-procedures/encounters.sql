# ################
# Encounter
# ################

drop procedure if exists `addEncounter`;
create procedure `addEncounter`(_venueId int)
begin
  #   Ensure venueId is a valid id
  select id from `Venue` where id = _venueId;
  if (found_rows() = 1)
  then
    insert into `Encounter` (venueId, timeStamp)
    values (_venueId, CURRENT_TIMESTAMP);
  end if;
end;


drop procedure if exists `updateEncounter`;
create procedure `updateEncounter`(_id int, _venueId int)
begin
  #   Ensure venueId is a valid id
  select id from `Venue` where id = _venueId;
  if (found_rows() = 1)
  then
    update `Encounter`
    set venueId = _venueId
    where id = _id;
  end if;
end;

drop procedure if exists `deleteEncounter`;
create procedure `deleteEncounter`(_id int)
begin
  delete from `Encounter` where id = _id;
end;

# ################
# Encounter END
# ################

# ########################
# MemberEncounterLink
# ########################

drop procedure if exists `addMemberEncounterLink`;
create procedure `addMemberEncounterLink`(_encounterId int, _memberId int, _attendeeTypeId int, _ageRangeId int, gender ENUM('male', 'female'))
begin
  #   Ensure venueId is a valid id
  if ((select count(*) from `Encounter` where id = _encounterId) = 1 and
      (select count(*) from `Member` where id = _memberId) = 1 and
      (select count(*) from `AgeRange` where id = _ageRangeId) = 1 and
      (select count(*) from `AttendeeType` where id = _attendeeTypeId) = 1 and
      gender is not null)
  then
    insert into `MemberEncounterLink` (encounterId, attendeeTypeId, ageRangeId, gender, memberId)
    values (_encounterId, _attendeeTypeId, _ageRangeId, gender, _memberId);
  end if;
end;


drop procedure if exists `updateMemberEncounterLink`;
create procedure `updateMemberEncounterLink`(_encounterId int, _memberId int, _attendeeTypeId int, _ageRangeId int, _gender ENUM('male', 'female'))
begin
  #   Ensure venueId is a valid id
  if ((select count(*) from `Encounter` where id = _encounterId) = 1 and
      (select count(*) from `Member` where id = _memberId) = 1 and
      (select count(*) from `AgeRange` where id = _ageRangeId) = 1 and
      (select count(*) from `AttendeeType` where id = _attendeeTypeId) = 1 and
      _gender is not null)
  then
    update `MemberEncounterLink`
    set attendeeTypeId = _attendeeTypeId,
        ageRangeId = _ageRangeId,
        gender = _gender
    where encounterId = _encounterId and memberId = _memberId;
  end if;
end;

drop procedure if exists `deleteMemberEncounterLink`;
create procedure `deleteMemberEncounterLink`(_id int)
begin
  delete from `DriverToMembership` where id = _id;
end;

# ########################
# MemberEncounterLink END
# ########################