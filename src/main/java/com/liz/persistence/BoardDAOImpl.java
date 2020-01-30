package com.liz.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.BoardVO;
import com.liz.domain.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	private final static String namespace = "mappers.BoardMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(BoardVO bVo) {
		sqlSession.insert(namespace + "insert", bVo);
	}

	@Override
	public List<BoardVO> selectListByCNo(int cNo, Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cNo", cNo);
		map.put("cri", cri);
		return sqlSession.selectList(namespace + "selectListByCNo", map);
	}

	@Override
	public BoardVO selectByBNo(int bNo) {
		return sqlSession.selectOne(namespace + "selectByBNo", bNo);
	}

	@Override
	public int selectListCountByCNo(int cNo) {
		return sqlSession.selectOne(namespace + "selectListCountByCNo", cNo);
	}

	@Override
	public void update(BoardVO bVo) {
		sqlSession.update(namespace + "update", bVo);
	}

	@Override
	public void delete(int bNo) {
		sqlSession.delete(namespace + "delete", bNo);
	}

}
