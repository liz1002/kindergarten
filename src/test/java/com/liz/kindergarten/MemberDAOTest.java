package com.liz.kindergarten;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liz.domain.MemberVO;
import com.liz.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MemberDAOTest {
	
	@Autowired
	private MemberDAO dao;
	
	//@Test
	public void testInsert() {
		dao.insert(new MemberVO(0, 2, "teacher1", "1111", "선생님", null, "010-2222-1111", "보라반 담임", 0));
		dao.insert(new MemberVO(0, 3, "parent1", "1111", "학부모", null, "010-2222-3333", "보라반 희윤맘", 0));
	}
	
//	@Test
	public void testSelectList() {
		dao.selectList();
	}
	
//	@Test
	public void testSelectByNo() {
		dao.selectByNo(1);
	}
}
