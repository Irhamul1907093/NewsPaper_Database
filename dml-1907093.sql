set linesize 1000
set pagesize 400

--inserting values in table

insert into topic(topic_id,title) values(11,'politics');
insert into topic(topic_id,title) values(12,'business');
insert into topic(topic_id,title) values(13,'international');
insert into topic(topic_id,title) values(14,'economics');
insert into topic(topic_id,title) values(15,'sports');
insert into topic(topic_id,title) values(16,'entertainment');
insert into topic(topic_id,title) values(17,'environment');
insert into topic(topic_id,title) values(18,'education');
insert into topic(topic_id,title) values(19,'agriculture');
insert into topic(topic_id,title) values(20,'economics'); 

insert into journalist(j_id,j_name) values(101,'raya bacchan');
insert into journalist(j_id,j_name) values(102,'akbar hossain');
insert into journalist(j_id,j_name) values(103,'angkita biswas');
insert into journalist(j_id,j_name) values(104,'rahat mollick');
insert into journalist(j_id,j_name) values(105,'ahnaf saber');
insert into journalist(j_id,j_name) values(106,'nihal mojumder');
insert into journalist(j_id,j_name) values(107,'james anderson');
insert into journalist(j_id,j_name) values(108,'zamshed islam');
insert into journalist(j_id,j_name) values(109,'dibbo dey');
insert into journalist(j_id,j_name) values(110,'sakif zawad');

insert into news(news_id,description,n_date,topic_id,j_id) values (1,'a','21-dec-25',11,101);
insert into news(news_id,description,n_date,topic_id,j_id) values(2,'b','22-feb-17',12,102);
insert into news(news_id,description,n_date,topic_id,j_id) values(3,'c','24-mar-27',12,103);
insert into news(news_id,description,n_date,topic_id,j_id) values(4,'d','22-nov-23',16,104);
insert into news(news_id,description,n_date,topic_id,j_id) values(5,'e','11-feb-12',18,105);
insert into news(news_id,description,n_date,topic_id,j_id) values(6,'f','11-oct-29',19,106);
insert into news(news_id,description,n_date,topic_id,j_id) values(7,'g','27-jul-15',14,107);
insert into news(news_id,description,n_date,topic_id,j_id) values(8,'f','22-jan-12',15,108);
insert into news(news_id,description,n_date,topic_id,j_id) values(9,'i','14-jan-16',16,109);
insert into news(news_id,description,n_date,topic_id,j_id) values(10,'j','18-jan-27',16,110);


insert into  subscribers (sub_id,sub_name,sub_age,sub_type) values(51,'aboni',17,'child');
insert into  subscribers (sub_id,sub_name,sub_age,sub_type)  values(52,'sami',24,'adult');
insert into  subscribers (sub_id,sub_name,sub_age,sub_type)  values(53,'zakaria',21,'adult');
insert into  subscribers (sub_id,sub_name,sub_age,sub_type)  values(54,'rafi',25,'adult');
insert into  subscribers (sub_id,sub_name,sub_age,sub_type)  values(55,'mahatab',34,'adult');
insert into  subscribers (sub_id,sub_name,sub_age,sub_type)  values(56,'miraj',51,'adult');
insert into  subscribers (sub_id,sub_name,sub_age,sub_type)  values(57,'nazmul',62,'senior citizen');
insert into  subscribers (sub_id,sub_name,sub_age,sub_type)  values(58,'rokon',68,'senior citizen');
insert into  subscribers (sub_id,sub_name,sub_age,sub_type)  values(59,'sara',27,'adult');
insert into  subscribers (sub_id,sub_name,sub_age,sub_type)  values(60,'simi',22,'adult');

insert into feedback (news_id,sub_id,reaction,comments) values(1,51,'like','good');
insert into feedback (news_id,sub_id,reaction,comments) values(2,52,'love','impressive');
insert into feedback (news_id,sub_id,reaction,comments) values(3,53,'love','good');
insert into feedback (news_id,sub_id,reaction,comments) values(4,54,'like','good');
insert into feedback (news_id,sub_id,reaction,comments) values(5,55,'dislike','bad');
insert into feedback (news_id,sub_id,reaction,comments) values(6,56,'dislike','bad');
insert into feedback (news_id,sub_id,reaction,comments) values(7,57,'angry','very unpleasent');
insert into feedback (news_id,sub_id,reaction,comments) values(8,58,'love','praise worthy');
insert into feedback (news_id,sub_id,reaction,comments) values(9,59,'like','amazing');
insert into feedback (news_id,sub_id,reaction,comments) values(10,60,'angry','good');

--displaying data of table using select

select *from subscribers where sub_name='simi';
select *from news where news_id=1;

--updating data in table

--changing subscribers name
update subscribers set sub_name='natasha' where sub_id=53;
--changing journalist name
update journalist set j_name='anshul chauhan' where j_id=102;


