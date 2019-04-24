DELIMITER $$

# ###########################
# Member
# ###########################

drop procedure if exists `addMember` $$
create procedure `addMember`(_membershipId int, first varchar(45), last varchar(45), age int,
                             _gender enum ('male', 'female'), ethnicityName varchar(45), out memberId int)
begin
    select id into @ageRangeId from AgeRange where high >= age and low <= age;
    select id into @ethnicityId from Ethnicity where lower(name) = lower(ethnicityName);
    insert into `Member` (membershipId, firstName, lastName, ageRangeId, ethnicityId, gender)
    values (_membershipId, first, last, @ageRangeId, @ethnicityId, _gender);
    set memberId = last_insert_id();
end $$

drop procedure if exists `addMemberSpecialAccommodation` $$
create procedure `addMemberSpecialAccommodation`(_id int, accommodation varchar(45))
begin
    select id into @id from SpecialAccommodation where lower(type) = lower(accommodation);
    update `Member` set specialAccommodationId = @id where id = _id;
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

    select id into @ageRangeId from AgeRange where high >= age and low <= age;
    select id into @ethnicityId from Ethnicity where lower(name) = lower(ethnicityName);

    update `Member`
    set firstName   = first,
        lastName    = last,
        ageRangeId  = @ageRangeId,
        ethnicityId = @ethnicityId,
        gender      = _gender
    where id = _id;
end $$

drop procedure if exists `deleteMember` $$
create procedure `deleteMember`(_id int)
begin
    delete from `Member` where id = _id;
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
    insert into `ContactInformation` (memberId, phoneNumber, email, companyName, street, city, zip, state)
    values (_memberId, phone, _email, company, _street, _city, _zip, _state);
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