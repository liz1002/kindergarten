-- DODAM --

use kindergarten;



-- 회원 및 유치원(최소 구성 테이블) -----

desc member;
select * from member order by m_no desc;

desc kindergarten;
select * from kindergarten order by k_no desc;

desc class;
select * from class order by c_no desc;



-- 회원 상세 분류 -----

desc director;
select * from director order by d_no desc;

desc teacher;
select * from teacher order by t_no desc;

desc parent;
select * from parent order by p_no desc;
select * from parent join `member` using(m_no);

desc children;
select * from children order by ch_no desc;

desc family;
select * from family;



-- 카테고리 -----

desc board;
select * from board;

desc dosage;
select * from dosage;
	
desc medication; 
select * from medication; 
	
desc album;
select * from album; 

desc notice;
select * from notice; 
	
desc schedule;
select * from schedule;



-- Attach 테이블 -----

-- 원아X앨범
desc album_children;
select * from album_children;




-- data ---------------------------------------

insert into member(m_type, m_id, m_pwd, m_name, m_regdate, m_tel, m_nickname) values
(1, 'director1', '1111', '김원장', now(), null, '한국예술 원장'),
(1, 'director2', '2222', '이원장', now(), null, '무지개 원장'),
(1, 'director3', '3333', '박원장', now(), null, '보노유치원 원장'),
(2, 'teacher1', '1111', '김미나', now(), null, '보라반 담임'),
(2, 'teacher2', '2222', '권민지', now(), '010-1234-5678', '보라반 부담임'),
(2, 'teacher3', '3333', '유은혜', now(), '010-1234-5678', '은하수반 부담임'),
(2, 'teacher4', '4444', '전미경', now(), '010-1234-5678', '오스카반 담임'),
(2, 'teacher5', '5555', '박미지', now(), '010-1234-5678', '목성반 담임'),
(3, 'parent1', '1111', '김부모', now(), null, '보라반 리우맘'),
(3, 'parent2', '2222', '박부모', now(), '010-1234-5678', '노랑반 선우 할머니'),
(3, 'parent3', '3333', '이부모', now(), '010-1234-5678', '오스카반 이서현 엄마'),
(3, 'parent4', '4444', '최부모', now(), '010-1234-5678', '목성반 유라 아빠'),
(3, 'parent5', '5555', '정부모', now(), '010-1234-5678', '목성반 유라맘');

insert into kindergarten(k_code, k_name, k_tel, k_address) values
('2SDFE54', '한국예술유치원', '053-222-7777', '대구 수성구 범물로 222-7777'),
('D1WE2GB', '무지개유치원', '053-123-4567', '대구 수성구 지범로 123-1234'),
('SF5E1S3', '보노유치원', '053-987-6543', '대구 수성구 동대구로 987-6543');

insert into class(c_code, c_name, k_no) values
('E5FD2', '빨강반', 2),
('2E45E', '노랑반', 2),
('F2HJR', '초록반', 2),
('JD2S5', '파랑반', 2),
('2W8FG', '보라반', 2),
('XV8RW', '목성반', 3),
('O8TYK', '지구반', 3),
('NX5S2', '토성반', 3),
('0BXG2', '오스카반', 3),
('IW87X', '은하수반', 3);

insert into director(m_no, k_no) values
(1, 1),
(2, 2),
(3, 3);
	
insert into teacher(t_type, m_no, k_no, c_no) values
(1, 4, 2, 5),
(2, 5, 2, 5),
(2, 6, 3, 10),
(1, 7, 3, 9),
(1, 8, 3, 6);

insert into parent(m_no, k_no, c_no) values
(9, 2, 5),
(9, 2, 4),
(10, 2, 5),
(10, 3, 1),
(10, 3, 10),
(11, 3, 9),
(12, 3, 6),
(13, 3, 6);

insert into children(ch_name, ch_regdate, k_no, c_no) values
('박선우', now(), 2, 5),
('이리우', now(), 2, 5),
('이리아', now(), 2, 4),
('최유라', now(), 3, 6);

insert into family(p_no, ch_no) values 
(1, 2),
(2, 3),
(3, 1),
(7, 4),
(8, 4);

select * from parent;
select * from children;

-- join ----------------------------------------------------

/* 특정 원장의 모든 정보*/
select * from director d join member m on d.m_no=m.m_no 
						join kindergarten k on d.k_no=k.k_no
						where m.m_no = 2;

/* 유치원 별 교사 리스트 */
select * from teacher t join member m on t.m_no=m.m_no 
						join class c on t.c_no=c.c_no 
						join kindergarten k on t.k_no=k.k_no
						where t.k_no = 3; 

/* 반 별 교사 리스트 */
select * from teacher t join member m on t.m_no=m.m_no 
						join class c on t.c_no=c.c_no 
						join kindergarten k on t.k_no=k.k_no
						where t.c_no = 5;
				
/* 특정 교사의 모든 정보*/
select * from teacher t join member m on t.m_no=m.m_no 
						join class c on t.c_no=c.c_no
						join kindergarten k on t.k_no=k.k_no
						where m.m_no = 4 and t.k_no = 2;
						
/* 교사별 유치원&반 리스트 */			
select * from teacher t join class c on t.c_no=c.c_no 
						join kindergarten k on c.k_no=k.k_no
						where t.m_no = 4;
					
/* 유치원 별 부모 리스트 */
select * from parent p join member m on p.m_no=m.m_no
						join class c on p.c_no=c.c_no 
						join kindergarten k on p.k_no=k.k_no
						where p.k_no = 3; 

/* 반 별 부모 리스트 */	
select * from parent p join member m on p.m_no=m.m_no
						join class c on p.c_no=c.c_no
						join kindergarten k on p.k_no=k.k_no
							where p.c_no = 5; 

/* 특정 부모의 모든 정보 */
select * from parent p join `member` m on p.m_no=m.m_no 
						join class c on p.c_no=c.c_no
						join kindergarten k on p.k_no=k.k_no
						where p.m_no=9 and p.k_no=2; 
				
/* 유치원 별 원아 리스트 */
select * from children ch join class c on ch.c_no=c.c_no 
							join kindergarten k on ch.k_no=k.k_no 
							where ch.k_no=2;
				
/* 반 별 원아 리스트 */
select * from children ch join class c on ch.c_no=c.c_no
							join kindergarten k on ch.k_no=k.k_no 
							where ch.c_no=5;


/* 특정 부모의 자녀 리스트 */
select * from family f join parent p on f.p_no=p.p_no
						join children ch on f.ch_no=ch.ch_no
						join class c on ch.c_no=c.c_no
						join kindergarten k on ch.k_no=k.k_no
						where p.m_no=9;
				
/* 특정 자녀의 부모 리스트 (현재 미사용) */
select * from family f join children ch on f.ch_no=ch.ch_no
						join parent p on f.p_no=p.p_no
						join class c on ch.c_no=c.c_no
						join kindergarten k on ch.k_no=k.k_no
						join member m on p.m_no=m.m_no
						where f.ch_no=4;
				
/* 특정 가족 테이블 (?????) */

					


