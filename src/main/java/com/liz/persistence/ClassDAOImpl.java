package com.liz.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.ClassVO;

@Repository
public class ClassDAOImpl implements ClassDAO{

	private final static String namespace = "mappers.ClassMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ClassVO vo) {
		sqlSession.insert(namespace + "insert", vo);
	}

	@Override
	public List<ClassVO> selectList() {
		return sqlSession.selectList(namespace + "selectList");
	}

	@Override
	public ClassVO selectByNo(int cNo) {
		return sqlSession.selectOne(namespace + "selectByNo", cNo);
	}

	@Override
	public ClassVO selectByCode(String cCode) {
		return sqlSession.selectOne(namespace + "selectByCode", cCode);
	}
}
