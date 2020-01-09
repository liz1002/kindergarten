package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.DirectorVO;
import com.liz.persistence.DirectorDAO;
import com.liz.persistence.KindergartenDAO;
import com.liz.persistence.MemberDAO;

@Service
public class DirectorServiceImpl implements DirectorService{
	
	@Autowired
	private DirectorDAO dDao;
	
	@Autowired
	private MemberDAO mDao;	
	
	@Autowired
	private KindergartenDAO kDao;	

	@Override
	@Transactional
	public void registDirector(DirectorVO dVo) {
		if(dVo.getmVo().getmName() != null) {
			mDao.insert(dVo.getmVo()); //회원추가
		}
		kDao.insert(dVo.getkVo()); //유치원추가
		dDao.insert(dVo); //원장추가
	}
	
	@Override
	public List<DirectorVO> selectListByNo(int mNo) {
		return dDao.selectListByNo(mNo);
	}	
}
