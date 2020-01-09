package com.liz.kindergarten;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liz.domain.ClassVO;
import com.liz.persistence.ClassDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ClassDAOTest {
	
	@Autowired
	private ClassDAO dao;
	
	@Test
	public void testInsert() {
		dao.insert(new ClassVO(0, "0010001eovp24e", "보라반", 1));
	}
	
	@Test
	public void testSelectList() {
		dao.selectList();
	}
	
	@Test
	public void testSelectByNo() {
		dao.selectByNo(1);
	}
	
	@Test
	public void testSelectByCode() {
		dao.selectByCode("0001enfo3e34");
	}
}
