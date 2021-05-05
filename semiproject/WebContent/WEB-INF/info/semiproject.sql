select * from board;

create sequence k_seq;

create table k_board(
	no number primary key,
	title varchar2(100) not null,
	content clob not null,
	hits number default 0,
	time_posted date not null,
	email varchar2(100) not null
)

create table k_likes(
	no number,
	email varchar2(100) not null
)

create table k_member(
	email varchar2(100) primary key,
	name varchar2(100) not null,
	password varchar2(100) not null,
	profile_image varchar2(100) not null,
	profile_content clob not null
)
select * from member;
delete from member;
drop table member;
drop table user;
create table member (

  userID varchar2(50),

  userPassword varchar2(50),

  userEmail varchar2(50),
  image varchar2(50),
  userEmailHash varchar2(64),
  userEmailChecked NUMBER(1,0)

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