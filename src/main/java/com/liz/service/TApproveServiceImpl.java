package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.TApproveVO;
import com.liz.persistence.TApproveDAO;

@Service
public class TApproveServiceImpl implements TApproveService{
	
	@Autowired
	private TApproveDAO dao;

	@Override
	public void regist(TApproveVO taVo) {
		dao.insert(taVo);
	}

	@Override
	public List<TApproveVO> selectListByKNo(int kNo) {
		return dao.selectListByKNo(kNo);
	}

	@Override
	public void removeByMNoAndCNo(TApproveVO taVo) {
		dao.deleteByMNoAndCNo(taVo);
	}

	

}
