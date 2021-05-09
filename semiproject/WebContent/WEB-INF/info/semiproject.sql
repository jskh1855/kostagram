

drop table k_likes;
drop table k_board;
drop table k_member;

create sequence k_seq;
DROP SEQUENCE k_seq;

commit

create table k_member(
	user_email varchar2(100) primary key,
	user_name varchar2(100) not null,
	user_password varchar2(100) not null,
	profile_image varchar2(100),
	profile_content varchar2(100),
	user_email_checked number(1,0),
	user_email_hash varchar2(100)
);

create table k_board(
	no number primary key,
	post_image varchar2(100) not null,
	content varchar2(100),
	hits number default 0,
	time_posted date,
	user_email varchar2(100) not null, 
	constraint user_email_fk foreign key (user_email) references k_member(user_email)
<<<<<<< HEAD
)
=======
);
>>>>>>> branch 'main' of https://github.com/kim-hyeungsuk/kostagram.git

create table k_likes(
	no number,
	user_email varchar2(100) not null,
	constraint user_email_fk1 foreign key (user_email) references k_member(user_email),
	constraint no_fk foreign key (no) references k_board(no)
);

<<<<<<< HEAD
create table k_member(
	user_email varchar2(100) primary key,
	user_name varchar2(100) not null,
	user_password varchar2(100) not null,
	profile_image varchar2(100),
	profile_content clob,
	user_email_checked number(1,0),
	user_email_hash varchar2(100)
)
=======
>>>>>>> branch 'main' of https://github.com/kim-hyeungsuk/kostagram.git

select no,count(*) AS likes from k_likes group by no;

insert into k_member(user_email,user_name,user_password) values('123@gmail','김','123');
insert into k_member(user_email,user_name,user_password) values('234@gmail','이','234');
insert into k_member(user_email,user_name,user_password) values('345@gmail','박','345');

<<<<<<< HEAD
insert into K_BOARD(no,title,post_image,user_email) values(1,'a','a이미지','123@gmail');
insert into K_BOARD(no,title,post_image,user_email) values(2,'b','b이미지','234@gmail');
insert into K_BOARD(no,title,post_image,user_email) values(3,'c','c이미지','345@gmail');
=======
insert into K_BOARD(no,post_image,user_email) values(1,'a이미지','123@gmail');
insert into K_BOARD(no,post_image,user_email) values(2,'b이미지','234@gmail');
insert into K_BOARD(no,post_image,user_email) values(3,'c이미지','345@gmail');
>>>>>>> branch 'main' of https://github.com/kim-hyeungsuk/kostagram.git

insert into k_likes(no,user_email) values(1,'123@gmail');
insert into k_likes(no,user_email) values(1,'234@gmail');
insert into k_likes(no,user_email) values(1,'345@gmail');
insert into k_likes(no,user_email) values(2,'123@gmail');
insert into k_likes(no,user_email) values(3,'123@gmail');
insert into k_likes(no,user_email) values(3,'345@gmail');





----------------------------------------------------------------
select * from k_board;
select * from K_LIKES;
select * from K_MEMBER;



-- BoardDAO.getPostingTotalList()    
-- 전체 리스트 출력 
-- no < 시퀀스 시간순으로 입력되므로 역순으로 출력
select no, post_image 
from K_BOARD
order by no desc;

-- BoardDAO.getPostingTop3List()
-- 좋아요 top3 포스팅 필요(no, email, content,   count(*) 게시글당 좋아요수 카운트)
select rownum, A.*
from ( select count(t2.no) as like_sum, t1.post_image
		from k_board t1
		left join k_likes t2
				on t1.no = t2.no
		group by t2.no, t1.post_image
		order by like_sum desc) A
where rownum <=3 ;


-- BoardDAO.posting(PostVO vo) 
-- 포스트 작성 
insert into k_board(no, post_image, content, hits, time_posted, user_email) values (k_seq.nextval,?, ?, 0, sysdate, ?)  
insert into k_board(no, post_image, content, hits, time_posted, user_email) values (k_seq.nextval,'파일명', '내용1', 0, sysdate, '123@gmail') ; 
insert into k_board(no, post_image, content, hits, time_posted, user_email) values (k_seq.nextval,'파일명22', '내용2', 0, sysdate, '123@gmail');  
insert into k_board(no, post_image, content, hits, time_posted, user_email) values (k_seq.nextval,'파일명33', '내용33', 0, sysdate, '123@gmail');  
insert into k_board(no, post_image, content, hits, time_posted, user_email) values (k_seq.nextval,'파일명11', '내용1', 0, sysdate, '234@gmail');  
insert into k_board(no, post_image, content, hits, time_posted, user_email) values (k_seq.nextval,'파일명22', '내용2', 0, sysdate, '234@gmail');  
insert into k_board(no, post_image, content, hits, time_posted, user_email) values (k_seq.nextval,'파일명33', '내용33', 0, sysdate, '234@gmail');  


-- MemberDAO.  (String email)     
-- 개인 프로필 출력 return ArrayList<PosVO>
-- Q1. 세션에 정보가 있는데 처리해야하는지.. ??  
-- Q2. MemberDAO인지?  BoardDAO인지?  
select name, profile_image, profile_content
from k_member
where email='123@gmail'


-- BoardDAO.  (String email)
-- 개인 포스팅 출력 return ArrayList<PosVO>

select no, post_image  
from k_board
where user_email='123@gmail'  
order by time_posted desc;

select no, post_image  
from k_board
where user_email=?
order by time_posted desc;


-- BoardDAO.getPostingByNo(String no)
-- 포스팅 상세보기  return pvo

--1
select no, post_image, content, hits, to_char(time_posted, 'yyyy-mm-dd'), (select count(*) from k_likes where no = 1) as 좋아요수 
from k_board
where no = 1 

--2글번호로 조인
SELECT T1.NO, T1.post_image, T1.HITS, TO_CHAR(T1.TIME_POSTED,'YYYY.MM.DD'), COUNT(*)
FROM K_BOARD T1 
LEFT JOIN K_LIKES T2 
ON T1.NO = T2.NO
WHERE T1.NO=1
GROUP BY T1.NO,T1.post_image, T1.HITS, T1.TIME_POSTED;
-- K_BOARD 의 CONTENT 의 DATATYPE을 꼭 CLOB로 해야하는지 ? VARCHAR2(1000)등 글자수 제한은 안되나용 


-- 글1 에 좋아요 누른 사람 목록
-- 
SELECT T2.user_EMAIL
FROM K_BOARD T1 
LEFT JOIN K_LIKES T2 
ON T1.NO = T2.NO
WHERE T1.NO=1; 
----------------------------------------------------------------------------
