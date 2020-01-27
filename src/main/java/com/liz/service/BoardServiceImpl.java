package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liz.domain.BoardVO;
import com.liz.domain.ClassVO;
import com.liz.persistence.BoardDAO;
import com.liz.persistence.ClassDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO bDao;

	@Override
	public void regist(BoardVO bVo) {
		bDao.insert(bVo);
	}

	@Override
	public List<BoardVO> selectListByCNo(int cNo) {
		return bDao.selectListByCNo(cNo);
	}

	
}
