DELIMITER $$

# ###########################
# Member
# ###########################

drop procedure if exists `addMember` $$
create procedure `addMember`(_membershipId int, first varchar(45), last varchar(45), age int,
                             _gender enum ('male', 'female'), ethnicityName varchar(45), out memberId int)
begin
  if (first is not null and last is not null and age is not null and _gender is not null)
  then
    #   resolve ageRangeId from age - REQUIRED
    select id into @ageRangeId from AgeRange where high >= age and low <= age;

    if (found_rows() = 1)
    then
      #   resolve ethnicityId from ethnicity
      if (ethnicityName is null) then
        set @ethnicityId = null;
      else
        select id into @ethnicityId from Ethnicity where lower(name) = lower(ethnicityName);
      end if;

      insert into `Member` (membershipId, firstName, lastName, ageRangeId, ethnicityId, gender)
      values (_membershipId, first, last, @ageRangeId, @ethnicityId, _gender);
      select last_insert_id() into memberId;
    end if;
  end if;
end $$

drop procedure if exists `addMemberSpecialAccommodation` $$
create procedure `addMemberSpecialAccommodation`(_id int, accommodation varchar(45))
begin
  select count(*) into @count from Member where _id = id;
  select id into @id from SpecialAccommodation where lower(type) = lower(accommodation);
  if (found_rows() = 1 and @count = 1) then
    update `Member` set specialAccommodationId = @id where id = _id;
  end if;
end $$

drop procedure if exists `addMemberContact` $$
create procedure `addMemberContact`(_id int, phone varchar(10), email varchar(45), company varchar(45),
                                    street varchar(45), city varchar(45), zip varchar(10), state varchar(2))
begin
  call `addContactInformation`(_id, phone, email, company, street, city, zip, state);
end $$

drop procedure if exists `updateMember` $$
create procedure `updateMember`(_id int, first varchar(45), last varchar(45), age int, ethnicityName varchar(45),
                                _gender enum ('male', 'female'))
begin
  if (first is not null and last is not null and age is not null and _gender is not null)
  then
    #   resolve ageRangeId from age - REQUIRED
    select id into @ageRangeId from AgeRange where high >= age and low <= age;

    if (found_rows() = 1)
    then
      #   resolve ethnicityId from ethnicity
      select id into @ethnicityId from Ethnicity where lower(name) = lower(ethnicityName);

      update `Member`
      set firstName   = first,
          lastName    = last,
          ageRangeId  = @ageRangeId,
          ethnicityId = @ethnicityId,
          gender      = _gender
      where id = _id;
    end if;
  end if;
end $$

drop procedure if exists `deleteMember` $$
create procedure `deleteMember`(_id int, _primaryMemberId int)
begin
  #   resolve ageRangeId from age - REQUIRED
  select membershipId into @membershipId from `Member` where id = _id;

  start transaction ;
  update `Membership` set primaryMemberId = _primaryMemberId where id = @membershipId;
  delete from `Member` where id = _id;
  commit ;
end $$

# ###########################
# Member END
# ###########################

# ###########################
# ContactInformation
# ###########################

drop procedure if exists `addContactInformation` $$
create procedure `addContactInformation`(_memberId int, phone varchar(10), _email varchar(45), company varchar(45),
                                         _street varchar(45), _city varchar(45), _zip varchar(10), _state varchar(2))
begin
  select id into @id from `Member` where id = _memberId;
  if (found_rows() = 1 and (phone is not null or _email is not null))
  then
    select count(*) into @count from `ContactInformation` where memberId = @id;
    if (@count = 0)
    then
      insert into `ContactInformation` (memberId, phoneNumber, email, companyName, street, city, zip, state)
      values (_memberId, phone, _email, company, _street, _city, _zip, _state);
    end if;

  end if;
end $$

drop procedure if exists `updateContactInformation` $$
create procedure `updateContactInformation`(_memberId int, phone varchar(10), _email varchar(45), company varchar(45),
                                            _street varchar(45), _city varchar(45), _zip varchar(10), _state varchar(2))
begin
  update `ContactInformation`
  set phoneNumber = phone,
      email       = _email,
      companyName = company,
      street      = _street,
      city        = _city,
      zip         = _zip,
      state       = _state
  where memberId = _memberId;
end $$

# ###########################
# ContactInformation END
# ###########################

DELIMITER ;