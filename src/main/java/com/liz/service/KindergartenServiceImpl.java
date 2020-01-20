package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.KindergartenVO;
import com.liz.persistence.DirectorDAO;
import com.liz.persistence.KindergartenDAO;

@Service
public class KindergartenServiceImpl implements KindergartenService{
	
	@Autowired
	private KindergartenDAO kDao;	
	
	@Autowired
	private DirectorDAO dDao;

	@Override
	public List<KindergartenVO> selectList() {
		return kDao.selectList();
	}

	@Override
	public KindergartenVO selectByNo(int kNo) {
		return kDao.selectByNo(kNo);
	}

	@Override
	public KindergartenVO selectByCode(String kCode) {
		return kDao.selectByCode(kCode);
	}

	@Override
	public void modify(KindergartenVO kVo) {
		kDao.update(kVo);
	}

	@Override
	@Transactional
	public void removeByKNo(int kNo) {
		dDao.deleteByKNo(kNo);
		kDao.deleteByKNo(kNo);
		
	}
}