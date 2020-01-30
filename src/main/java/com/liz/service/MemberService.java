package com.liz.service;

import com.liz.domain.MemberVO;

public interface MemberService {
	public void regist(MemberVO vo);
	public MemberVO selectByNo(int mNo);
	public MemberVO selectById(String mId);
	public MemberVO selectByIdAndPwd(String mId, String mPwd);
	public void modifyUseByMNo(int mNo);
	public void modifyInfo(MemberVO vo);
}
