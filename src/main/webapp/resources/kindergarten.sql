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
select * from parent join `member` using(m_no);

desc children;
select * from children order by ch_no desc;

desc family;
select * from family;



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
(1, 'director2', '2222', '�̿���', now(), null, '������ ����'),
(1, 'director3', '3333', '�ڿ���', now(), null, '������ġ�� ����'),
(2, 'teacher1', '1111', '��̳�', now(), null, '����� ����'),
(2, 'teacher2', '2222', '�ǹ���', now(), '010-1234-5678', '����� �δ���'),
(2, 'teacher3', '3333', '������', now(), '010-1234-5678', '���ϼ��� �δ���'),
(2, 'teacher4', '4444', '���̰�', now(), '010-1234-5678', '����ī�� ����'),
(2, 'teacher5', '5555', '�ڹ���', now(), '010-1234-5678', '�񼺹� ����'),
(3, 'parent1', '1111', '��θ�', now(), null, '����� ���츾'),
(3, 'parent2', '2222', '�ںθ�', now(), '010-1234-5678', '����� ���� �ҸӴ�'),
(3, 'parent3', '3333', '�̺θ�', now(), '010-1234-5678', '����ī�� �̼��� ����'),
(3, 'parent4', '4444', '�ֺθ�', now(), '010-1234-5678', '�񼺹� ���� �ƺ�'),
(3, 'parent5', '5555', '���θ�', now(), '010-1234-5678', '�񼺹� ����');

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
('�ڼ���', now(), 2, 5),
('�̸���', now(), 2, 5),
('�̸���', now(), 2, 4),
('������', now(), 3, 6);

insert into family(p_no, ch_no) values 
(1, 2),
(2, 3),
(3, 1),
(7, 4),
(8, 4);

select * from parent;
select * from children;

-- join ----------------------------------------------------

/* Ư�� ������ ��� ����*/
select * from director d join member m on d.m_no=m.m_no 
						join kindergarten k on d.k_no=k.k_no
						where m.m_no = 2;

/* ��ġ�� �� ���� ����Ʈ */
select * from teacher t join member m on t.m_no=m.m_no 
						join class c on t.c_no=c.c_no 
						join kindergarten k on t.k_no=k.k_no
						where t.k_no = 3; 

/* �� �� ���� ����Ʈ */
select * from teacher t join member m on t.m_no=m.m_no 
						join class c on t.c_no=c.c_no 
						join kindergarten k on t.k_no=k.k_no
						where t.c_no = 5;
				
/* Ư�� ������ ��� ����*/
select * from teacher t join member m on t.m_no=m.m_no 
						join class c on t.c_no=c.c_no
						join kindergarten k on t.k_no=k.k_no
						where m.m_no = 4 and t.k_no = 2;
						
/* ���纰 ��ġ��&�� ����Ʈ */			
select * from teacher t join class c on t.c_no=c.c_no 
						join kindergarten k on c.k_no=k.k_no
						where t.m_no = 4;
					
/* ��ġ�� �� �θ� ����Ʈ */
select * from parent p join member m on p.m_no=m.m_no
						join class c on p.c_no=c.c_no 
						join kindergarten k on p.k_no=k.k_no
						where p.k_no = 3; 

/* �� �� �θ� ����Ʈ */	
select * from parent p join member m on p.m_no=m.m_no
						join class c on p.c_no=c.c_no
						join kindergarten k on p.k_no=k.k_no
							where p.c_no = 5; 

/* Ư�� �θ��� ��� ���� */
select * from parent p join `member` m on p.m_no=m.m_no 
						join class c on p.c_no=c.c_no
						join kindergarten k on p.k_no=k.k_no
						where p.m_no=9 and p.k_no=2; 
				
/* ��ġ�� �� ���� ����Ʈ */
select * from children ch join class c on ch.c_no=c.c_no 
							join kindergarten k on ch.k_no=k.k_no 
							where ch.k_no=2;
				
/* �� �� ���� ����Ʈ */
select * from children ch join class c on ch.c_no=c.c_no
							join kindergarten k on ch.k_no=k.k_no 
							where ch.c_no=5;


/* Ư�� �θ��� �ڳ� ����Ʈ */
select * from family f join parent p on f.p_no=p.p_no
						join children ch on f.ch_no=ch.ch_no
						join class c on ch.c_no=c.c_no
						join kindergarten k on ch.k_no=k.k_no
						where p.m_no=9;
				
/* Ư�� �ڳ��� �θ� ����Ʈ (���� �̻��) */
select * from family f join children ch on f.ch_no=ch.ch_no
						join parent p on f.p_no=p.p_no
						join class c on ch.c_no=c.c_no
						join kindergarten k on ch.k_no=k.k_no
						join member m on p.m_no=m.m_no
						where f.ch_no=4;
				
/* Ư�� ���� ���̺� (?????) */

					


