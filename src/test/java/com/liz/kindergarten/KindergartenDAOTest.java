package com.liz.kindergarten;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.khrd.domain.KindergartenVO;
import com.khrd.persistence.KindergartenDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class KindergartenDAOTest {
	
	@Autowired
	private KindergartenDAO dao;
	
	@Test
	public void testInsert() {
		dao.insert(new KindergartenVO(0, "0001enfo3e34", "무지개유치원", "053-123-1234", "대구 수성구 지범로 8678-84"));
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
