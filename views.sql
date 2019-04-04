drop view if exists MemberView;
create view MemberView as
select firstName,
       lastName,
       CONCAT(AR.low, '-', AR.high) as 'Age Range',
       gender,
       E.name                       as ethnicity,
       C.phoneNumber,
       C.email,
       C.street,
       C.city,
       C.state,
       C.zip,
       SA.type as 'Special Accommodation'
from `Member`
       left join ContactInformation CI on Member.id = CI.memberId
       left join AgeRange AR on Member.ageRangeId = AR.id
       left join Ethnicity E on Member.ethnicityId = E.id
       left join ContactInformation C on C.memberId = Member.id
       left join SpecialAccommodation SA on Member.specialAccommodationId = SA.id;