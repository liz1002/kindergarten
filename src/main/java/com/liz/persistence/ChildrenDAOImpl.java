package com.liz.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.ChildrenVO;

@Repository
public class ChildrenDAOImpl implements ChildrenDAO{

	private final static String namespace = "mappers.ChildrenMapper.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ChildrenVO chVo) {
		sqlSession.insert(namespace + "insert", chVo);
	}

	@Override
	public List<ChildrenVO> selectListByKNo(int kNo) {
		return sqlSession.selectList(namespace + "selectListByKNo", kNo);
	}

	@Override
	public List<ChildrenVO> selectListByCNo(int cNo) {
		return sqlSession.selectList(namespace + "selectListByCNo", cNo);
	}

	@Override
	public ChildrenVO selectByChNo(int chNo) {
		return sqlSession.selectOne(namespace + "selectByChNo", chNo);	
	}

	@Override
	public List<ChildrenVO> selectParentListByChNo(int chNo) {
		return sqlSession.selectList(namespace + "selectParentListByChNo", chNo);
	}

	@Override
	public void deleteByChNo(int chNo) {
		sqlSession.delete(namespace + "deleteByChNo", chNo);
	}
}
