package com.khrd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khrd.domain.ClassVO;
import com.khrd.persistence.ClassDAO;

@Service
public class ClassServiceImpl implements ClassService{

	@Autowired
	private ClassDAO dao;

	@Override
	public void regist(ClassVO vo) {
		dao.insert(vo);
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
