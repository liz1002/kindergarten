package com.liz.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.KindergartenVO;

@Repository
public class KindergartenDAOImpl implements KindergartenDAO{

	private final static String namespace = "mappers.KindergartenMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(KindergartenVO kVo) {
		sqlSession.insert(namespace + "insert", kVo);
	}

	@Override
	public List<KindergartenVO> selectList() {
		return sqlSession.selectList(namespace + "selectList");
	}

	@Override
	public KindergartenVO selectByNo(int kNo) {
		return sqlSession.selectOne(namespace + "selectByNo", kNo);
	}

	@Override
	public KindergartenVO selectByCode(String kCode) {
		return sqlSession.selectOne(namespace + "selectByCode", kCode);
	}

	@Override
	public void update(KindergartenVO vo) {
		sqlSession.update(namespace + "update", vo);
	}
}
