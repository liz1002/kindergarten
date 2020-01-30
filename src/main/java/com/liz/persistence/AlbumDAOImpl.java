package com.liz.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.AlbumVO;
import com.liz.domain.Criteria;

@Repository
public class AlbumDAOImpl implements AlbumDAO{

	private final static String namespace = "mappers.AlbumMapper.";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(AlbumVO aVo) {
		sqlSession.insert(namespace + "insert", aVo);
	}

	@Override
	public List<AlbumVO> selectListByCNo(int cNo, Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cNo", cNo);
		map.put("cri", cri);
		return sqlSession.selectList(namespace + "selectListByCNo", map);
	}

	@Override
	public int selectListCountByCNo(int cNo) {
		return sqlSession.selectOne(namespace + "selectListCountByCNo", cNo);
	}

	@Override
	public AlbumVO selectByANo(int aNo) {
		return sqlSession.selectOne(namespace + "selectByANo", aNo);
	}

	@Override
	public void delete(int aNo) {
		sqlSession.delete(namespace + "delete", aNo);
	}
	
}
