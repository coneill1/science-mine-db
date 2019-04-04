# source ../create_test_db.sql;

delimiter $$

# TEST delete specialAccommodation
drop procedure if exists `testDeleteSpecialAccommodation` $$
create procedure `testDeleteSpecialAccommodation`()
begin

  delete
  from Member;
  delete
  from SpecialAccommodation;

  call addSpecialAccommodation('delete me');
  set @deleteId = last_insert_id();
  #   Add a member with the newly added special accommodation
  call addAgeRange(18, 31);
  call addMember(null, 'first', 'last', 18, 'male', null, @memberId);
  call addMemberSpecialAccommodation(@memberId, 'delete me');
  call addSpecialAccommodation('test');
  set @newId = last_insert_id();
  call deleteSpecialAccommodation(@deleteId, @newId);
  select count(*) into @count from `SpecialAccommodation` where type = 'delete me';
  select specialAccommodationId into @saId from `Member` where id = @memberId;
  if (@saId = @newId and @count = 0) then
    select 'PASS';
  else
    select 'FAIL';
  end if;
end $$

# TEST delete Ethnicity
drop procedure if exists `testDeleteEthnicity`$$
create procedure `testDeleteEthnicity`()
begin

  delete
  from Member;
  delete
  from Ethnicity;

  call addEthnicity('delete me');
  set @deleteId = (select id from `Ethnicity` where name = 'delete me');
  #   Add a member with the newly added ethnicity
  call addAgeRange(18, 31);
  call addMember(null, 'first', 'last', 18, 'male', 'delete me', @memberId);
  call addEthnicity('test');
  set @newId = last_insert_id();
  call deleteEthnicity(@deleteId, @newId);

  --   check to see if the member's ethnicity was successfully updated and that the old ethnicity was deleted
  select count(*) into @count from `Ethnicity` where name = 'delete me';
  select ethnicityId into @ethnId from `Member` where id = @memberId;
  if (@ethnId = @newId and @count = 0) then
    select 'PASS';
  else
    select 'FAIL';
  end if;
end $$

/* TEST add AgeRange
  3 cases:
    1. high is within already existing age range
    2. low is within already existing age range
    3. low and high range contain already existing age range
*/
drop procedure if exists `testAddAgeRange`$$
create procedure `testAddAgeRange`()
begin
  delete from Member;
  delete from AgeRange;

  #   Add initial age range
  call addAgeRange(5, 10);

  #   Test case 1
  call addAgeRange(2, 7);
  select count(*) into @count from AgeRange where high = 7 and low = 2;
  if (@count = 0) then
    select 'PASS TEST CASE 1';
  else
    select 'FAIL TEST CASE 1';
  end if;

  #   Test case 2
  call addAgeRange(6, 15);
  select count(*) into @count from AgeRange where high = 15 and low = 6;
  if (@count = 0) then
    select 'PASS TEST CASE 2';
  else
    select 'FAIL TEST CASE 2';
  end if;

  #   Test case 3
  call addAgeRange(0, 30);
  select count(*) into @count from AgeRange where high = 30 and low = 0;
  if (@count = 0) then
    select 'PASS TEST CASE 3';
  else
    select 'FAIL TEST CASE 3';
  end if;
end $$

# TEST delete MembershipType
drop procedure if exists `testDeleteMembershipType`$$
create procedure `testDeleteMembershipType`()
begin

  delete from Member;
  delete from DriverToMembership;
  delete from Suspension;
  delete from Membership;
  delete from MembershipType;

  call addMembershipType('delete me');
  set @deleteId = last_insert_id();
  call addMembership('delete me', 0, null);

  call addMembershipType('test');
  set @newId = last_insert_id();

  call deleteMembershipType(@deleteId, @newId);

  select count(*) into @count from `MembershipType` where id = @deleteId;
  select id into @tmp from `Membership` where membershipTypeId = @newId;
  if (found_rows() = 1 and @count = 0) then
    select 'PASS';
  else
    select 'FAIL';
  end if;
