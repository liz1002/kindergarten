package com.liz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liz.domain.BoardVO;
import com.liz.domain.Criteria;
import com.liz.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO bDao;

	@Override
	public void regist(BoardVO bVo) {
		bDao.insert(bVo);
	}

	@Override
	public List<BoardVO> selectListByCNo(int cNo, Criteria cri) {
		return bDao.selectListByCNo(cNo, cri);
	}

	@Override
	public BoardVO selectByBNo(int bNo) {
		return bDao.selectByBNo(bNo);
	}

	@Override
	public int selectListCountByCNo(int cNo) {
		return bDao.selectListCountByCNo(cNo);
	}

	@Override
	public void modify(BoardVO bVo) {
		bDao.update(bVo);
	}

	@Override
	public void remove(int bNo) {
		bDao.delete(bNo);
	}

	
}
