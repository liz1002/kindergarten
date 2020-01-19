package com.liz.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<TeacherVO> selectByMNo(int mNo) {
		return sqlSession.selectList(namespace + "selectByMNo", mNo);
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
	public List<TeacherVO> selectByMNoAndKNo(int mNo, int kNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mNo", mNo);
		map.put("kNo", kNo);
		return sqlSession.selectList(namespace + "selectByMNoAndKNo", map);
	}

	@Override
	public TeacherVO selectByMNoAndCNoAndTType(TeacherVO tVo) {
		return sqlSession.selectOne(namespace + "selectByMNoAndCNoAndTType", tVo);
	}
	
	@Override
	public TeacherVO selectByMNoAndCCodeAndTType(TeacherVO tVo) {
		return sqlSession.selectOne(namespace + "selectByMNoAndCCodeAndTType", tVo);
	}
	
	@Override
	public void update(TeacherVO tVo) {
		sqlSession.update(namespace + "update", tVo);
	}
}
