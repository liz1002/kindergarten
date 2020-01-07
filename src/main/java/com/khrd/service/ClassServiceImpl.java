package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.khrd.domain.ClassVO;
import com.khrd.domain.TeacherVO;
import com.khrd.persistence.ClassDAO;
import com.khrd.persistence.TeacherDAO;

@Service
public class ClassServiceImpl implements ClassService{

	@Autowired
	private ClassDAO dao;
	
	@Autowired
	private TeacherDAO tDao;

	@Override
	@Transactional
	public void regist(TeacherVO tVo) {
		dao.insert(tVo.getcVo());
		tDao.insert(tVo);
	}

	@Override
	public List<ClassVO> selectList() {
		return dao.selectList();
	}

	@Override
	public ClassVO selectByNo(int cNo) {
		return dao.selectByNo(cNo);
	}

	@Override
	public ClassVO selectByCode(String cCode) {
		return dao.selectByCode(cCode);
	}
}
