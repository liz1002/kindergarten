-- DODAM --

use kindergarten;



-- ȸ�� �� ��ġ��(�ּ� ���� ���̺�) -----

desc member;
select * from member;

desc kindergarten;
select * from kindergarten;

desc class;
select * from class;

desc t_approve;
select * from t_approve;

desc p_approve;
select * from p_approve;

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




-- join ----------------------------------------------------

/* ��ġ�� �� �� ����Ʈ */
select * from class where k_no=2 order by c_name;

/* Ư�� ������ ��� ����*/
select * from director d join member m on d.m_no=m.m_no 
						join kindergarten k on d.k_no=k.k_no 
						where k_use=0 and m.m_no=2;

/* ��ġ�� �� ���� ����Ʈ */
select * from teacher t join member m on t.m_no=m.m_no 
						join class c on t.c_no=c.c_no 
						join kindergarten k on t.k_no=k.k_no
						where t.k_no = 2; 

/* �� �� ���� ����Ʈ */
select * from teacher t join member m on t.m_no=m.m_no 
						join class c on t.c_no=c.c_no 
						join kindergarten k on t.k_no=k.k_no
						where t.c_no = 1;
				
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
						join children ch on p.ch_no=ch.ch_no
						join class c on ch.c_no=c.c_no 
						join kindergarten k on ch.k_no=k.k_no
						where k.k_no=2 group by m.m_no order by m_name;

/* �� �� �θ� ����Ʈ */	
select * from parent p join member m on p.m_no=m.m_no
						join children ch on p.ch_no=ch.ch_no
						join class c on ch.c_no=c.c_no
						join kindergarten k on ch.k_no=k.k_no
						where c.c_no=1 order by m_name; 

/* Ư�� �θ��� ��� ���� */
select * from parent p join member m on p.m_no=m.m_no 
						join children ch on P.ch_no=ch.ch_no
						join class c on ch.c_no=c.c_no
						join kindergarten k on ch.k_no=k.k_no
						where p.m_no=9 and k.k_no=2; 
				
/* ��ġ�� �� ���� ����Ʈ */
select * from children ch join class c on ch.c_no=c.c_no 
							join kindergarten k on ch.k_no=k.k_no 
							where ch.k_no=2 order by c.c_name, ch.ch_name;
				
/* �� �� ���� ����Ʈ */
select * from children ch join class c on ch.c_no=c.c_no
							join kindergarten k on ch.k_no=k.k_no 
							where ch.c_no=1
							order by ch.ch_name;
					
/* Ư�� ������ ��� ����*/
select * from children ch join class c on ch.c_no=c.c_no 
							join kindergarten k on ch.k_no=k.k_no 
							where ch.ch_no=2 and k.k_no=2;

/* Ư�� �θ��� �ڳ� ����Ʈ */
select * from parent p join children ch on p.ch_no=ch.ch_no
						join class c on ch.c_no=c.c_no
						join kindergarten k on ch.k_no=k.k_no
						where p.m_no=9 and ch.k_no=2 order by ch.ch_regdate;
				
/* Ư�� �ڳ��� �θ� ����Ʈ (���� �̻��) */
select * from children ch join parent p on ch.ch_no=p.ch_no
						join member m on p.m_no=m.m_no
						where ch.ch_no=3
						order by m.m_name;
	
				
/* ���� ���� �� ���� ���� ���� �θ� ����Ʈ */
-- select * from member m left join 
-- 	(select m_no from parent where ch_no = 1) p on m.m_no = p.m_no
-- 	where m.m_type = 3 and p.m_no is null;
		
-- ��ġ�� �� 
-- select * from parent p left join 
-- 	(select p_no from family where ch_no = 3) f on p.p_no = f.p_no
-- 	join member m on p.m_no = m.m_no
-- 	where m.m_type = 3 and k_no = 2 and f.p_no is null;

-- ���� �˻�
-- select m_name, m_nickname, group_concat(ch_no separator '|')  group by ch_no;
-- 
-- select m_name, m_nickname, group_concat(ch.ch_no separator '|') as ch_no 
-- 	from family f join parent p on f.p_no=p.p_no
-- 					join children ch on f.ch_no=ch.ch_no
-- 					join `member` m on p.m_no=m.m_no
-- 				group by ch.ch_no;
				
				
/* ��ġ�� �� ���� ���� ��� ����Ʈ */
select * from t_approve ta join member m on ta.m_no=m.m_no
							join class c on ta.c_no=c.c_no
							where c.k_no=1;
					
select * from teacher where m_no=6 and c_no=1 and t_type=1; -- �̹� �����ϴ� ���� �˻���
select * from teacher t join kindergarten k on t.k_no=k.k_no where k.k_no=1; -- ��ġ���� ���� ����Ʈ
					
/* ��ġ�� �� �кθ� ���� ��� ����Ʈ */
select * from p_approve pa join member m on pa.m_no=m.m_no
						join children ch on pa.ch_no=ch.ch_no
						where ch.k_no=2 order by m.m_name;
				
select * from parent where m_no=9 and ch_no=1; -- �̹� �����ϴ� �θ� �˻���
select * from parent p join children ch on p.ch_no=ch.ch_no
						join kindergarten k on k.k_no=ch.k_no where k.k_no=2; -- ��ġ���� �кθ� ����Ʈ
				
/* �� �� �кθ�  ���� ��� ����Ʈ */
select * from p_approve pa join member m on pa.m_no=m.m_no
						join children ch on pa.ch_no=ch.ch_no
						where ch.c_no=9;
select * from parent p join children ch on p.ch_no=ch.ch_no
						join class c on c.c_no=ch.c_no where c.c_no=9; -- ���� �кθ� ����Ʈ

/* ��ġ�� �̸����� �˻� */
select * from kindergarten where k_name like '%��%' order by k_name, k_date desc;
insert into t_approve(m_no, c_no, t_nickname, t_type) values(6,3, '232323', 1) 


select * from teacher;