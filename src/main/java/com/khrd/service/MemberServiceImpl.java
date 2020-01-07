package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.khrd.domain.DirectorVO;
import com.khrd.domain.KindergartenVO;
import com.khrd.domain.MemberVO;
import com.khrd.persistence.DirectorDAO;
import com.khrd.persistence.KindergartenDAO;
import com.khrd.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private DirectorDAO dDao;	
	
	@Autowired
	private KindergartenDAO kDao;	
	
	@Override
	@Transactional
	public void regist(MemberVO vo) {
		dao.insert(vo); //회원추가
	}

	@Override
	@Transactional
	public void registDirector(MemberVO mVo, KindergartenVO kVo) {
		dao.insert(mVo); //회원추가
		if(kVo != null){
			kDao.insert(kVo); //유치원추가
			dDao.insert(new DirectorVO(0, mVo.getmNo(), kVo.getkNo())); //원장추가
		}
	}
	
	@Override
	public List<MemberVO> selectList() {
		return dao.selectList();
	}

	@Override
	public MemberVO selectByNo(int mNo) {
		return dao.selectByNo(mNo);
	}

	@Override
	public MemberVO selectById(String mId) {
		return dao.selectById(mId);
	}

	@Override
	public MemberVO selectByIdAndPwd(String mId, String mPwd) {
		return dao.selectByIdAndPwd(mId, mPwd);
	}
}
