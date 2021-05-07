drop table k_board;
drop table k_member;
drop table k_likes;

CREATE SEQUENCE k_seq;
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
	profile_content clob
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
----------------------------------------------------------------

-- BoardDAO.getPostingTotalList()    
-- 전체 리스트 출력 By 재훈, 진솔   
-- no < 시퀀스 시간순으로 입력되므로 역순으로 출력
select no, post_image 
from K_BOARD
order by no desc;

-- BoardDAO.getPostingTop3List()
-- 좋아요 순위 3위까지 출력
 SELECT ROWNUM, A.*
 FROM  (  SELECT COUNT(T2.NO) AS LIKE_NUM
				           , T1.TITLE
				   FROM K_BOARD T1 
				   LEFT JOIN K_LIKES T2 
				                ON T1.NO = T2.NO
				   GROUP BY T2.NO , T1.TITLE
				   ORDER BY LIKE_NUM DESC 
             ) A -- 좋아요 수를 카운트하기 위해 LEFT JOIN을 한 테이블을 A로 묶음
 WHERE ROWNUM <= 3 ; 
