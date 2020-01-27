package com.liz.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.TApproveVO;
import com.liz.domain.TeacherVO;

@Repository
public class TeacherDAOImpl implements TeacherDAO{

	private final static String namespace = "mappers.TeacherMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(TeacherVO tVo) {
		sqlSession.insert(namespace + "insert", tVo);
	}

	@Override
	public List<TeacherVO> selectList() {
		return sqlSession.selectList(namespace + "selectList");
	}

	@Override
	public List<TeacherVO> selectListByMNo(int mNo) {
		return sqlSession.selectList(namespace + "selectListByMNo", mNo);
	}

	@Override
	public List<TeacherVO> selectListByKNo(int kNo) {
		return sqlSession.selectList(namespace + "selectListByKNo", kNo);
	}

	@Override
	public List<TeacherVO> selectListByCNo(int cNo) {
		return sqlSession.selectList(namespace + "selectListByCNo", cNo);
	}

	@Override
	public List<TeacherVO> selectListByMNoAndKNo(int mNo, int kNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mNo", mNo);
		map.put("kNo", kNo);
		return sqlSession.selectList(namespace + "selectListByMNoAndKNo", map);
	}

	@Override
	public TeacherVO selectByTNo(int tNo) {
		return sqlSession.selectOne(namespace + "selectByTNo", tNo);
	}
	
	@Override
	public TeacherVO selectByMNoAndCNoAndTType(TApproveVO taVo) {
		return sqlSession.selectOne(namespace + "selectByMNoAndCNoAndTType", taVo);
	}

	@Override
	public TeacherVO selectBytMainAndMNo(int mNo) {
		return sqlSession.selectOne(namespace + "selectBytMainAndMNo", mNo);
	}
		
	@Override
	public void updateNickname(TeacherVO tVo) {
		sqlSession.update(namespace + "updateNickname", tVo);
	}
	
	@Override
	public void updateTMainByMNo(int mNo) {
		sqlSession.update(namespace + "updateTMainByMNo", mNo);
	}

	@Override
	public void updateTMainByTNo(int tNo) {
		sqlSession.update(namespace + "updateTMainByTNo", tNo);
	}

	@Override
	public void deleteByTNo(int tNo) {
		sqlSession.delete(namespace + "deleteByTNo", tNo);
	}

	@Override
	public void deleteByMNoAndKNo(int mNo, int kNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mNo", mNo);
		map.put("kNo", kNo);
		sqlSession.delete(namespace + "deleteByMNoAndKNo", map);
	}

}