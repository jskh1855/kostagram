select * from board;

create sequence k_seq;
drop table k_board;
drop table k_member;
drop table k_likes;
create table k_board(
	no number primary key,
	title varchar2(100) not null,
	content clob,
	hits number default 0,
	time_posted date,
	email varchar2(100) not null, 
	constraint email_fk foreign key (email) references k_member(email)
)

create table k_likes(
	no number,
	email varchar2(100) not null,
	constraint email_fk1 foreign key (email) references k_member(email),
	constraint no_fk foreign key (no) references k_board(no)
)

create table k_member(
	email varchar2(100) primary key,
	name varchar2(100) not null,
	password varchar2(100) not null,
	profile_image varchar2(100),
	profile_content clob
)

select no,count(*) AS likes from k_likes group by no;

select title 
	select email,
	DENSE_RANK() over(order by count(no) DESC) like_rank
	from k_likes
from K_BOARD;

insert into k_member(email,name,password) values('123@gmail','김','123');
insert into k_member(email,name,password) values('234@gmail','이','234');
insert into k_member(email,name,password) values('345@gmail','박','345');

insert into K_BOARD(no,title,email) values(1,'a','123@gmail');
insert into K_BOARD(no,title,email) values(2,'b','234@gmail');
insert into K_BOARD(no,title,email) values(3,'c','345@gmail');

insert into k_likes(no,email) values(1,'123@gmail');
insert into k_likes(no,email) values(1,'234@gmail');
insert into k_likes(no,email) values(1,'345@gmail');
insert into k_likes(no,email) values(2,'123@gmail');
insert into k_likes(no,email) values(3,'123@gmail');
insert into k_likes(no,email) values(3,'345@gmail');




select * from member;
delete from member;
drop table member;
drop table user;
create table k_member (
  name varchar2(50),
  password varchar2(50),
  email varchar2(50),
  image varchar2(50),
  intro clob,
  emailHash varchar2(64),
  emailChecked NUMBER(1,0)
)

create table board(
	no number primary key,
	title varchar2(100) not null,
	content clob not null,
	hits number default 0,
	time_posted date not null,
	id varchar2(100) not null,
	constraint myboard_fk foreign key(id) references board_member(id)
)