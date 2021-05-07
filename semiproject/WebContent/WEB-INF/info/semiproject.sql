select * from board;

create sequence k_seq;
drop table k_board;
drop table k_member;
drop table k_likes;
DROP SEQUENCE k_seq;

create table k_board(
	no number primary key,
	title varchar2(100) not null,
	post_image varchar2(100) not null,
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
	profile_content clob,
	user_email_checked number(1,0),
	user_email_hash varchar2(100)
)

select no,count(*) AS likes from k_likes group by no;

insert into k_member(email,name,password) values('123@gmail','김','123');
insert into k_member(email,name,password) values('234@gmail','이','234');
insert into k_member(email,name,password) values('345@gmail','박','345');

insert into K_BOARD(no,title,post_image,email) values(1,'a','a이미지','123@gmail');
insert into K_BOARD(no,title,post_image,email) values(2,'b','b이미지','234@gmail');
insert into K_BOARD(no,title,post_image,email) values(3,'c','c이미지','345@gmail');

insert into k_likes(no,email) values(1,'123@gmail');
insert into k_likes(no,email) values(1,'234@gmail');
insert into k_likes(no,email) values(1,'345@gmail');
insert into k_likes(no,email) values(2,'123@gmail');
insert into k_likes(no,email) values(3,'123@gmail');
insert into k_likes(no,email) values(3,'345@gmail');





----------------------------------------------------------------
select * from k_board;
select * from K_LIKES;
select * from K_MEMBER;

-- 좋아요 top3 포스팅 필요(no, email, content,   count(*) 게시글당 좋아요수 카운트)
select no, email, content
from k_board;

select no, count(*) as likesCount 
from K_LIKES 
group by no;

select b.no, b.email, b.content, l.email as 누가좋아요
from k_board b, K_LIKES l
where b.no = l.no 
group by b.no, b.email, b.content;


select l.no, count(*) as likesCount, b.no
from K_LIKES l, K_BOARD b 
where l.no = b.no
group by l.no;




-- BoardDAO.getPostingTotalList()    
-- 전체 리스트 출력 By 재훈, 진솔   
-- no < 시퀀스 시간순으로 입력되므로 역순으로 출력
select no, post_image 
from K_BOARD
order by no desc;






----------------------------------------------------------------------------



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