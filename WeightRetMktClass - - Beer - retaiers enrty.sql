
select advertiser,market,r.retmktid,class from WeightRetMktClass w join  mt2sql00.masterclientcoverage.dbo.retmkt r on w.retmktid =r.retmktid
where r.advertiser like 'Winn Dixie%' and r.market like 'Saraso%'

select * from mt2sql00.masterclientcoverage.dbo.retmkt r  where r.advertiser like 'Winn Dixie%' and r.market like 'Saraso%'





--insert into WeightRetMktClass (retmktid,class) values (29666,'B')


--insert into WeightRetMktClass (retmktid,class) values (29724,'A')


	select * from mt2sql14.sitecontrol.dbo.WeightRetMktClass 

	where retmktid in 
	(
	33183,
33183,
45969,
45969,
45969,
45969,
45969,
45969)
--	insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45644,'A') 
--insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (44779,'C') 
--insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45645,'C') 
--insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45643,'C') 


--insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (43041,'C')
--insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45406,'A')
--insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (19316,'C')
--insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45395,'A')


--select retmktid, count(class) from mt2sql14.sitecontrol.dbo.WeightRetMktClass group by retmktid
--having count(class) > 1



insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (33183,'C')
insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (33183,'C')
insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45969,'C')
insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45969,'C')
insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45969,'C')
insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45969,'C')
insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45969,'C')
insert into mt2sql14.sitecontrol.dbo.WeightRetMktClass (retmktid,class) values (45969,'C')