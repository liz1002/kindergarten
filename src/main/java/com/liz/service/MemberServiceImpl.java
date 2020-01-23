package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.MemberVO;
import com.liz.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO mDao;
	
	@Override
	@Transactional
	public void regist(MemberVO vo) {
		mDao.insert(vo); //회원추가
	}

	@Override
	public MemberVO selectByNo(int mNo) {
		return mDao.selectByNo(mNo);
	}

	@Override
	public MemberVO selectById(String mId) {
		return mDao.selectById(mId);
	}

	@Override
	public MemberVO selectByIdAndPwd(String mId, String mPwd) {
		return mDao.selectByIdAndPwd(mId, mPwd);
	}

	@Override
	public void modifyUseByMNo(int mNo) {
		mDao.updateUseByMNo(mNo);
	}

	@Override
	public void modifyInfo(MemberVO vo) {
		mDao.updateInfo(vo);
	}
}
