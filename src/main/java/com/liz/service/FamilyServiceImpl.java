package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.FamilyVO;
import com.liz.persistence.FamilyDAO;

@Service
public class FamilyServiceImpl implements FamilyService{
	
	@Autowired
	private FamilyDAO dao;

	@Override
	public void regist(int pNo, int chNo) {
		dao.insert(pNo, chNo);
	}

	@Override
	public List<FamilyVO> selectParentNullListByChNo(int chNo) {
		return dao.selectParentNullListByChNo(chNo);
	}

	@Override
	public void removeByChNo(int chNo) {
		dao.deleteByChNo(chNo);
	}

	
}