--deleting row from table

delete from feedback where news_id=10;
--to check if it's working
select *from feedback;
--inserting this again
insert into feedback (news_id,sub_id,reaction,comments) values(10,60,'angry','good');


--UNION

--SHOWING THE NAME OF THE JOURNALISTS WHOSE NAME STARTS WITH a OR HAS M IN IT
select j_name from journalist where j_name like 'a%' union select j_name from journalist where j_name like '%m%'; 

--INTERSECT

--SHOWING THE NAME OF THE JOURNALISTS WHOSE NAME ENDS WITH 'N' AND HAS 'A' IN THE NAME
select j_name from journalist where j_name like '%n' intersect select j_name from journalist where j_name like '%a%';

--EXCEPT/MINUS

--SHOWING THE NAME OF THE JOURNALISTS WHOSE NAME ENDS WITH 'N' BUT NO 'R' IN THE NAME
select j_name from journalist where j_name like '%n' minus select j_name from journalist where j_name like '%r%';  


--WITH CLAUSE

--SHOWING INFO OF SUBSCRIBERS HAVING HIGHEST AGE USING WITH CLAUSE
with maximum as (select max(sub_age) as max_age from subscribers)
select * from subscribers,maximum where subscribers.sub_age=maximum.max_age;

--AGGREGATE FUNCTION

--TOTAL ROW IN TABLE
select count(*) from topic;

--TOTAL UNIQUE(NAME) JOURNALISTS IN NAME
select count(distinct title) as titles from topic;

--AVERAGE AGE OF SUBSCRIBERS TABLE
select avg(sub_age) from subscribers;

--SUM OF AGE IN SUBSCRIBERS TABLE

select sum(sub_age) from subscribers;

--MAXIMUM AGE OF SUBSCRIBERS TABLE
select max(sub_age) from subscribers;

--MINIMUM AGE OF SUBSCRIBERS TABLE
select min(sub_age) from subscribers;

--NESTED SUBQUERY

--SHOWING TOPIC TITLE OF A JOURNALIST
select title from topic where topic_id=(select topic_id from news where j_id=(select j_id from journalist where j_name='raya bacchan'));


--SET MEMBERSHIP(IN,NOT IN)

--SHOWING NAME OF TITLES HAVING 'S' IN THE END AND 'I' IN THE NAME
select title from topic where title like '%s' and title in (select title from topic where title like '%i%');  
select distinct(title) from topic where title like '%s' and title in (select title from topic where title like '%i%');  


--SHOWING NAME OF TITLES HAVING 'S' IN THE END BUT NO 'I' IN THE NAME
select title from topic where title like '%s' and title not in (select title from topic where title like '%i%');  
select distinct(title) from topic where title like '%s' and title not in (select title from topic where title like '%i%'); 


--SOME,ALL

--SHOWING SUBSCRIBERS HAVING AGE HIGHER THANT AT LEAST ONE MEMBER WITH LEAST AGE 25
select sub_name from subscribers where sub_age>some(select sub_age from subscribers where sub_age>=25);

--SHOWING SUBSCRIBERS HAVING AGE HIGHER THANT AT ALL MEMBERS WITH LEAST AGE 25
select sub_name from subscribers where sub_age>all(select sub_age from subscribers where sub_age>=25);

--SHOWING SUBSCRIBERS HAVING AGE HIGHER OR EQUAL THAN ALL MEMBERS WITH LEAST AGE 25
select sub_name from subscribers where sub_age>=all(select sub_age from subscribers where sub_age>=25);

--EXISTS,NOT EXISTS

--FINDING A TITLE WITH LETTER 'N' IF THERE IS TITLE WITH LETTER 'B'
select title from topic where title like '%n%' and exists(select title from topic where title like '%b%');

--FINDING A TITLE WITH LETTER 'N' IF THERE IS NO TITLE WITH LETTER 'P'
select title from topic where title like '%n%' and not exists(select title from topic where title like '%p%');

--STRING OPERATION

--FINDING INFO OF JOURNALISTS ENDING 'R'
select * from journalist where j_name like '%r';

--FINDING INFO OF COMMENTS IN FEEDBACK WITH LENGTH 4
select * from feedback where comments like '____';

--JOIN OPERATION

--NATURAL JOIN
select * from topic natural join news where title='politics';  

--join
select * from topic join news on topic.title = 'politics' and topic.topic_id = news.topic_id;   

--left outer,right outer,full join


select title,n_date from topic left outer join news using(topic_id);
select title,n_date from topic right outer join news using(topic_id);      
select title,n_date from topic full outer join news using(topic_id);


--CREATING A VIEW OF topic economics 

drop view econ;
create view econ as select * from topic natural join news where title='economics'; 
select * from econ;

--CREATING VIEW  using econ

drop view ONETWO;
create view ONETWO as select * from econ where title = 'economics'; 
select * from ONETWO;




