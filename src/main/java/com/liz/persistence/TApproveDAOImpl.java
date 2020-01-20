package com.liz.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.TApproveVO;

@Repository
public class TApproveDAOImpl implements TApproveDAO{

	private final static String namespace = "mappers.TApproveyMapper.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(TApproveVO taVo) {
		sqlSession.insert(namespace + "insert", taVo);
	}

	@Override
	public List<TApproveVO> selectListByKNo(int kNo) {
		return sqlSession.selectList(namespace + "selectListByKNo", kNo);
	}

	@Override
	public void deleteByMNoAndCNo(TApproveVO taVo) {
		sqlSession.delete(namespace + "deleteByMNoAndCNo", taVo);
	}
}
