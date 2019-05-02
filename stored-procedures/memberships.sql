DELIMITER $$

# Adds a membership and adds the primary member of the newly created membership
drop procedure if exists `createMembership` $$
create procedure `createMembership`(type varchar(45), active bit(1), _start datetime, _end datetime, first varchar(45),
                                    last varchar(45), age int, _gender enum ('male', 'female'),
                                    ethnicityName varchar(45))
begin
    start transaction ;
    call addMembership(type, active, null);
    set @membershipId = last_insert_id();
    call addMember(@membershipId, first, last, age, _gender, ethnicityName);
    set @memberId = last_insert_id();
    call addMembershipPeriod(@membershipId, _start, _end);

    call updatePrimaryMemberOfMembership(@membershipId, @memberId);
    commit;
end $$

drop procedure if exists `updatePrimaryMemberOfMembership` $$
create procedure `updatePrimaryMemberOfMembership`(_id int, _memberId int)
begin
    select count(*) into @count from `Member` where id = _id;
    if (@count > 0) then
        update `Membership`
        set primaryMemberId = _memberId
        where id = _id;
    else
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Foreign Key memberId does not reference anything', MYSQL_ERRNO = 1216;
    end if;
end $$


drop procedure if exists `addMembership` $$
create procedure `addMembership`(type varchar(45), active bit(1), _primaryMemberId int)
begin
    select id into @typeId from `MembershipType` where lower(name) = lower(type);
    if (found_rows() = 1)
    then
        insert into `Membership` (membershipTypeId, isActive, primaryMemberId)
        values (@typeId, active, _primaryMemberId);
    else
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Foreign Key primaryMemberId does not reference anything', MYSQL_ERRNO = 1216;
    end if;
end $$

drop procedure if exists `updateMembership` $$
create procedure `updateMembership`(_id int, type varchar(45), active bit(1), _primaryMemberId int)
begin
    select id into @typeId from `MembershipType` where lower(name) = lower(type);
    select count(*) into @count from Member where id = _primaryMemberId = 1;
    if (@count > 0)
    then
        update `Membership`
        set membershipTypeId = @typeId,
            isActive         = active,
            primaryMemberId  = _primaryMemberId
        where id = _id;
    else
        signal sqlstate '45000'
            set message_text = 'Foreign Key primaryMemberId does not reference anything', mysql_errno = 1216;
    end if;
end $$

# ###############
# IdCard
# ###############

drop procedure if exists `addIdCard` $$
create procedure `addIdCard`(code BLOB(45), active BIT(1), _memberId int)
begin
    insert into `IdCard` (QRCode, dateIssued, isActive, memberId)
    values (code, CURDATE(), active, _memberId);
end $$

# Updates the active flag for an id card
drop procedure if exists `updateIdCard` $$
create procedure `updateIdCard`(code BLOB(45), active BIT(1))
begin
    update `IdCard`
    set isActive = active
    where QRCode = code;
end $$

# ###############
# IdCard END
# ###############

# ##################
# MembershipPeriod
# ##################

drop procedure if exists `addMembershipPeriod` $$
create procedure `addMembershipPeriod`(_membershipId int, _start DATETIME, _end DATETIME)
begin
    insert into `MembershipPeriod` (membershipId, start, end)
    values (_membershipId, _start, _end);
end $$

drop procedure if exists `updateMembershipPeriod` $$
create procedure `updateMembershipPeriod`(_id int, _start DATETIME, _end DATETIME)
begin
    update `MembershipPeriod`
    set start = _start,
        end   = _end
    where id = _id;
end $$

drop procedure if exists `deleteMembershipPeriod` $$
create procedure `deleteMembershipPeriod`(_id int)
begin
    delete
    from `MembershipPeriod`
    where id = _id;
end $$

# ######################
# MembershipPeriod END
# #####################

# ##################
# RenewalNotice
# ##################

drop procedure if exists `addRenewalNotice` $$
create procedure `addRenewalNotice`(_membershipId int)
begin
    insert into `RenewalNotice` (dateIssued, membershipId)
    values (curdate(), _membershipId);
end $$

drop procedure if exists `deleteRenewalNotice` $$
create procedure `deleteRenewalNotice`(_id int)
begin
    delete
    from `RenewalNotice`
    where id = _id;
end $$

# ######################
# RenewalNotice END
# #####################

# ##################
# Suspension
# ##################

drop procedure if exists `addSuspension` $$
create procedure `addSuspension`(_membershipId int, _reasonId int)
begin
    insert into `Suspension` (membershipId, start, end, reasonId)
    values (_membershipId, CURDATE(), null, _reasonId);
end $$

drop procedure if exists `updateSuspension` $$
create procedure `updateSuspension`(_id int, _end DATETIME, _reasonId int)
begin
    update `Suspension`
    set end      = _end,
        reasonId = _reasonId
    where id = _id;
end $$

# ######################
# Suspension END
# #####################

# ##################
# DriverToMembership
# ##################

drop procedure if exists `addDriverToMembership` $$
create procedure `addDriverToMembership`(_membershipId int, _reasonId int, _staffId int, _venueId int,
                                         _otherReason varchar(45))
begin
    select id from `Membership` where id = _membershipId;
    if (found_rows() = 1 and (select count(*) from `Reason` where id = _reasonId) = 1 and
        (select count(*) from `Staff` where id = _staffId) = 1)
    then
        insert into `DriverToMembership` (reasonId, staffId, membershipId, venueId, otherReason)
        values (_reasonId, _staffId, _membershipId, _venueId, _otherReason);
    end if;
end $$

drop procedure if exists `updateDriverToMembership` $$
create procedure `updateDriverToMembership`(_id int, _membershipId int, _reasonId int, _staffId int, _venueId int,
                                            _otherReason varchar(45))
begin
    update `DriverToMembership`
    set reasonId     = _reasonId,
        staffId      = _staffId,
        membershipId = _membershipId,
        venueId      = _venueId,
        otherReason  = _otherReason
    where id = _id;
end $$

# ######################
# DriverToMembership END
# #####################

DELIMITER ;

