package com.liz.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.BoardVO;

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
	public List<BoardVO> selectListByCNo(int cNo) {
		return sqlSession.selectList(namespace + "selectListByCNo", cNo);
	}

}
