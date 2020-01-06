package com.khrd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.TeacherVO;

@Repository
public class TeacherDAOImpl implements TeacherDAO{

	private final static String namespace = "mappers.TeacherMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(TeacherVO vo) {
		sqlSession.insert(namespace + "insert", vo);
	}

	@Override
	public List<TeacherVO> selectList() {
		return null;
	}
	
}
