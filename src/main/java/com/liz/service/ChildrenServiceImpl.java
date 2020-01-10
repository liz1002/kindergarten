package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.ChildrenVO;
import com.liz.persistence.ChildrenDAO;

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

	@Override
	public ChildrenVO selectByChNo(int chNo) {
		return dao.selectByChNo(chNo);
	}

	@Override
	public List<ChildrenVO> selectParentListByChNo(int chNo) {
		return dao.selectParentListByChNo(chNo);
	}

	@Override
	public void removeByChNo(int chNo) {
		dao.deleteByChNo(chNo);
		
		//부모 테이블 같이 삭제
	}

	
	
	
}
