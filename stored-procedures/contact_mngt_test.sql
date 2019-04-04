# source ../create_test_db.sql;

delimiter $$

# Test Member Delete
drop procedure if exists `testDeleteMember` $$
create procedure `testDeleteMember`()
begin

  update `Membership` set primaryMemberId = null;
  delete from Member;
  delete from Membership;
  delete from MembershipType;

  insert into `MembershipType` (name) values ('annual');
  set @typeId = last_insert_id();
  insert into `AgeRange` (high, low) values (31, 18);
  set @ageRangeId = last_insert_id();
  insert into `Member` (firstName, lastName, ageRangeId, gender) values ('primary', 'last', @ageRangeId, 'male');
  set @primaryMemberId = last_insert_id();
  insert into `Membership` (membershipTypeId, isActive, primaryMemberId) values (@typeId, 0, @primaryMemberId);
  set @membershipId = last_insert_id();
  update `Member` set membershipId = @membershipId where id = @primaryMemberId;
  insert into `ContactInformation` (memberId, email)  values (@primaryMemberId, 'fake@me.com');

  insert into `Member` (membershipId, firstName, lastName, ageRangeId, gender)
  values (@membershipId, 'member2', 'last', @ageRangeId, 'male');
  set @newPrimaryMemberId = last_insert_id();

  call deleteMember(@primaryMemberId, @newPrimaryMemberId);
  select count(*) into @count from `Member` where id = @primaryMemberId;
  select count(*) into @contactCount from `ContactInformation` where memberId = @primaryMemberId;
  select count(*) into @membershipCount from `Membership` where primaryMemberId = @newPrimaryMemberId;
  select count(*) into @oldMembershipCount from `Membership` where primaryMemberId = @primaryMemberId;

  if (@count = 0 and @oldMembershipCount = 0 and @contactCount = 0 and @membershipCount = 1) then
    select 'PASS';
  else
    select 'FAIL';
  end if;

end $$

delimiter ;

select 'TESTING Member DELETE';
call testDeleteMember();