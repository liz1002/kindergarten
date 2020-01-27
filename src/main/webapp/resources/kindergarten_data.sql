-- data ---------------------------------------

insert into member(m_type, m_id, m_pwd, m_name, m_regdate, m_firsttel, m_middletel, m_lasttel) values
(1, 'director1', '1111', '김원장', now(), '010', '1234', '5678'), -- 1
(1, 'director2', '2222', '이원장', now(), '010', '1234', '5678'), -- 2
(1, 'director3', '3333', '박원장', now(), '010', '1234', '5678'), -- 3
(2, 'teacher1', '1111', '김교사', now(), '010', '1234', '5678'), -- 4
(2, 'teacher2', '2222', '이교사', now(), '010', '1234', '5678'), -- 5
(2, 'teacher3', '3333', '박교사', now(), '010', '1234', '5678'), -- 6
(2, 'teacher4', '4444', '최교사', now(), '010', '1234', '5678'), -- 7
(2, 'teacher5', '5555', '정교사', now(), '010', '1234', '5678'), -- 8
(3, 'parent1', '1111', '김부모', now(), '010', '1234', '5678'), -- 9
(3, 'parent2', '2222', '이부모', now(), '010', '1234', '5678'), -- 10
(3, 'parent3', '3333', '박부모', now(), '010', '1234', '5678'), -- 11
(3, 'parent4', '4444', '최부모', now(), '010', '1234', '5678'), -- 12
(3, 'parent5', '5555', '정부모', now(), '010', '1234', '5678'), -- 13
(3, 'parent6', '6666', '황부모', now(), '010', '1234', '5678'), -- 14
(3, 'parent7', '7777', '권부모', now(), '010', '1234', '5678'), -- 15
(3, 'parent8', '8888', '윤부모', now(), '010', '1234', '5678'), -- 16
(3, 'parent9', '9999', '전부모', now(), '010', '1234', '5678'), -- 17
(3, 'parent10', '1010', '강부모', now(), '010', '1234', '5678'); -- 18

insert into kindergarten(k_name, k_areacode, k_dialing, k_tel, k_zipcode, k_firstaddr, k_lastaddr, k_date) values
('한국예술유치원', '053', '222', '7777', '12345', '대구 수성구 범물로 12', '222-7777', '2017-07-04 00:00:00'), -- 헨바베모하슈비
('무지개유치원', '053', '123', '4567', '12345', '대구 수성구 지범로 87', '123-1234', '2018-05-03 00:00:00'), -- 빨주노초파남보
('보노유치원', '053', '987', '6543', '12345', '대구 수성구 동대구로 42', '987-6543', '2018-11-01 00:00:00'), -- 수금지화목토오은
('무지개유치원', '053', '817', '3102', '12345', '대구 수성구 청학로 31', '67-12', '2019-01-01 00:00:00'); -- 빨주노초파남보

insert into class(c_name, k_no) values
('헨델반', 1),('바흐반', 1),('베토벤반', 1),('모차르트', 1),('하이디', 1),('슈베르트반', 1),('비발디반', 1), -- 1~7
('빨강반', 2),('주황반', 2),('노랑반', 2),('초록반', 2),('파랑반', 2),('보라반', 2), -- 8~13
('수성반', 3),('금성반', 3),('지구반', 3),('화성반', 3),('목성반', 3),('토성반', 3),('오스카반', 3),('은하수반', 3), -- 14~21
('빨강반', 4),('주황반', 4),('노랑반', 4),('초록반', 4),('파랑반', 4),('보라반', 4); -- 22~27

insert into director(d_nickname, m_no, k_no) values -- 1~3
('한국예술원장', 1, 1),
('무지개원장', 2, 2),
('보노유치원장', 3, 3),
('무지개유치원장', 2, 4);
	
