DELIMITER $$

# ################
# Encounter
# ################

drop procedure if exists `addEncounter` $$
create procedure `addEncounter`(_venueId int, date DATETIME, _name VARCHAR(45))
begin
    insert into `Encounter` (venueTypeId, timeStamp, name)
    values (_venueId, date, _name);
end $$


drop procedure if exists `updateEncounter` $$
create procedure `updateEncounter`(_id int, _venueId int, date DATETIME, _name VARCHAR(45))
begin
    update `Encounter`
    set venueTypeId = _venueId,
        timestamp   = date,
        name        = _name
    where id = _id;
end $$

drop procedure if exists `deleteEncounter` $$
create procedure `deleteEncounter`(_id int)
begin
    delete from `Encounter` where id = _id;
end $$

# ################
# Encounter END
# ################

# ################
# Attendees
# ################

drop procedure if exists `addAttendees` $$
create procedure `addAttendees`(_encounterId int, _ageRangeId int, qty int)
begin
    insert into `Attendees` (encounterId, ageRangeId, quantity)
    values (_encounterId, _ageRangeId, qty);
end $$


drop procedure if exists `updateAttendees` $$
create procedure `updateAttendees`(_id int, qty int)
begin
    update `Attendees`
    set quantity = qty
    where id = _id;
end $$

drop procedure if exists `deleteAttendees` $$
create procedure `deleteAttendees`(_id int)
begin
    delete from `Attendees` where id = _id;
end $$

# ################
# Attendees END
# ################

# ########################
# MemberEncounterLink
# ########################

drop procedure if exists `addMemberEncounterLink` $$
create procedure `addMemberEncounterLink`(_encounterId int, _memberId int)
begin
    insert into `MemberEncounterLink` (encounterId, memberId)
    values (_encounterId, _memberId);
end $$


drop procedure if exists `updateMemberEncounterLink` $$
create procedure `updateMemberEncounterLink`(oldEncounterId int, newEncounterId int, oldMemberId int, newMemberId int)
begin
    update `MemberEncounterLink`
    set encounterId = newEncounterId,
        memberId    = newMemberId
    where encounterId = oldEncounterId
      and memberId = oldMemberId;
end $$

drop procedure if exists `deleteMemberEncounterLink` $$
create procedure `deleteMemberEncounterLink`(_encounterId int, _memberId int)
begin
    delete from `MemberEncounterLink` where encounterId = _encounterId and memberId = _memberId;
end $$

# ########################
# MemberEncounterLink END
# ########################

DELIMITER ;