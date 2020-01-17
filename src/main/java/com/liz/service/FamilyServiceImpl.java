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
	public List<FamilyVO> selectParentNullListByChNo(int kNo, int chNo) {
		return dao.selectParentNullListByChNo(kNo, chNo);
	}
	
	@Override
	public List<FamilyVO> selectListByChNo(int chNo) {
		return dao.selectListByChNo(chNo);
	}

	@Override
	public List<FamilyVO> selectChListByMNoAndKNo(int mNo, int kNo) {
		return dao.selectChListByMNoAndKNo(mNo, kNo);
	}
	
	@Override
	public void removeByChNo(int chNo) {
		dao.deleteByChNo(chNo);
	}

	@Override
	public void removeByPNoAndChNo(int pNo, int chNo) {
		dao.deleteByPNoAndChNo(pNo, chNo);
	}

}