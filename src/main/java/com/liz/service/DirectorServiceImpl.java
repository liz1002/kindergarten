package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.DirectorVO;
import com.liz.persistence.DirectorDAO;

@Service
public class DirectorServiceImpl implements DirectorService{
	
	@Autowired
	private DirectorDAO dDao;	
	
	@Override
	public List<DirectorVO> selectListByMNo(int mNo) {
		return dDao.selectListByMNo(mNo);
	}

	@Override
	public DirectorVO selectByDNo(int dNo) {
		return dDao.selectByDNo(dNo);
	}

	@Override
	public DirectorVO selectBydMainAndMNo(int mNo) {
		return dDao.selectBydMainAndMNo(mNo);
	}

	@Override
	public void modifyNickname(DirectorVO vo) {
		dDao.updateNickname(vo);
	}

	@Override
	@Transactional
	public void modifyDMain(DirectorVO dVo) {
		dDao.updateDMainByMNo(dVo.getmVo().getmNo()); //해당 원장의 대표 유치원 모두 해제
		dDao.updateDMainByDNo(dVo.getdNo()); //선택한 유치원 대표로 등록
	}	

	@Override
	public void removeByKNo(int kNo) {
		dDao.deleteByKNo(kNo);
	}
}
