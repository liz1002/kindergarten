package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khrd.domain.KindergartenVO;
import com.khrd.persistence.KindergartenDAO;

@Service
public class KindergartenServiceImpl implements KindergartenService{
	
	@Autowired
	private KindergartenDAO dao;

	@Override
	public void regist(KindergartenVO vo) {
		dao.insert(vo);
	}

	@Override
	public List<KindergartenVO> selectList() {
		return dao.selectList();
	}

	@Override
	public KindergartenVO selectByNo(int kNo) {
		return dao.selectByNo(kNo);
	}

	@Override
	public KindergartenVO selectByCode(String kCode) {
		return dao.selectByCode(kCode);
	}
}