package com.liz.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.PApproveVO;
import com.liz.domain.ParentVO;

@Repository
public class ParentDAOImpl implements ParentDAO{

	private final static String namespace = "mappers.ParentMapper.";

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(ParentVO pVo) {
		sqlSession.insert(namespace + "insert", pVo);
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
	public List<ParentVO> selectChildListByMNoAndKNo(int mNo, int kNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("mNo", mNo);
		map.put("kNo", kNo);
		return sqlSession.selectList(namespace + "selectChildListByMNoAndKNo", map);
	}

	@Override
	public List<ParentVO> selectListByChNo(int chNo) {
		return sqlSession.selectList(namespace + "selectListByChNo", chNo);
	}

	@Override
	public ParentVO selectByPNo(int pNo) {
		return sqlSession.selectOne(namespace + "selectByPNo", pNo);
	}

	@Override
	public ParentVO selectByMNoAndChNo(PApproveVO paVo) {
		return sqlSession.selectOne(namespace + "selectByMNoAndChNo", paVo);
	}

	@Override
	public ParentVO selectBypMainAndMNo(int mNo) {
		return sqlSession.selectOne(namespace + "selectBypMainAndMNo", mNo);
	}

	@Override
	public void deleteByMNoAndKNo(int mNo, int kNo) {
		Map<String, Integer> map = new HashMap<>();
		map.put("mNo", mNo);
		map.put("kNo", kNo); 
		sqlSession.delete(namespace + "deleteByMNoAndKNo", map);
	}

	@Override
	public void deleteByPNo(int pNo) {
		sqlSession.delete(namespace + "deleteByPNo", pNo);
	}
	
	@Override
	public void deleteByMNo(int mNo) {
		sqlSession.delete(namespace + "deleteByMNo", mNo);
	}
	
	@Override
	public void deleteByChNo(int chNo) {
		sqlSession.delete(namespace + "deleteByChNo", chNo);
	}

	@Override
	public void updateNickname(ParentVO pVo) {
		sqlSession.update(namespace + "updateNickname", pVo);
	}

	@Override
	public void updatePMainByMNo(int mNo) {
		sqlSession.update(namespace + "updatePMainByMNo", mNo);
	}

	@Override
	public void updatePMainByPNo(int pNo) {
		sqlSession.update(namespace + "updatePMainByPNo", pNo);
	}
}
