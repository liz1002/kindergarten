package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.PApproveVO;
import com.liz.persistence.PApproveDAO;

@Service
public class PApproveServiceImpl implements PApproveService{
	
	@Autowired
	private PApproveDAO dao;

	@Override
	public void regist(PApproveVO paVo) {
		dao.insert(paVo);
	}
	
	@Override
	public List<PApproveVO> selectListByKNo(int kNo) {
		return dao.selectListByKNo(kNo);
	}

	@Override
	public List<PApproveVO> selectListByCNo(int cNo) {
		return dao.selectListByCNo(cNo);
	}

	@Override
	public List<PApproveVO> selectListByMNo(int mNo) {
		return dao.selectListByMNo(mNo);
	}

	@Override
	public void removeByMNoAndChNo(PApproveVO paVo) {
		dao.deleteByMNoAndChNo(paVo);
	}
}
