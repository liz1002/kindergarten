-- DODAM --

use kindergarten;



-- ȸ�� �� ��ġ��(�ּ� ���� ���̺�) -----

desc member;
select * from member order by m_no desc;

desc kindergarten;
select * from kindergarten order by k_no desc;

desc class;
select * from class order by c_no desc;



-- ȸ�� �� �з� -----

desc director;
select * from director order by d_no desc;

desc teacher;
select * from teacher order by t_no desc;

desc parent;
select * from parent order by p_no desc;

desc children;
select * from children order by ch_no desc;

desc family;
select * from family order by f_no desc;;



-- ī�װ� -----

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



-- Attach ���̺� -----

-- ����X�ٹ�
desc album_children;
select * from album_children;




-- data ---------------------------------------

insert into member(m_type, m_id, m_pwd, m_name, m_regdate, m_tel, m_nickname) values
(1, 'director1', '1111', '�����', now(), null, '�ѱ����� ����'),
(1, 'director1', '1111', '�̿���', now(), null, '������ ����'),
(1, 'director1', '1111', '�ڿ���', now(), null, '������ġ�� ����'),
(2, 'teacher1', '1111', '��̳�', now(), null, '����� ����'),
(2, 'teacher2', '2222', '�ǹ���', now(), '010-1234-5678', '����� �δ���'),
(2, 'teacher3', '3333', '������', now(), '010-1234-5678', '���ϼ��� �δ���'),
(2, 'teacher4', '4444', '���̰�', now(), '010-1234-5678', '����ī�� ����'),
(2, 'teacher5', '5555', '�ڹ���', now(), '010-1234-5678', '�񼺹� ����'),
(3, 'parent1', '1111', '��θ�', now(), null, '����� ���츾'),
(3, 'parent2', '2222', '�ںθ�', now(), '010-1234-5678', '����� ���� �ҸӴ�'),
(3, 'parent3', '3333', '�̺θ�', now(), '010-1234-5678', '����ī�� �̼��� ����'),
(3, 'parent4', '4444', '�ֺθ�', now(), '010-1234-5678', '�񼺹� ���� �ƺ�'),
(3, 'parent5', '5555', '���θ�', now(), '010-1234-5678', '�񼺹� ������');

insert into kindergarten(k_code, k_name, k_tel, k_address) values
('2SDFE54', '�ѱ�������ġ��', '053-222-7777', '�뱸 ������ ������ 222-7777'),
('D1WE2GB', '��������ġ��', '053-123-4567', '�뱸 ������ ������ 123-1234'),
('SF5E1S3', '������ġ��', '053-987-6543', '�뱸 ������ ���뱸�� 987-6543');

insert into class(c_code, c_name, k_no) values
('E5FD2', '������', 2),
('2E45E', '�����', 2),
('F2HJR', '�ʷϹ�', 2),
('JD2S5', '�Ķ���', 2),
('2W8FG', '�����', 2),
('XV8RW', '�񼺹�', 3),
('O8TYK', '������', 3),
('NX5S2', '�伺��', 3),
('0BXG2', '����ī��', 3),
('IW87X', '���ϼ���', 3);

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