end $$

# TEST delete Reason
drop procedure if exists `testDeleteReason`$$
create procedure `testDeleteReason`()
begin

  delete from Member;
  delete from Suspension;
  delete from DriverToMembership;
  delete from Membership;
  delete from Reason;
  delete from Venue;
  delete from Staff;

  call addStaff('staff');
  set @staffId = last_insert_id();
  call addMembershipType('test');
  call addMembership('test', 0, null);
  set @membershipId = last_insert_id();
  call addReason('delete me');
  set @deleteId = last_insert_id();

  call addSuspension(@membershipId, @deleteId);
  set @suspensionId = last_insert_id();
  call addDriverToMembership(@membershipId, @deleteId, @staffId, null, null);
  set @driverToMemId = last_insert_id();

  call addReason('new reason');
  set @replaceId = last_insert_id();

  call deleteReason(@deleteId, @replaceId);

  select count(*) into @count from `Reason` where id = @deleteId;
  select count(*) into @suspensionCount from `Suspension` where reasonId = @replaceId and id = @suspensionId;
  select count(*) into @driverCount from `DriverToMembership` where reasonId = @replaceId and id = @driverToMemId;
  if (@suspensionCount = 1 and @driverCount = 1 and @count = 0) then
    select 'PASS';
  else
    select 'FAIL';
  end if;
end $$

delimiter $$

# TEST delete Venue
drop procedure if exists `testDeleteVenue`$$
create procedure `testDeleteVenue`()
begin

  delete from Encounter;
  delete from Member;
  delete from AgeRange;
  delete from AttendeeType;
  delete from Suspension;
  delete from DriverToMembership;
  delete from Membership;
  delete from MembershipType;
  delete from Reason;
  delete from Venue;
  delete from Staff;

  insert into `AgeRange` (high, low) values (31, 18);
  set @ageRangeId = last_insert_id();
  insert into `AttendeeType` (name) values ('guest');
  set @attendeetypeId = last_insert_id();
  insert into `Venue` (id, name) values (null, 'delete me');
  set @venueId = last_insert_id();
  insert into `Encounter` (venueId, timeStamp) values (@venueId, CURRENT_TIMESTAMP);
  set @encounterId = last_insert_id();
  insert into `EncounterLink` (encounterId, attendeeTypeId, ageRangeId, gender)
    values (@encounterId, @attendeetypeId, @ageRangeId, 'male');

  insert into `MembershipType` (name) values ('memType');
  insert into `Membership` (membershipTypeId, isActive) values (last_insert_id(), 0);
  set @membershipId = last_insert_id();
  insert into `Staff` (name) values ('staff');
  set @staffId = last_insert_id();
  insert into `Reason` (name) values ('other');
  insert into `DriverToMembership` (reasonId, staffId, membershipId, venueId)
    values (last_insert_id(), @staffId, @membershipId, @venueId);

select 'here';
  call deleteVenue(@venueId);

  select count(*) into @count from `Venue` where id = @venueId;
  select count(*) into @encounterCount from `Encounter` where venueId = @venueId;
  select count(*) into @encounterLinkCount from `EncounterLink` where encounterId = @encounterId;
  select count(*) into @driverCount from `DriverToMembership` where venueId = @venueId;
  if (@encounterCount = 0 and @encounterLinkCount = 0 and @driverCount = 0 and @count = 0) then
    select 'PASS';
  else
    select 'FAIL';
  end if;
end $$

delimiter ;

select 'TESTING SpecialAccommodation DELETE';
call testDeleteSpecialAccommodation();

select 'TESTING Ethnicity DELETE';
call testDeleteEthnicity();

select 'TESTING AgeRange CREATE';
call testAddAgeRange();

select 'TESTING MembershipType DELETE';
call testDeleteMembershipType();

select 'TESTING Reason DELETE';
call testDeleteReason();

select 'TESTING Venue DELETE';
call testDeleteVenue();

