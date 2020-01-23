package com.liz.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.PApproveVO;

@Repository
public class PApproveDAOImpl implements PApproveDAO{

	private final static String namespace = "mappers.PApproveMapper.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(PApproveVO paVo) {
		sqlSession.insert(namespace + "insert", paVo);
	}
	
	@Override
	public List<PApproveVO> selectListByKNo(int kNo) {
		return sqlSession.selectList(namespace + "selectListByKNo", kNo);
	}
	
	@Override
	public List<PApproveVO> selectListByCNo(int cNo) {
		return sqlSession.selectList(namespace + "selectListByCNo", cNo);
	}
	
	@Override
	public List<PApproveVO> selectListByMNo(int mNo) {
		return sqlSession.selectList(namespace + "selectListByMNo", mNo);
	}

	@Override
	public void deleteByMNoAndChNo(PApproveVO paVo) {
		sqlSession.delete(namespace + "deleteByMNoAndChNo", paVo);
	}	
}
