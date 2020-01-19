package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.ApproveVO;
import com.liz.persistence.ApproveDAO;

@Service
public class ApproveServiceImpl implements ApproveService{
	
	@Autowired
	private ApproveDAO dao;

	@Override
	public void regist(ApproveVO aVo) {
		dao.insert(aVo);
	}

	@Override
	public List<ApproveVO> selectListByCNo(int cNo) {
		return dao.selectListByCNo(cNo);
	}

	@Override
	public void removeByMNoAndChNo(ApproveVO aVo) {
		dao.deleteByMNoAndChNo(aVo);
	}

	

}
