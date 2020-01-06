package com.khrd.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.DirectorVO;

@Repository
public class DirectorDAOImpl implements DirectorDAO{

	private final static String namespace = "mappers.DirectorMapper.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(DirectorVO vo) {
		sqlSession.insert(namespace + "insert", vo);
	}

	
}
