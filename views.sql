drop view if exists MemberView;
create view MemberView (id, firstName, lastName, ageRangeLow, ageRangeHigh, gender, ethnicity, specialAccommodation) as
select Member.id,
       firstName,
       lastName,
       AR.low,
       AR.high,
       gender,
       E.name,
       SA.type
from `Member`
         join AgeRange AR on Member.ageRangeId = AR.id
         join Ethnicity E on Member.ethnicityId = E.id
         join SpecialAccommodation SA on Member.specialAccommodationId = SA.id;


drop view if exists MemberContactView;
create view MemberContactView as
select firstName,
       lastName,
       gender,
       C.phoneNumber,
       C.email,
       C.street,
       C.city,
       C.state,
       C.zip
from Member
         join ContactInformation C on Member.id = C.memberId;

drop view if exists MemberIdCard;
create view MemberIdCard as
select firstName,
       lastName,
       QRCode,
       dateIssued,
       isActive
from Member as M
         join IdCard as Idc on Idc.memberId = M.id;


drop view if exists MembershipView;
create view MembershipView as
select Mship.id,
       M.firstName as 'primaryMemberFirst',
       M.lastName  as 'primaryMemberLast',
       T.name      as 'type',
       Mship.isActive
from Membership as Mship
         join Member as M on Mship.primaryMemberId = M.id
         join MembershipType as T on T.id = Mship.membershipTypeId;

drop view if exists MembershipNoticeView;
create view MembershipNoticeView as
    select v.id,
           primaryMemberFirst,
           primaryMemberLast,
           type as 'membershipType',
           dateIssued
from MembershipView as v
join RenewalNotice;

drop view if exists MembershipPeriodView;
create view MembershipPeriodView as
    select v.id,
           primaryMemberFirst,
           primaryMemberLast,
           type as 'membershipType',
           start,
           end
from MembershipView as v
join MembershipPeriod on v.id = MembershipPeriod.membershipId;

drop view if exists MembershipSuspensionView;
create view MembershipSuspensionView as
    select v.id,
           v.primaryMemberFirst,
           v.primaryMemberLast,
           v.type as 'membershipType',
           S.start,
           S.end,
           R.name as 'reason'
from MembershipView as v
join Suspension as S on v.id = S.membershipId
join Reason as R on R.id = S.reasonId;


