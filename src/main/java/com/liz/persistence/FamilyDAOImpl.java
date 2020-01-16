package com.liz.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.FamilyVO;

@Repository
public class FamilyDAOImpl implements FamilyDAO{

	private final static String namespace = "mappers.FamilyMapper.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(int pNo, int chNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pNo", pNo);
		map.put("chNo", chNo);
		sqlSession.insert(namespace + "insert", map);
	}

	@Override
	public List<FamilyVO> selectParentNullListByChNo(int kNo, int chNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("kNo", kNo);
		map.put("chNo", chNo);
		return sqlSession.selectList(namespace + "selectParentNullListByChNo", map);
	}

	@Override
	public List<FamilyVO> selectListByChNo(int chNo) {
		return sqlSession.selectList(namespace + "selectListByChNo", chNo);
	}

	@Override
	public void deleteByChNo(int chNo) {
		sqlSession.delete(namespace + "deleteByChNo", chNo);
	}
	
	@Override
	public void deleteByPNoAndChNo(int pNo, int chNo) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("pNo", pNo);
		map.put("chNo", chNo);
		sqlSession.delete(namespace + "deleteByPNoAndChNo", map);
	}
}
