DELIMITER $$

# ###########################
# Member
# ###########################

drop procedure if exists `addMember` $$
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
    else select 'Invalid Age Range';
  end if;
end $$

drop procedure if exists `updateMember` $$
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