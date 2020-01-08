package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khrd.domain.TeacherVO;
import com.khrd.persistence.TeacherDAO;

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
	public List<TeacherVO> selectByMNo(int mNo) {
		return dao.selectByMNo(mNo);
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
	public List<TeacherVO> selectByMNoAndKNo(int mNo, int kNo) {
		return dao.selectByMNoAndKNo(mNo, kNo);
	}
	
	@Override
	public void modify(TeacherVO vo, int tNo) {
		dao.update(vo, tNo);
	}
	
}
