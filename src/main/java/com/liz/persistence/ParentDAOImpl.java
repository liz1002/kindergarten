package com.liz.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.ParentVO;

@Repository
public class ParentDAOImpl implements ParentDAO{

	private final static String namespace = "mappers.ParentMapper.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ParentVO vo) {
		sqlSession.insert(namespace + "insert", vo);
	}

	@Override
	public List<ParentVO> selectListByMNo(int mNo) {
		return sqlSession.selectList(namespace + "selectListByMNo", mNo);
	}

	@Override
	public List<ParentVO> selectListByKNo(int kNo) {
		return sqlSession.selectList(namespace + "selectListByKNo", kNo);
	}

	@Override
	public List<ParentVO> selectListByCNo(int cNo) {
		return sqlSession.selectList(namespace + "selectListByCNo", cNo);
	}
	
	@Override
	public List<ParentVO> selectListByMNoAndKNO(int mNo, int kNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("mNo", mNo);
		map.put("kNo", kNo);
		return sqlSession.selectList(namespace + "selectListByMNoAndKNO", map);
	}

	@Override
	public List<ParentVO> selectChildListByMNo(int mNo) {
		return sqlSession.selectList(namespace + "selectChildListByMNo", mNo);
	}

	@Override
	public void deleteByMNo(int mNo) {
		sqlSession.delete(namespace + "deleteByMNo", mNo);
	}

	@Override
	public void deleteByChNo(int chNo) {
		sqlSession.delete(namespace + "deleteByChNo", chNo);
	}


}
