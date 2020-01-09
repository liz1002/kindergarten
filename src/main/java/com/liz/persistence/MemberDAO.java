package com.liz.persistence;

import java.util.List;

import com.liz.domain.MemberVO;

public interface MemberDAO {
	public void insert(MemberVO vo);
	public List<MemberVO> selectList();
	public MemberVO selectByNo(int mNo);
	public MemberVO selectById(String mId);
	public MemberVO selectByIdAndPwd(String mId, String mPwd);
	public void updateUseByMNo(int mNo);
}
