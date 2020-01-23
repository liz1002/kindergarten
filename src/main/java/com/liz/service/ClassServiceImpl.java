package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.ClassVO;
import com.liz.persistence.ClassDAO;

@Service
public class ClassServiceImpl implements ClassService{

	@Autowired
	private ClassDAO cDao;

	@Override
	@Transactional
	public void regist(ClassVO cVo) {
		cDao.insert(cVo);
	}

	@Override
	public ClassVO selectByNo(int cNo) {
		return cDao.selectByNo(cNo);
	}

	@Override
	public ClassVO selectByCode(String cCode) {
		return cDao.selectByCode(cCode);
	}

	@Override
	public List<ClassVO> selectListByKNo(int kNo) {
		return cDao.selectListByKNo(kNo);
	}

	@Override
	public void removeByCNo(int cNo) {
		cDao.deleteByCNo(cNo);
	}

	@Override
	public void modify(ClassVO cVo) {
		cDao.update(cVo);
	}

	@Override
	public void modifyUse(int cNo) {
		cDao.updateUse(cNo);
	}
}
