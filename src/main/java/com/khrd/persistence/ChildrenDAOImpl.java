package com.khrd.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.ChildrenVO;

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
}
