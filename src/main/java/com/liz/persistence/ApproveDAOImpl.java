package com.liz.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.ApproveVO;

@Repository
public class ApproveDAOImpl implements ApproveDAO{

	private final static String namespace = "mappers.ApproveyMapper.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ApproveVO aVo) {
		sqlSession.insert(namespace + "insert", aVo);
	}

	@Override
	public List<ApproveVO> selectListByCNo(int cNo) {
		return sqlSession.selectList(namespace + "selectListByCNo", cNo);
	}

	@Override
	public void deleteByMNoAndChNo(ApproveVO aVo) {
		sqlSession.delete(namespace + "deleteByMNoAndChNo", aVo);
	}

	
	
}
