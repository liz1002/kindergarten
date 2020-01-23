package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.PApproveVO;
import com.liz.domain.ParentVO;
import com.liz.persistence.ParentDAO;

@Service
public class ParentServiceImpl implements ParentService{
	
	@Autowired
	private ParentDAO dao;

	@Override
	public void regist(ParentVO pVo) {
		dao.insert(pVo);
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
	public List<ParentVO> selectChildListByMNo(int mNo) {
		return dao.selectChildListByMNo(mNo);
	}

	@Override
	public ParentVO selectByPNo(int pNo) {
		return dao.selectByPNo(pNo);
	}

	@Override
	public ParentVO selectByMNoAndChNo(PApproveVO paVo) {
		return dao.selectByMNoAndChNo(paVo);
	}

	@Override
	public void removeByMNo(int mNo) {
		dao.deleteByMNo(mNo);
	}

	@Override
	public void removeByPNo(int pNo) {
		dao.deleteByPNo(pNo);
	}

	@Override
	public void modifyNickname(ParentVO pVo) {
		dao.updateNickname(pVo);
	}
}
