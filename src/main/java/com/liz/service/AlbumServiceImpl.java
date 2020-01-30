package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.AlbumVO;
import com.liz.domain.Criteria;
import com.liz.persistence.AlbumDAO;

@Service
public class AlbumServiceImpl implements AlbumService{

	@Autowired
	private AlbumDAO aDao;

	@Override
	public void regist(AlbumVO aVo) {
		aDao.insert(aVo);
	}

	@Override
	public List<AlbumVO> selectListByCNo(int cNo, Criteria cri) {
		return aDao.selectListByCNo(cNo, cri);
	}

	@Override
	public int selectListCountByCNo(int cNo) {
		return aDao.selectListCountByCNo(cNo);
	}

	@Override
	public AlbumVO selectByANo(int aNo) {
		return aDao.selectByANo(aNo);
	}

	@Override
	public void remove(int aNo) {
		aDao.delete(aNo);
	}
}
