# ###########################
# PrimaryMember
# ###########################

drop procedure if exists `addPrimaryMember`;
create procedure `addPrimaryMember`(_membershipId int, first varchar(45), last varchar(45), age int,
                                    ethnicityName varchar(45),
                                    gender enum ('male', 'female'), accommodation varchar(45), phone varchar(10),
                                    email varchar(45), company varchar(45), street varchar(45), city varchar(45),
                                    zip varchar(10), state varchar(2))
begin
  select id from Membership where id = _membershipId;
  if (found_rows() = 1 and (select count(*) from `PrimaryMember` where membershipId = _membershipId) = 0)
  then
    call `addMember`(_membershipId, first, last, age, ethnicityName, gender, accommodation, phone, email, company, street, city, zip,
                     state, @memberId);
    insert into PrimaryMember (memberId, membershipId)
    values (@memberId, _membershipId);
  end if;
end;

# Updates the membershipId of the primary member
drop procedure if exists `updatePrimaryMember`;
create procedure `updatePrimaryMember`(_id int, _membershipId int)
begin
  select id from `Membership` where id = _membershipId;
  if (found_rows() = 1)
  then
    update `PrimaryMember` set membershipId = _membershipId where memberId = _id;
  end if;
end;

# ###########################
# PrimaryMember END
# ###########################

# ###########################
# SecondaryMember
# ###########################

drop procedure if exists `addSecondaryMember`;
create procedure `addSecondaryMember`(_membershipId int, first varchar(45), last varchar(45), age int,
                                    ethnicityName varchar(45),
                                    gender enum ('male', 'female'), accommodation varchar(45), phone varchar(10),
                                    email varchar(45), company varchar(45), street varchar(45), city varchar(45),
                                    zip varchar(10), state varchar(2))
begin
  select memberId into @primaryMemberId from `PrimaryMember` where membershipId = _membershipId;
  if (found_rows() = 1 and (select count(*) from `PrimaryMember` where membershipId = _membershipId) = 1)
  then
    call `addMember`(_membershipId, first, last, age, ethnicityName, gender, accommodation, phone, email, company, street, city, zip,
                     state, @memberId);
    insert into `SecondaryMember` (memberId, primaryMemberId)
    values (@memberId, @primaryMemberId);
  end if;
end;

# Updates the primaryMemberId of the secondary member
drop procedure if exists `updateSecondaryMember`;
create procedure `updateSecondaryMember`(_id int, _primaryMemberId int)
begin
  select id from `Membership` where id = _primaryMemberId;
  if (found_rows() = 1)
  then
    update `SecondaryMember` set primaryMemberId = _primaryMemberId where memberId = _id;
  end if;
end;

# ###########################
# SecondaryMember END
# ###########################

# ###########################
# Member
# ###########################

drop procedure if exists `addMember`;
create procedure `addMember`(_membershipId int, first varchar(45), last varchar(45), age int, ethnicityName varchar(45),
                             _gender enum ('male', 'female'), accommodation varchar(45), phone varchar(10),
                             email varchar(45), company varchar(45), street varchar(45), city varchar(45),
                             zip varchar(10), state varchar(2), out memberId int)
begin
  if (first is not null and last is not null and age is not null and _gender is not null)
  then
    #   resolve ageRangeId from age - REQUIRED
    select id into @ageRangeId from AgeRange where high >= age and low <= age;

    if (found_rows() = 1)
    then
      #   resolve ethnicityId from ethnicity
      select id into @ethnicityId from Ethnicity where lower(name) = lower(ethnicityName);

      #   resolve specialAccommodationId from accommodation
      select id into @accommodationId from SpecialAccommodation where lower(type) = lower(accommodation);

      insert into `Member` (membershipId, firstName, lastName, ageRangeId, ethinicityId, specialAccommodationId, gender)
      values (_membershipId, first, last, @ageRangeId, @ethnicityId, @accommodationId, _gender);
      select last_insert_id() into memberId;
      call `addContactInformation`(memberId, phone, email, company, street, city, zip, state);
    end if;
  end if;
end;

drop procedure if exists `updateMember`;
create procedure `updateMember`(_id int, first varchar(45), last varchar(45), age int, ethnicityName varchar(45),
                                _gender enum ('male', 'female'), accommodation varchar(45), phone varchar(10),
                                email varchar(45), company varchar(45), street varchar(45), city varchar(45),
                                zip varchar(10), state varchar(2))
begin
  if (first is not null and last is not null and age is not null and _gender is not null)
  then
    #   resolve ageRangeId from age - REQUIRED
    select id into @ageRangeId from AgeRange where high >= age and low <= age;

    if (found_rows() = 1)
    then
      #   resolve ethnicityId from ethnicity
      select id into @ethnicityId from Ethnicity where lower(name) = lower(ethnicityName);

      #   resolve specialAccommodationId from accommodation
      select id into @accommodationId from SpecialAccommodation where lower(type) = lower(accommodation);

      update `Member`
      set firstName              = first,
          lastName               = last,
          ageRangeId             = @ageRangeId,
          ethinicityId           = @ethnicityId,
          gender                 = _gender,
          specialAccommodationId = @accommodationId
      where id = _id;
      call `updateContactInformation`(_Id, phone, email, company, street, city, zip, state);
    end if;
  end if;
end;

# ###########################
# Member END
# ###########################

# ###########################
# ContactInformation
# ###########################

drop procedure if exists `addContactInformation`;
create procedure `addContactInformation`(_memberId int, phone varchar(10), _email varchar(45), company varchar(45),
                                         _street varchar(45), _city varchar(45), _zip varchar(10), _state varchar(2))
begin
  select id from `Member` where id = _memberId;
  if (found_rows() = 1 and (phone is not null or _email is not null))
  then
    select memberId from `ContactInformation` where memberId = _memberId;
    if (found_rows() = 0)
    then
      insert into `ContactInformation` (memberId, phoneNumber, email, companyName, street, city, zip, state)
      values (_memberId, phone, _email, company, _street, _city, _zip, _state);
    end if;

  end if;
end;

drop procedure if exists `updateContactInformation`;
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
end;

# ###########################
# ContactInformation END
# ###########################