package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.TApproveVO;
import com.liz.domain.TeacherVO;
import com.liz.persistence.TeacherDAO;

@Service
public class TeacherServiceImpl implements TeacherService{
	
	@Autowired
	private TeacherDAO dao;

	@Override
	public void regist(TeacherVO vo) {
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
	public void modifyNickname(TeacherVO tVo) {
		dao.updateNickname(tVo);
	}

	@Override
	public void removeByTNo(int tNo) {
		dao.deleteByTNo(tNo);
	}
	
}
