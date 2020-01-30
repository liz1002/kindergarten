package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.Criteria;
import com.liz.domain.NoticeVO;
import com.liz.persistence.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO nDao;

	@Override
	public void regist(NoticeVO nVo) {
		nDao.insert(nVo);
	}

	@Override
	public List<NoticeVO> selectListByChNo(int chNo, Criteria cri) {
		return nDao.selectListByChNo(chNo, cri);
	}

	@Override
	public NoticeVO selectByNNo(int nNo) {
		return nDao.selectByNNo(nNo);
	}

	@Override
	public int selectListCountByChNo(int chNo) {
		return nDao.selectListCountByChNo(chNo);
	}

	@Override
	public void modify(NoticeVO nVo) {
		nDao.update(nVo);
	}

	@Override
	public void remove(int nNo) {
		nDao.delete(nNo);
	}
}
