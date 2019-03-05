# Mirrors sample data view in SM_testData.xlsx

select lastName, firstName, zip, city, start, end, email, phoneNumber from Membership as m
join PrimaryMember PM on m.id = PM.membershipId
join AgeRange as ar on ar.id = PM.ageRangeId
join ContactInformation CI on PM.contactInformationId = CI.id
join MembershipPeriod MP on m.id = MP.membershipId