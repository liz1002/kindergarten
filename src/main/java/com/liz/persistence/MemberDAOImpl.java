package com.liz.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.liz.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{

	private final static String namespace = "mappers.MemberMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(MemberVO vo) {
		sqlSession.insert(namespace + "insert", vo);
	}

	@Override
	public List<MemberVO> selectList() {
		return sqlSession.selectList(namespace + "selectList");
	}

	@Override
	public MemberVO selectByNo(int mNo) {
		return sqlSession.selectOne(namespace + "selectByNo", mNo);
	}

	@Override
	public MemberVO selectById(String mId) {
		return sqlSession.selectOne(namespace + "selectById", mId);
	}

	@Override
	public MemberVO selectByIdAndPwd(String mId, String mPwd) {
		Map<String, String> map = new HashMap<>();
		map.put("mId", mId);
		map.put("mPwd", mPwd);
		return sqlSession.selectOne(namespace + "selectByIdAndPwd", map);		
	}

	@Override
	public void updateUseByMNo(int mNo) {
		sqlSession.update(namespace + "updateUseByMNo", mNo);
	}

	@Override
	public void updateInfo(MemberVO vo) {
		sqlSession.update(namespace + "updateInfo", vo);
	}

}

