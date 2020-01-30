package com.liz.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.Criteria;
import com.liz.domain.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	private final static String namespace = "mappers.NoticeMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(NoticeVO nVo) {
		sqlSession.insert(namespace + "insert", nVo);
	}

	@Override
	public List<NoticeVO> selectListByChNo(int chNo, Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chNo", chNo);
		map.put("cri", cri);
		return sqlSession.selectList(namespace + "selectListByChNo", map);
	}

	@Override
	public NoticeVO selectByNNo(int nNo) {
		return sqlSession.selectOne(namespace + "selectByNNo", nNo);
	}
	
	@Override
	public int selectListCountByChNo(int chNo) {
		return sqlSession.selectOne(namespace + "selectListCountByChNo", chNo);
	}

	@Override
	public void update(NoticeVO nVo) {
		sqlSession.update(namespace + "update", nVo);
	}

	@Override
	public void delete(int nNo) {
		sqlSession.delete(namespace + "delete", nNo);
	}
	
}
