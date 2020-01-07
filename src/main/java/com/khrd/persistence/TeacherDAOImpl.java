package com.khrd.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khrd.domain.TeacherVO;

@Repository
public class TeacherDAOImpl implements TeacherDAO{

	private final static String namespace = "mappers.TeacherMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(TeacherVO vo) {
		sqlSession.insert(namespace + "insert", vo);
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
	public void update(TeacherVO vo, int tNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("vo", vo);
		map.put("tNo", tNo);
		sqlSession.update(namespace + "update", vo);
	}
	
}
