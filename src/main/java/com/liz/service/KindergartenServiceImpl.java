package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.KindergartenVO;
import com.liz.persistence.KindergartenDAO;

@Service
public class KindergartenServiceImpl implements KindergartenService{
	
	@Autowired
	private KindergartenDAO kDao;

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
}