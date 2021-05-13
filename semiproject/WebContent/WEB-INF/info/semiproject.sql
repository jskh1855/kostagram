  
DROP TABLE k_likes;
DROP TABLE k_board;
DROP TABLE k_member cascade constraint;

CREATE SEQUENCE k_seq;
DROP SEQUENCE k_seq;

COMMIT

CREATE TABLE k_member(
   user_email varchar2(100) primary key,
   user_name varchar2(100) not null,
   user_password varchar2(100) not null,
   profile_image varchar2(100) default 'profile_default.jpg',
   profile_content varchar2(100),
   user_email_checked number(1,0) default 0
);

delete from k_board;

CREATE TABLE k_board(
   no number primary key,
   post_image varchar2(100) not null,
   content varchar2(100),
   time_posted date,
   user_email varchar2(100) not null, 
   constraint user_email_fk foreign key (user_email) references k_member(user_email)
);

CREATE TABLE k_likes(
   no number,
   user_email varchar2(100) not null,
   constraint like_pk primary key(no,user_email),
   constraint user_email_fk1 foreign key (user_email) references k_member(user_email),
   constraint no_fk foreign key (no) references k_board(no)
);

select no,count(*) AS likes from k_likes group by no;

insert into k_member(user_email,user_name,user_password, profile_image,user_email_checked) values('123@gmail','김','123', 'profile_default.jpg',1);
insert into k_member(user_email,user_name,user_password, profile_image,user_email_checked) values('234@gmail','이','234', 'profile_default.jpg',1);
insert into k_member(user_email,user_name,user_password, profile_image,user_email_checked) values('345@gmail','박','345', 'profile_default.jpg',1);
insert into k_member(user_email,user_name,user_password,user_email_checked) values('456@gmail','정','456',1);

delete from k_member;
insert into k_likes(no,user_email) values(1,'123@gmail');
insert into k_likes(no,user_email) values(1,'234@gmail');
insert into k_likes(no,user_email) values(1,'345@gmail');
insert into k_likes(no,user_email) values(2,'123@gmail');
insert into k_likes(no,user_email) values(3,'123@gmail');
insert into k_likes(no,user_email) values(3,'345@gmail');
-- 중복 insert 불가 -- fail
insert into k_likes(no,user_email) values(1,'123@gmail');
----------------------------------------------------------------

select * from k_board;
select * from K_LIKES;
select * from K_MEMBER;

-- BoardDAO.posting(PostVO vo) 
-- 포스트 작성 
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,?, ?, 0, sysdate, ?) ;
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_1.jpg', '내용1', sysdate, '123@gmail'); 
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_2.jpg', '내용2', sysdate, '123@gmail');  
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_3.jpg', '내용33', sysdate, '123@gmail');  
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_4.jpg', '내용1', sysdate, '234@gmail');  
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_5.jpg', '내용2', sysdate, '234@gmail');  
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_6.jpg', '내용33', sysdate, '234@gmail');
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_7.jpg', '내용1', sysdate, '123@gmail'); 
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_8.jpg', '내용2', sysdate, '123@gmail');  
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_9.jpg', '내용33', sysdate, '123@gmail');  
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_10.jpg', '내용1', sysdate, '234@gmail');  
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_11.jpg', '내용2', sysdate, '234@gmail');  
insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_12.jpg', '내용33', sysdate, '234@gmail');

------ 동은이 본문 띄우기 테스트용
-- insert into k_board(no, post_image, content, time_posted, user_email) values (k_seq.nextval,'image_12.jpg', '내용33', sysdate, '234@gmail');
-- 새 컬럼을 생성 (기존 데이터를 옮겨담을 컬럼)
-- ALTER TABLE k_board ADD COLUMN_COPY varchar2(500);
 
-- 새 컬럼에 기존 데이터를 입력 (SET)
-- UPDATE k_board SET COLUMN_COPY = content;
 
-- 기존 컬럼 삭제
-- ALTER TABLE k_board DROP COLUMN content;
 
-- 새 컬럼의 이름을 기존 컬럼 이름으로 RENAME
-- ALTER TABLE k_board RENAME COLUMN COLUMN_COPY TO content;
-- select * from k_board;

-- BoardDAO.getPostingTotalList()    
-- 전체 리스트 출력 
-- no < 시퀀스 시간순으로 입력되므로 역순으로 출력
select no, post_image 
from K_BOARD
order by no desc;

--<수정>
select b.no, b.post_image, b.content, to_char(b.time_posted,'MM.DD'), m.user_name, m.profile_image
from K_BOARD b, K_MEMBER m
where b.user_email = m.user_email
order by no desc


