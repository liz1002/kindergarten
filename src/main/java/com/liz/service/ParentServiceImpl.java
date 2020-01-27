package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.PApproveVO;
import com.liz.domain.ParentVO;
import com.liz.persistence.ParentDAO;

@Service
public class ParentServiceImpl implements ParentService{
	
	@Autowired
	private ParentDAO dao;

	@Override
	public void regist(ParentVO pVo) {
		if(dao.selectBypMainAndMNo(pVo.getmVo().getmNo()) == null) { //대표(pMain이 1인) 컬럼이 없으면
			pVo.setpMain(1); //대표로 설정
		}
		
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
	public List<ParentVO> selectChildListByMNoAndKNo(int mNo, int kNo) {
		return dao.selectChildListByMNoAndKNo(mNo, kNo);
	}

	@Override
	public List<ParentVO> selectListByChNo(int chNo) {
		return dao.selectListByChNo(chNo);
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
	public ParentVO selectBypMainAndMNo(int mNo) {
		return dao.selectBypMainAndMNo(mNo);
	}

	@Override
	public void removeByPNo(int pNo) {
		dao.deleteByPNo(pNo);
	}

	@Override
	public void removeByMNo(int mNo) {
		dao.deleteByMNo(mNo);
	}

	@Override
	public void removeByMNoAndKNo(int mNo, int kNo) {
		dao.deleteByMNoAndKNo(mNo, kNo);
	}
	
	@Override
	public void removeByChNo(int chNo) {
		dao.deleteByChNo(chNo);
	}

	@Override
	public void modifyNickname(ParentVO pVo) {
		dao.updateNickname(pVo);
	}

	@Override
	@Transactional
	public void modifyPMain(ParentVO pVo) {
		dao.updatePMainByMNo(pVo.getmVo().getmNo()); //해당 학부모의 대표 유치원 모두 해제
		dao.updatePMainByPNo(pVo.getpNo()); //선택한 유치원 대표로 등록
	}
}
