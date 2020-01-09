package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.ClassVO;
import com.liz.domain.TeacherVO;
import com.liz.persistence.ClassDAO;
import com.liz.persistence.TeacherDAO;

@Service
public class ClassServiceImpl implements ClassService{

	@Autowired
	private ClassDAO  cDao;
	
	@Autowired
	private TeacherDAO tDao;

	@Override
	@Transactional
	public void regist(TeacherVO tVo) {
		 cDao.insert(tVo.getcVo());
		tDao.insert(tVo);
	}

	@Override
	public List<ClassVO> selectList() {
		return  cDao.selectList();
	}

	@Override
	public ClassVO selectByNo(int cNo) {
		return  cDao.selectByNo(cNo);
	}

	@Override
	public ClassVO selectByCode(String cCode) {
		return  cDao.selectByCode(cCode);
	}
}
