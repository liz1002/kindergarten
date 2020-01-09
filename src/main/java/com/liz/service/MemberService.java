package com.liz.service;

import java.util.List;

import com.liz.domain.MemberVO;

public interface MemberService {
	public void regist(MemberVO vo);
	public List<MemberVO> selectList();
	public MemberVO selectByNo(int mNo);
	public MemberVO selectById(String mId);
	public MemberVO selectByIdAndPwd(String mId, String mPwd);
}
