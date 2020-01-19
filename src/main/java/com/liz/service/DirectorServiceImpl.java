package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.DirectorVO;
import com.liz.persistence.DirectorDAO;
import com.liz.persistence.KindergartenDAO;

@Service
public class DirectorServiceImpl implements DirectorService{
	
	@Autowired
	private DirectorDAO dDao;	
	
	@Autowired
	private KindergartenDAO kDao;	

	@Override
	@Transactional
	public void registDirector(DirectorVO dVo) {
		kDao.insert(dVo.getkVo()); //유치원추가
		dDao.insert(dVo); //원장추가
	}
	
	@Override
	public List<DirectorVO> selectListByMNo(int mNo) {
		return dDao.selectListByMNo(mNo);
	}

	@Override
	public DirectorVO selectByDNo(int dNo) {
		return dDao.selectByDNo(dNo);
	}

	@Override
	public void modifyNickname(DirectorVO vo) {
		dDao.updateNickname(vo);
	}	
}