-- BoardDAO.getPostingTop3List()
-- 좋아요 top3 포스팅 필요(no, email, content, count(*) 게시글당 좋아요수 카운트)
select rownum, A.*
from ( select count(t2.no) as like_sum, t1.post_image
         from k_board t1
         left join k_likes t2
               on t1.no = t2.no
         group by t2.no, t1.post_image
         order by like_sum desc) A
where rownum <=3 ;

--<수정>
select rownum, A.*
from ( select count(t2.no) as like_sum, t1.no, t1.post_image, t1.content, to_char(t1.time_posted,'MM.DD')AS UPLOAD_DATE,t1.user_email,
(SELECT user_name FROM k_member WHERE user_email=t1.user_email) as USER_NAME 
         from k_board t1
         left join k_likes t2
               on t1.no = t2.no
         group by t2.no, t1.no, t1.post_image, t1.content, to_char(t1.time_posted,'MM.DD'),t1.user_email
         order by like_sum desc) A
where rownum <=3 ;

-- top3에 이름 같이 가져오기
select rownum, A.*
from ( select count(t2.no) as like_sum, t1.no, t1.post_image, t1.content, to_char(t1.time_posted,'MM.DD') AS UPLOAD_DATE, t1.user_email,
		(SELECT user_name FROM k_member WHERE user_email=t1.user_email) as USER_NAME 
         from k_board t1
         left join k_likes t2
               on t1.no = t2.no
         group by t2.no, t1.no, t1.post_image, t1.content, to_char(t1.time_posted,'MM.DD'), t1.user_email
         order by like_sum desc
         ) A
where rownum <=3 ;

-- top3에 프로필 이미지 같이 가져오기
select rownum, A.*
from ( select count(t2.no) as like_sum, t1.no, t1.post_image, t1.content, to_char(t1.time_posted,'MM.DD')AS UPLOAD_DATE,t1.user_email,
(SELECT user_name FROM k_member WHERE user_email=t1.user_email) as USER_NAME,
(SELECT profile_image FROM k_member WHERE user_email=t1.user_email) as USER_IMAGE
         from k_board t1
         left join k_likes t2
               on t1.no = t2.no
         group by t2.no, t1.no, t1.post_image, t1.content, to_char(t1.time_posted,'MM.DD'),t1.user_email
         order by like_sum desc) A
where rownum <=3 ;

-- select * from k_member;
-- select * from k_board;

-- BoardDAO. getPostingListByUser(String email)
-- 개인 포스팅 출력 return ArrayList<PosVO>

SELECT no, post_image, content, to_char(time_posted,'MM.DD')
FROM k_board
WHERE user_email='123@gmail'  
ORDER BY time_posted DESC;

SELECT no, post_image, content, to_char(time_posted,'MM.DD')
FROM k_board
WHERE user_email=?  
ORDER BY time_posted DESC;

-- BoardDAO.getPostingByNo(String no)
-- 포스팅 상세보기  return pvo

--1
select no, post_image, content, to_char(time_posted, 'yyyy-mm-dd'), (select count(*) from k_likes where no = 1) as 좋아요수 
from k_board
where no = 1 

--2 글번호로 조인
SELECT T1.NO, T1.post_image, TO_CHAR(T1.TIME_POSTED,'YYYY.MM.DD'), COUNT(*)
FROM K_BOARD T1 
LEFT JOIN K_LIKES T2 
ON T1.NO = T2.NO
WHERE T1.NO=1
GROUP BY T1.NO,T1.post_image, T1.HITS, T1.TIME_POSTED;
-- K_BOARD 의 CONTENT 의 DATATYPE을 꼭 CLOB로 해야하는지 ? VARCHAR2(1000)등 글자수 제한은 안되나용 


--BoardDAO.deletePosting(String no)
--글번호에 해당하는 포스팅 삭제
DELETE
FROM k_board
where no=1;


-- 글1 에 좋아요 누른 사람 목록
-- 
SELECT T2.user_EMAIL
FROM K_BOARD T1 
LEFT JOIN K_LIKES T2 
ON T1.NO = T2.NO
WHERE T1.NO=1; 
----------------------------------------------------------------------------

-- MemberDAO. (String email)     
-- 개인 프로필 출력 return ArrayList<PosVO>
-- Q1. 세션에 정보가 있는데 처리해야하는지.. ??  
-- Q2. MemberDAO인지?  BoardDAO인지?  
select name, profile_image, profile_content
from k_member
where email='123@gmail'

---------------------------------------------------------------------------
--PostDAO 

--좋아요 생성
INSERT INTO k_likes(no,user_email)
VALUES(?,?)

-- 좋아요 조회
SELECT no,user_email
FROM k_likes
WHERE no=? and email=?

--좋아요 삭제
DELETE
FROM k_likes
where no=? and email=?

SELECT no
FROM k_likes
WHERE user_email = '123@gmail';

SELECT COUNT(*) FROM k_likes WHERE no = 1;

select user_email from k_member;
