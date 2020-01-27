package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.TApproveVO;
import com.liz.domain.TeacherVO;
import com.liz.persistence.TeacherDAO;

@Service
public class TeacherServiceImpl implements TeacherService{
	
	@Autowired
	private TeacherDAO dao;

	@Override
	public void regist(TeacherVO vo) {
		if(dao.selectBytMainAndMNo(vo.getmVo().getmNo()) == null) { //대표(tMain이 1인) 컬럼이 없으면
			vo.settMain(1); //대표로 설정
		}
		
		dao.insert(vo);
	}

	@Override
	public List<TeacherVO> selectList() {
		return dao.selectList();
	}

	@Override
	public List<TeacherVO> selectListByMNo(int mNo) {
		return dao.selectListByMNo(mNo);
	}

	@Override
	public List<TeacherVO> selectListByKNo(int kNo) {
		return dao.selectListByKNo(kNo);
	}

	@Override
	public List<TeacherVO> selectListByCNo(int cNo) {
		return dao.selectListByCNo(cNo);
	}

	@Override
	public List<TeacherVO> selectListByMNoAndKNo(int mNo, int kNo) {
		return dao.selectListByMNoAndKNo(mNo, kNo);
	}

	@Override
	public TeacherVO selectByTNo(int tNo) {
		return dao.selectByTNo(tNo);
	}

	@Override
	public TeacherVO selectByMNoAndCNoAndTType(TApproveVO taVo) {
		return dao.selectByMNoAndCNoAndTType(taVo);
	}

	@Override
	public TeacherVO selectBytMainAndMNo(int mNo) {
		return dao.selectBytMainAndMNo(mNo); 
	}
	
	@Override
	public void modifyNickname(TeacherVO tVo) {
		dao.updateNickname(tVo);
	}

	@Override
	@Transactional
	public void modifyTMain(TeacherVO tVo) {
		dao.updateTMainByMNo(tVo.getmVo().getmNo()); //해당 교사의 대표 유치원 모두 해제
		dao.updateTMainByTNo(tVo.gettNo()); //선택한 유치원 대표로 등록
	}

	@Override
	public void removeByTNo(int tNo) {
		dao.deleteByTNo(tNo);
	}

	@Override
	public void removeByMNoAndKNo(int mNo, int kNo) {
		dao.deleteByMNoAndKNo(mNo, kNo);
	}
	
}