insert into teacher(t_type, t_nickname, m_no, k_no, c_no) values -- 4~8
(1, '빨강반 담임', 4, 2, 8), -- 김, 무지개1,
(2, '하이디 부담임', 5, 1, 5), -- 이, 한국예술
(1, '주황반담임', 5, 2, 9), -- 이, 무지개1
(2, '주황반 부담임', 6, 2, 9), -- 박, 무지개1
(2, '수성부담임', 6, 3, 14), -- 박, 보노
(1, '노랑반담임', 7, 2, 10), -- 최, 무지개1
(1, '금성 담임', 8, 3, 15); -- 정, 보노

#같은 교사가 이직한 경우 추가

insert into children(ch_name, ch_regdate, k_no, c_no) values
('김원아', now(), 2, 8), ('이원아', now(), 2, 8), ('박원아', now(), 2, 8), ('최원아', now(), 2, 8), ('정원아', now(), 2, 8), -- 무지개1 빨강반 1~5
('김원아', now(), 2, 9), ('이원아', now(), 2, 9), ('박원아', now(), 2, 9), ('최원아', now(), 2, 9), ('정원아', now(), 2, 9), -- 무지개1 주황반 6~10
('김원아', now(), 3, 14), ('이원아', now(), 3, 14), ('박원아', now(), 3, 14), ('최원아', now(), 3, 14), ('정원아', now(), 3, 14); -- 보노 수성반 11~15

#같은 애가 여러 유치원 & 해 바껴서 반 2개인 경우 추가

insert into parent(p_nickname, m_no, ch_no) values -- 9~14
('김원아 엄마', 9, 1), ('김원아 아빠', 10, 1), -- 무지개1 빨강반 김원아
('이원아 엄마', 9, 7), ('이원아 아빠', 10, 7), -- 무지개1 주황반 이원아
('최원아맘', 11, 9), -- 무지개1 주황반 최원아
('정원아 할머니', 12, 10), -- 무지개1 주황반 정원아
('수성  박원아맘', 13, 13), -- 보노 수성반 박원아
('최원아 언니', 14, 14), -- 보노 수성반 최원아
('정원아맘', 11, 15); -- 보노 수성반 정원아

insert into t_approve(m_no, c_no, t_type, t_nickname) values -- 4~8
(4, 1, 1, '헨델반 담임'),
(5, 1, 2, '헨델반 부담임'), (5, 2, 2, '바흐반 부담임'),
(6, 2, 1, '바흐반 담임선생님'),
(7, 3, 1, '베토벤반 담임'),
(8, 5, 1, '하이디 담임');

insert into p_approve(m_no, ch_no, p_nickname) values -- 15~18
(11, 5, '정원아 엄마'), -- 무지개1 빨강반 정원아
(15, 6, '김원아 엄마'), (16, 6, '김원아 아부지'), -- 무지개1 주황반 김원아
(17, 8, '박원아 마미'), -- 무지개1 주황반 박원아
(18, 5, '최원아 할애비'), (18, 9, '최원아 할애비'), -- 무지개1 주황반 최원아
(18, 15, '정원아 할애비'); -- 보노 수성반 정원아


/* - - - - - - - - - - - - - - - - - - */

insert into board(b_content, b_noitce, m_no, c_no) values
("공지 1번 내용입니다.", 1, 2, 8), ("공지 1번 내용입니다.", 1, 2, 9), ("공지 1번 내용입니다.", 1, 2, 10), ("공지 1번 내용입니다.", 1, 2, 11), ("공지 1번 내용입니다.", 1, 2, 12), ("공지 1번 내용입니다.", 1, 2, 13),
("공지 2번 내용입니다.", 1, 2 , 8), ("공지 2번 내용입니다.", 1, 2, 9), ("공지 2번 내용입니다.", 1, 2, 10), ("공지 2번 내용입니다.", 1, 2, 11), ("공지 2번 내용입니다.", 1, 2, 12), ("공지 2번 내용입니다.", 1, 2, 13),
("게시글 1번 내용입니다.", 0, 4, 8), ("게시글 2번 내용입니다.", 0, 4, 8), ("게시글 3번 내용입니다.", 0, 4, 8), ("게시글 4번 내용입니다.", 0, 4, 8), ("게시글 5번 내용입니다.", 0, 4, 8);



