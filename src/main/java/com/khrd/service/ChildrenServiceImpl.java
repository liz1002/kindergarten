package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khrd.domain.ChildrenVO;
import com.khrd.persistence.ChildrenDAO;

@Service
public class ChildrenServiceImpl implements ChildrenService{
	
	@Autowired
	private ChildrenDAO dao;

	@Override
	public void regist(ChildrenVO chVo) {
		dao.insert(chVo);
	}

	@Override
	public List<ChildrenVO> selectListByKNo(int kNo) {
		return dao.selectListByKNo(kNo);
	}

	@Override
	public List<ChildrenVO> selectListByCNo(int cNo) {
		return dao.selectListByCNo(cNo);
	}

	
	
	
}
