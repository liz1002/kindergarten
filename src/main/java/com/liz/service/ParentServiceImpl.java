package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.ParentVO;
import com.liz.persistence.ParentDAO;

@Service
public class ParentServiceImpl implements ParentService{
	
	@Autowired
	private ParentDAO dao;

	@Override
	public void regist(ParentVO vo) {
		dao.insert(vo);
	}

	@Override
	public List<ParentVO> selectListByMNo(int mNo) {
		return dao.selectListByMNo(mNo);
	}

	@Override
	public List<ParentVO> selectListByKNo(int kNo) {
		return dao.selectListByKNo(kNo);
	}
	
	@Override
	public List<ParentVO> selectListByCNo(int cNo) {
		return dao.selectListByCNo(cNo);
	}
	
	@Override
	public List<ParentVO> selectListByMNoAndKNO(int mNo, int kNo) {
		return dao.selectListByMNoAndKNO(mNo, kNo);
	}

	@Override
	public List<ParentVO> selectFamilyListByMNo(int mNo) {
		return dao.selectFamilyListByMNo(mNo);
	}

	@Override
	public void removeByMNo(int mNo) {
		dao.deleteByMNo(mNo);
	}

	@Override
	public void removeByChNo(int chNo) {
		dao.deleteByChNo(chNo);
	}
}
