package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khrd.domain.ParentVO;
import com.khrd.persistence.ParentDAO;

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
	public List<ParentVO> selectListByMNoAndKNO(int mNo, int kNo) {
		return dao.selectListByMNoAndKNO(mNo, kNo);
	}
	
	
}
