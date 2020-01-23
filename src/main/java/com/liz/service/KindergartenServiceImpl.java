package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.DirectorVO;
import com.liz.domain.KindergartenVO;
import com.liz.persistence.ChildrenDAO;
import com.liz.persistence.ClassDAO;
import com.liz.persistence.DirectorDAO;
import com.liz.persistence.KindergartenDAO;
import com.liz.persistence.ParentDAO;
import com.liz.persistence.TeacherDAO;

@Service
public class KindergartenServiceImpl implements KindergartenService{
	
	@Autowired
	private KindergartenDAO kDao;	
	
	@Autowired
	private DirectorDAO dDao;
	
	@Autowired
	private TeacherDAO tDao;
	
	@Autowired
	private ChildrenDAO chDao;
	
	@Autowired
	private ParentDAO pDao;

	@Autowired
	private ClassDAO cDao;
	
	@Override
	@Transactional
	public void regist(DirectorVO dVo) {
		kDao.insert(dVo.getkVo()); //유치원추가
		dDao.insert(dVo); //원장추가
	}

	@Override
	public KindergartenVO selectByNo(int kNo) {
		return kDao.selectByNo(kNo);
	}

	@Override
	public KindergartenVO selectByCode(String kCode) {
		return kDao.selectByCode(kCode);
	}

	@Override
	public List<KindergartenVO> selectListByKName(String kName) {
		return kDao.selectListByKName(kName);
	}

	@Override
	public void modify(KindergartenVO kVo) {
		kDao.update(kVo);
	}

	@Override
	@Transactional
	public void modifyUse(int kNo) {
		kDao.updateUse(kNo); //유치원 논리 삭제
	}
}