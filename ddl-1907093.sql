--dropping existing tables


drop table feedback;
drop table subscribers;
drop table news;
drop table topic;
drop table journalist;

--creating table

create table topic(
 topic_id int,
title varchar(20),
primary key(topic_id)
);

create table journalist(
	j_id int,
	j_name varchar(20),
	primary key(j_id)
);

create table news(
	news_id int,
	description varchar(50),
	n_date date,
	topic_id int,
	j_id int,
	primary key(news_id),
	foreign key(topic_id) references topic(topic_id),
	foreign key(j_id) references journalist(j_id)
);

create table subscribers(
	sub_id int,
	sub_name varchar(20),
	sub_age int,
	sub_type varchar(20),
	primary key(sub_id)
);

create table feedback(
	news_id int,
	sub_id int,
	reaction varchar(20),
	comments varchar(20),
	primary key(news_id,sub_id),
	foreign key(news_id) references news(news_id) on delete cascade,
	foreign key(sub_id) references subscribers(sub_id) on delete cascade
);

--adding column in table

alter table topic add category char(50);

--modify column in table

alter table topic modify category varchar(20);

--rename column in table

alter table topic rename column category to genre;

--drop column from table

alter table topic drop column genre;