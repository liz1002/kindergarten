package com.liz.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.DirectorVO;

@Repository
public class DirectorDAOImpl implements DirectorDAO{

	private final static String namespace = "mappers.DirectorMapper.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(DirectorVO vo) {
		sqlSession.insert(namespace + "insert", vo);
	}

	@Override
	public List<DirectorVO> selectListByMNo(int mNo) {
		return sqlSession.selectList(namespace + "selectListByMNo", mNo);
	}
	@Override
	public DirectorVO selectByDNo(int dNo) {
		return sqlSession.selectOne(namespace + "selectByDNo", dNo);
	}

	@Override
	public void updateNickname(DirectorVO vo) {
		sqlSession.update(namespace + "updateNickname", vo);
	}

	
}
