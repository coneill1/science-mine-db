call addAgeRange(18, 31);
call addMembershipType('seasonal');

call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-09-05', '2018-09-05');
call addMember(@membershipId, 'Theron', 'Wilson', 25, null, 'male', null, '', '', null, null, 'Butte', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-06', '2016-02-06');
call addMember(@membershipId, 'Dawn', 'Wilcox', 25, null, 'male', null, '', 'dgordon7229@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-18', '2016-04-18');
call addMember(@membershipId, 'Jordan', 'Stevens', 25, null, 'male', null, '4066985698', '', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-11', '2016-04-11');
call addMember(@membershipId, '', 'Andersen', 25, null, 'male', null, '', 'phippsallijo@juno.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-11', '2016-04-11');
call addMember(@membershipId, 'Susan', 'Schrader', 25, null, 'male', null, '', 'sschrader@mtech.edu', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-11', '2016-04-11');
call addMember(@membershipId, '', 'O\'Donnell', 25, null, 'male', null, '', 'serenityodonnell@gmail.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-11', '2016-04-11');
call addMember(@membershipId, 'Jamie', 'Offutt', 25, null, 'male', null, '', 'phobia-@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-11', '2016-04-11');
call addMember(@membershipId, 'Cheryl', 'Madison', 25, null, 'male', null, '', 'euhedral@msn.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-11', '2016-04-11');
call addMember(@membershipId, 'Vik', 'Kujawa', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-04', '2016-04-04');
call addMember(@membershipId, 'Kels', 'Brodie', 25, null, 'male', null, '', 'bchoops1@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-21', '2016-03-21');
call addMember(@membershipId, 'Bill', 'Burger', 25, null, 'male', null, '', 'burger_bill@hotmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-28', '2016-03-28');
call addMember(@membershipId, 'Mack', 'Gollinger', 25, null, 'male', null, '', 'mpgollinger@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-21', '2016-03-21');
call addMember(@membershipId, 'Michelle', 'Wold', 25, null, 'male', null, '7828921', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-04', '2016-04-04');
call addMember(@membershipId, 'Dianna', 'Porter ', 25, null, 'male', null, '', 'porterdianna@hotmail.com', null, null,
               '', '59703', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-28', '2016-03-28');
call addMember(@membershipId, 'Kim', 'Mannix', 25, null, 'male', null, '7234191', 'kqbrown@msn.com  ', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2002-04-18', '2003-04-18');
call addMember(@membershipId, 'Michelle', 'Zarate', 25, null, 'male', null, '4064984627', 'nieinazakat@live.com', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-14', '2016-03-14');
call addMember(@membershipId, 'Kevin', 'Pfeifer', 25, null, 'male', null, '', 'kwpfeifer@gmail.com', null, null,
               'Anaconda', '59711', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-04', '2016-04-04');
call addMember(@membershipId, 'Steve', 'Hess', 25, null, 'male', null, '', 'shess@bsb.mt.gov', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, '', 'Vincent', 25, null, 'male', null, '', 'ajkvincent@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, '', 'Watson', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, 'Suzanne', 'Stefanac', 25, null, 'male', null, '', 'suzanne.stefanac@gmail.com', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, 'Marvin', 'Speece', 25, null, 'male', null, '', 'mspeece@mtech.edu', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, '', 'Shadow', 25, null, 'male', null, '', 'sonjashadow@hmail.com', null, null, 'Anaconda',
               '59711', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, '', 'Sawyer', 25, null, 'male', null, '', '', null, null, 'Anaconda', '59711', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, 'Chris/Lyndsay', 'Richards', 25, null, 'male', null, '', 'lapulrer01@gmail.com', null,
               null, 'Three Forks', '59752', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-07', '2016-03-07');
call addMember(@membershipId, 'Joe', 'Petroni-Jodel', 25, null, 'male', null, '', '3019 Atherton Ln', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, 'Chris ', 'Lu', 25, null, 'male', null, '', 'jdt2009@live.com', null, null, 'Billings',
               '59041', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-01-07', '2016-01-07');
call addMember(@membershipId, 'Dave', 'Johns', 25, null, 'male', null, '', 'djohns523@hotmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-06', '2016-02-06');
call addMember(@membershipId, 'Robert/Tabatha', 'Hyatt', 25, null, 'male', null, '', 'tabathae@outlook.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, 'Shaun', 'Hoolahan', 25, null, 'male', null, '', 'shoolahan@hotmail.com', null, null,
               'Anaconda', '59711', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-06', '2016-02-06');
call addMember(@membershipId, 'Lisa', 'Graham', 25, null, 'male', null, '', 'lisagh20@gmail.com', null, null, '',
               '59759', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, 'Mike', 'Flanick', 25, null, 'male', null, '', 'mflanick@gmail.com', null, null, 'Ramsay',
               '59748', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, 'Erin', 'Angove', 25, null, 'male', null, '', 'becta@q.com', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, 'Gene', 'Ashby', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, '', 'Aware on Ottawa', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-07', '2016-02-07');
call addMember(@membershipId, 'Janet/Stephen', 'Coe', 25, null, 'male', null, '', 'janetmcoe@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-14', '2016-02-14');
call addMember(@membershipId, 'Patrick', 'Andre ', 25, null, 'male', null, '', 'salutpandre@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-14', '2016-02-14');
call addMember(@membershipId, 'Wanda', 'Haller', 25, null, 'male', null, '', 'wandakp@hotmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-14', '2016-02-14');
call addMember(@membershipId, 'Mickal', 'McCarthy', 25, null, 'male', null, '', 'mrmccarthy58@yahoo.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-14', '2016-02-14');
call addMember(@membershipId, 'Bryce', 'Hill', 25, null, 'male', null, '', 'bhill@mtech.edu', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-14', '2016-02-14');
call addMember(@membershipId, 'Cliff', 'Gade', 25, null, 'male', null, '', 'cliff_gade@hayoo.com', null, null,
               'Walkerville', '', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-14', '2016-02-14');
call addMember(@membershipId, 'Hansen', 'Velbr', 25, null, 'male', null, '', 'rvehere@mt.gov', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-14', '2016-02-14');
call addMember(@membershipId, 'Pat ', 'Broderick', 25, null, 'male', null, '', 'pwbcanoe99@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-28', '2016-02-28');
call addMember(@membershipId, 'Tammy', 'Jonse', 25, null, 'male', null, '', 'sub98@bresnan.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-28', '2016-02-28');
call addMember(@membershipId, 'Ryan', 'Draper', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-28', '2016-02-28');
call addMember(@membershipId, 'Catherine', 'Lace', 25, null, 'male', null, '', 'm53m@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-28', '2016-02-28');
call addMember(@membershipId, 'Tory', 'Cooper', 25, null, 'male', null, '', 'coopers1305@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-28', '2016-02-28');
call addMember(@membershipId, 'Carly', 'Peach', 25, null, 'male', null, '', 'carlyapeach@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-28', '2016-02-28');
call addMember(@membershipId, 'Bruce/Peggy', 'Graving', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-07', '2016-03-07');
call addMember(@membershipId, 'Shilo', 'Van Tatenhove', 25, null, 'male', null, '', 'shilo_v@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-07', '2016-03-07');
call addMember(@membershipId, 'Amber', 'Henson', 25, null, 'male', null, '', 'amberjones48@hotmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-07', '2016-03-07');
call addMember(@membershipId, 'Denise', 'Hendrix', 25, null, 'male', null, '', 'dhendrix49@outlook.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-07', '2016-03-07');
call addMember(@membershipId, 'Jenny', 'McEwen', 25, null, 'male', null, '', 'jennylmcewen@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-14', '2016-03-14');
call addMember(@membershipId, 'Joe', 'Lynch', 25, null, 'male', null, '', 'dtrandal@live.com', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-14', '2016-03-14');
call addMember(@membershipId, 'C', 'Schmalzried', 25, null, 'male', null, '', 'chelseaschmalzried@yahoo.com', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-03-07', '2016-03-07');
call addMember(@membershipId, '', 'Skinner', 25, null, 'male', null, '', 'jskinner@mtech.edu', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-06-06', '2016-06-06');
call addMember(@membershipId, 'Missy', 'Okrusch (Kings Kids)', 25, null, 'male', null, '', 'kingskids0604@hmail.com',
               null, null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-09-19', '2016-09-19');
call addMember(@membershipId, 'Judy', 'Evans', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-10-03', '2016-10-03');
call addMember(@membershipId, 'Mike', 'Patterson', 25, null, 'male', null, '', 'mhpatterson@bresnan.net', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-10-25', '2016-10-25');
call addMember(@membershipId, 'Dee', 'Wilson', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-10-24', '2016-10-24');
call addMember(@membershipId, 'Judi', 'Schutte', 25, null, 'male', null, '', 'judiliebman', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-10-17', '2016-10-17');
call addMember(@membershipId, 'John', 'Babcock', 25, null, 'male', null, '', 'jbabcock@wet-llc.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-10-03', '2016-10-03');
call addMember(@membershipId, 'Lee', 'Good', 25, null, 'male', null, '', 'tssmail@tssmt.net', null, null, 'Whitehall',
               '', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-10-03', '2016-10-03');
call addMember(@membershipId, 'Patrick', 'Broderick', 25, null, 'male', null, '', 'pwbcanoe99@yahoo.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-09-30', '2016-09-30');
call addMember(@membershipId, 'Mary Kay', 'Craig', 25, null, 'male', null, '', 'marykathleencraig@gmail.com', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-12-05', '2016-12-05');
call addMember(@membershipId, 'Titus', 'Bergren', 25, null, 'male', null, '', 'titusbergren@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-01-21', '2016-01-21');
call addMember(@membershipId, 'Alicia', 'Kachmavik', 25, null, 'male', null, '', 'aliciawheeler@gmail.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-11-21', '2016-11-21');
call addMember(@membershipId, 'Elizabeth', 'Drew', 25, null, 'male', null, '', 'birddrew222@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-12-19', '2016-12-19');
call addMember(@membershipId, 'Pate', 'Briggs', 25, null, 'male', null, '', '', null, null, 'Anaconda', '59711', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-12-12', '2016-12-12');
call addMember(@membershipId, 'Ben/Jess', 'Carr', 25, null, 'male', null, '', 'jdrewnumerouno@gmail.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-12-12', '2016-12-12');
call addMember(@membershipId, 'Sabina', 'Pate-Terry', 25, null, 'male', null, '', 'anatoart@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-01-23', '2016-01-23');
call addMember(@membershipId, 'Ashley', 'Neighbor', 25, null, 'male', null, '', 'ashleyannneighbor@outlook.com', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-11', '2016-04-11');
call addMember(@membershipId, 'Mike', 'Bordwin', 25, null, 'male', null, '', 'mbordwin@hotmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-02-13', '2017-02-13');
call addMember(@membershipId, 'Allison', 'Andersen', 25, null, 'male', null, '', 'phippsqllijo@juno.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-04-30', '2017-04-30');
call addMember(@membershipId, 'Darla', 'Moran', 25, null, 'male', null, '', 'dmorqn51@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-04-20', '2017-04-20');
call addMember(@membershipId, 'Theron', 'Wilson', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-04-17', '2017-04-17');
call addMember(@membershipId, 'Mike', 'Bordwin', 25, null, 'male', null, '', 'mbordwin@hotmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-04-16', '2017-04-16');
call addMember(@membershipId, 'Becky', 'Fisk', 25, null, 'male', null, '', 'fiskfam4@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-04-09', '2017-04-09');
call addMember(@membershipId, 'Gary', 'Wyss', 25, null, 'male', null, '', 'wyssl@aol.com', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-04-09', '2017-04-09');
call addMember(@membershipId, 'C', 'Schmalzried', 25, null, 'male', null, '', 'chelseaschmalzried@yahoo.com', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-05-21', '2017-05-21');
call addMember(@membershipId, 'Dave', 'McCarthy', 25, null, 'male', null, '', 'smelter01@gmail.com', null, null,
               'Anaconda', '59711', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-05-21', '2017-05-21');
call addMember(@membershipId, 'Lucy', 'Ednie', 25, null, 'male', null, '', 'lucysupernurse@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-05-21', '2017-05-21');
call addMember(@membershipId, 'Jason', 'Korst', 25, null, 'male', null, '', 'korsty@hotmail.com', null, null,
               'Whitehall', '59759', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-05-21', '2017-05-21');
call addMember(@membershipId, 'Rozanne', 'Conley', 25, null, 'male', null, '', 'roxannec1969@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-05-07', '2017-05-07');
call addMember(@membershipId, 'JJ', 'Bestgen', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-03-12', '2017-03-12');
call addMember(@membershipId, 'Rick', 'Jordan', 25, null, 'male', null, '', 'rjordan@barrick.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-03-12', '2017-03-12');
call addMember(@membershipId, 'Mike', 'Nasheim', 25, null, 'male', null, '', 'san21456@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Alyssa', 'Creighton', 25, null, 'male', null, '', '', null, null, 'Dillon', '59725',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-02-13', '2017-02-13');
call addMember(@membershipId, 'Lesley', 'Holman', 25, null, 'male', null, '', 'holmanla@butte.k12.mt.us ', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-19', '2017-01-19');
call addMember(@membershipId, 'Gene/Tammy', 'Jense', 25, null, 'male', null, '', 'sub90@bresnan.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-19', '2017-01-19');
call addMember(@membershipId, '', 'Skinner', 25, null, 'male', null, '', 'wgskinn@hotmail.com', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-23', '2017-01-23');
call addMember(@membershipId, '', 'Callaghan', 25, null, 'male', null, '', 'callaghanwe@butte.k12.mt.us', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-23', '2017-01-23');
call addMember(@membershipId, 'Chandra', 'Duran', 25, null, 'male', null, '', 'chandraduran@hotmail.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-23', '2017-01-23');
call addMember(@membershipId, 'Shella', 'Capaccia', 25, null, 'male', null, '', 'scapoccia@mttech.edu', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-11-23', '2017-11-23');
call addMember(@membershipId, 'Tim', 'Lynch', 25, null, 'male', null, '', 'tlynch@bresnan.net', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-23', '2017-01-23');
call addMember(@membershipId, 'Tracy', 'Cannon', 25, null, 'male', null, '', 'tracyc-tech@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-23', '2017-01-23');
call addMember(@membershipId, 'Tina', 'Pantano', 25, null, 'male', null, '', 'tmpantano@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-23', '2017-01-23');
call addMember(@membershipId, 'Sheilah', 'VIncent', 25, null, 'male', null, '', 'elvisbutte@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-23', '2017-01-23');
call addMember(@membershipId, '', 'Brady', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-30', '2017-01-30');
call addMember(@membershipId, 'Evan', 'Barrett', 25, null, 'male', null, '', 'evanbutte@bresnan.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-09-23', '2017-09-23');
call addMember(@membershipId, 'Larry', 'Hoffman', 25, null, 'male', null, '', 'hardrock4800@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-09-24', '2017-09-24');
call addMember(@membershipId, 'Cormic', 'Sletten', 25, null, 'male', null, '', 'acombo@bldc.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-09-25', '2017-09-25');
call addMember(@membershipId, '', 'Ball', 25, null, 'male', null, '', 'ball7134@hotmail.com', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-01', '2017-10-01');
call addMember(@membershipId, 'Dolores', 'Cooney', 25, null, 'male', null, '', 'dcooney@bresnan.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-08', '2017-10-08');
call addMember(@membershipId, 'Rounds', 'Shuttlesworth', 25, null, 'male', null, '', 'h/rounds@gmail.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-08', '2017-10-08');
call addMember(@membershipId, 'Avi', 'Masters', 25, null, 'male', null, '', 'mmasters@mtech.edu', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-08', '2017-10-08');
call addMember(@membershipId, 'Tera', 'Ryan', 25, null, 'male', null, '', 'bryan@mtech.edu', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-08', '2017-10-08');
call addMember(@membershipId, 'Asna', 'Henne/capocca', 25, null, 'male', null, '', 'scapoccia@mtech.edu', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-08', '2017-10-08');
call addMember(@membershipId, 'Terry', 'Pate', 25, null, 'male', null, '', 'anatoart@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-08', '2017-10-08');
call addMember(@membershipId, 'Barbie', 'Huber', 25, null, 'male', null, '', 'barbiehuber@hotmail.com', null, null,
               'Bozeman', '', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-14', '2017-10-14');
call addMember(@membershipId, 'Kelly', 'Thatcher', 25, null, 'male', null, '', 'jayhubber24@aol.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-15', '2017-10-15');
call addMember(@membershipId, 'Amber/Dennis', 'Osterman', 25, null, 'male', null, '', 'osterwoman@gmail.com', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-15', '2017-10-15');
call addMember(@membershipId, 'Jeannine', 'Boyle', 25, null, 'male', null, '', 'jeboylesr@sbcglobal.net', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-15', '2017-10-15');
call addMember(@membershipId, 'Ottolini', 'Messukri', 25, null, 'male', null, '', 'aottolinimessuri@mtech.edu', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-22', '2017-10-22');
call addMember(@membershipId, '', 'Vavruska', 25, null, 'male', null, '', 'invavruska@bresnan.net', null, null,
               'Helena', '59635', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-29', '2017-10-29');
call addMember(@membershipId, 'Robin', 'Johnson', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-29', '2017-10-29');
call addMember(@membershipId, 'Melissa', 'Kump', 25, null, 'male', null, '', 'melissaann49@hotmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-10-29', '2017-10-29');
call addMember(@membershipId, 'Patrick', 'Broderick', 25, null, 'male', null, '', 'pwbcanoe99@yahoo.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-11-05', '2017-11-05');
call addMember(@membershipId, 'Shane/Heather', 'Davis', 25, null, 'male', null, '', 'hmdavisdum@gmail.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-11-05', '2017-11-05');
call addMember(@membershipId, 'JoAnna', 'Buchholz', 25, null, 'male', null, '', 'joanna_buchholz@yahoo.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-11-05', '2017-11-05');
call addMember(@membershipId, 'Robert', 'Moler', 25, null, 'male', null, '', 'robertmoler@gmail.com', null, null,
               'Helena', '59601', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-11-12', '2017-11-12');
call addMember(@membershipId, 'Oly', 'Petersen', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-11-26', '2017-11-26');
call addMember(@membershipId, 'Marlene', 'Worthon', 25, null, 'male', null, '', 'marlenegreen3@gmail.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-11-26', '2017-11-26');
call addMember(@membershipId, 'Bryan/Mandy', 'Armstrong', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-04-22', '2018-04-22');
call addMember(@membershipId, '', 'Walsh', 25, null, 'male', null, '', 'mlwalsh@bresnan.net', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-06-03', '2018-06-03');
call addMember(@membershipId, 'Glenn', 'Brackett', 25, null, 'male', null, '', 'glencris@bresnan.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-06-03', '2018-06-03');
call addMember(@membershipId, '', 'Schulte', 25, null, 'male', null, '', 'gregoryjamesschulte@gmail.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-06-10', '2018-06-10');
call addMember(@membershipId, 'Carol', 'Smith', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-06-10', '2018-06-10');
call addMember(@membershipId, 'Gayle', 'Nicholls', 25, null, 'male', null, '', 'gnicholls@bresnan.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-06-17', '2018-06-17');
call addMember(@membershipId, 'Dolores', 'Cooney', 25, null, 'male', null, '', 'dcooney@bresnan.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-06-17', '2018-06-17');
call addMember(@membershipId, 'Fred/Bev', 'Hartline', 25, null, 'male', null, '', 'fbhartl@earthlink.net', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-06-24', '2018-06-24');
call addMember(@membershipId, 'Missy', 'Okrusch', 25, null, 'male', null, '', 'kingskids0604@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-06-24', '2018-06-24');
call addMember(@membershipId, 'Decia', 'Newby', 25, null, 'male', null, '', 'jaconandecia@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-06-24', '2018-06-24');
call addMember(@membershipId, '', 'Naglsetty', 25, null, 'male', null, '', 'jyoti.nagisetty@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2027-06-24', '2028-06-24');
call addMember(@membershipId, '', 'Jamison', 25, null, 'male', null, '', 'shawnajamison@hotmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-01-28', '2018-01-28');
call addMember(@membershipId, 'Allison', 'Andersen', 25, null, 'male', null, '', 'phippsallijoa@juno.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-02-04', '2018-02-04');
call addMember(@membershipId, 'Ben', 'Clark', 25, null, 'male', null, '', 'lineman669@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-02-04', '2018-02-04');
call addMember(@membershipId, '', 'Hasslers', 25, null, 'male', null, '', 'kpowley@yahoo.com', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-01-14', '2018-01-14');
call addMember(@membershipId, 'Gayle', 'Nicholls', 25, null, 'male', null, '', 'gnicholls@bresnan.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-01-14', '2018-01-14');
call addMember(@membershipId, 'Catherine', 'Lace', 25, null, 'male', null, '', 'm53m@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-01-14', '2018-01-14');
call addMember(@membershipId, 'Havilah', 'Hill', 25, null, 'male', null, '', 'havilahhill@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Cormic', 'Sletten', 25, null, 'male', null, '', 'acombo@bldc.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-01-17', '2018-01-17');
call addMember(@membershipId, 'Paige', 'Thompson', 25, null, 'male', null, '', 'mthompson1828@gmail.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-02-04', '2018-02-04');
call addMember(@membershipId, 'Tyler', 'Storey', 25, null, 'male', null, '', 'xtyler.storeyx@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-04-08', '2018-04-08');
call addMember(@membershipId, 'Kim', 'Ward', 25, null, 'male', null, '', 'wardlk4@gmail.com', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-04-08', '2018-04-08');
call addMember(@membershipId, 'J', 'Ball', 25, null, 'male', null, '', 'ball7134@hotmail.com', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-04-08', '2018-04-08');
call addMember(@membershipId, '', 'Welker', 25, null, 'male', null, '', 'nicwelker@gmail.com', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-05-17', '2018-05-17');
call addMember(@membershipId, '', 'Cyr', 25, null, 'male', null, '', 'cyr61us@yahoo.com', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-05-20', '2018-05-20');
call addMember(@membershipId, 'John', 'Babcock', 25, null, 'male', null, '', 'johnbabcock@hotmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-05-27', '2018-05-27');
call addMember(@membershipId, 'Fallen', 'Bennett', 25, null, 'male', null, '', 'maggie.pierce@youthdynamics.org', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Dave', 'Holman', 25, null, 'male', null, '', 'jetdog23@aol.com', null, null, '', '59701',
               'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Megan', 'O\'keefe', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Ryan', 'Mullcahy', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-04-18', '2016-04-18');
call addMember(@membershipId, 'Todd/Mitzi', 'Leibrand', 25, null, 'male', null, '', '', null, null, '', '59421', 'MT',
               @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Lee', 'Tierney', 25, null, 'male', null, '', 'ltiern8@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Nate', 'Watson', 25, null, 'male', null, '', 'nate.watson82@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Maggie', 'Ferko', 25, null, 'male', null, '', 'margaretferko@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Larry/Nancy', 'Hoffman', 25, null, 'male', null, '', 'hardrock4800@gmail.com', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Laura', 'Moore', 25, null, 'male', null, '', 'laurazorn3@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Hilary', 'Risser', 25, null, 'male', null, '', 'hsrisser@mac.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'John', 'Tomich', 25, null, 'male', null, '', 'jtomich@bresnan.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Pam', 'Dazby-Cote', 25, null, 'male', null, '', 'pamcote114@msn.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'J.', 'Boyer', 25, null, 'male', null, '', 'jamieboyer1130@hotmail.com', null, null,
               'Anaconda', '59711', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-28', '2016-02-28');
call addMember(@membershipId, 'Ben', 'Rapkod', 25, null, 'male', null, '', 'claudiarap59701@msn.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Susan', 'Callaghan', 25, null, 'male', null, '', 'sjcmt2003@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-02-28', '2016-02-28');
call addMember(@membershipId, 'Taryn', 'Calderon', 25, null, 'male', null, '', 'tarynj21691@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Allison', 'Andersen', 25, null, 'male', null, '', 'phippsallijo@juno.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-10-24', '2016-10-24');
call addMember(@membershipId, 'Chrissy', 'Hadley', 25, null, 'male', null, '', 'clhadley@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Kathleen', 'Moore', 25, null, 'male', null, '', 'kmoore@cherrycreekradio.org', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Michelle', 'Wold', 25, null, 'male', null, '', 'tcmmwold9000@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Sarah', 'Storey', 25, null, 'male', null, '', 'sstorey@mtech.edu', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Randi', 'Luke', 25, null, 'male', null, '', 'randijo.luke@yahoo.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-10-03', '2016-10-03');
call addMember(@membershipId, 'Katherine/James', 'Sweet', 25, null, 'male', null, '', 'kgames1021@yahoo.com', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Andrew', 'Calderon', 25, null, 'male', null, '', 'tarynj21691@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-01-21', '2018-01-21');
call addMember(@membershipId, 'Ryan/Lindsey', 'Toderovich', 25, null, 'male', null, '', 'lindseytoderovich@gmail.com',
               null, null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Logan', 'Dudding', 25, null, 'male', null, '', 'lwdudding@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-04-08', '2018-04-08');
call addMember(@membershipId, 'Jason/Jennifer', 'Hands', 25, null, 'male', null, '', 'lilyuma@live.com', null, null,
               'Wiseriver', '59762', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-04-29', '2018-04-29');
call addMember(@membershipId, 'Amanda', 'Ortiz-Cabrera', 25, null, 'male', null, '', 'aortiz@mtech.edu', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, '', 'Moran', 25, null, 'male', null, '', '', null, null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'James', 'Hadley', 25, null, 'male', null, '', 'mtcarddealer@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2017-04-29', '2018-04-29');
call addMember(@membershipId, '', 'Persons', 25, null, 'male', null, '', 'twopersons4jesus@bresnan.net', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2015-10-24', '2016-10-24');
call addMember(@membershipId, 'Claudial/Brent', 'Rapkoch', 25, null, 'male', null, '', 'claudiarap59701@msn.com', null,
               null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Denise', 'Hendrix', 25, null, 'male', null, '', 'dhendrix49@outlook.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Janet/Stephen', 'Coe', 25, null, 'male', null, '', 'janetmcoe@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Lani', 'Odenbeck', 25, null, 'male', null, '', 'loni.odenbeckdvm@gmail.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Maggie/Logan', 'Matteson', 25, null, 'male', null, '', 'magzrhax@yahoo.com', null, null,
               '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'Lawrence', 'Weirick (Family Outreach)', 25, null, 'male', null, '', 'lawrenw@gmail.com',
               null, null, '', '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);
call addMembership('seasonal', 0, null);
set @membershipId = last_insert_id();
call addMembershipPeriod(@membershipId, '2016-01-01', '2017-01-01');
call addMember(@membershipId, 'T', 'McCullak', 25, null, 'male', null, '', 'toshmcc3@gmail.com', null, null, '',
               '59701', 'MT', @memberId);
call updateMembership(@membershipId, 'seasonal', 0, @memberId);