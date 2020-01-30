package com.liz.service;

import java.util.List;

import com.liz.domain.BoardVO;
import com.liz.domain.Criteria;

public interface BoardService {
	public void regist(BoardVO bVo);
	public List<BoardVO> selectListByCNo(int cNo, Criteria cri);
	public BoardVO selectByBNo(int bNo);
	public int selectListCountByCNo(int cNo);
	public void modify(BoardVO bVo);
	public void remove(int bNo);	
}
