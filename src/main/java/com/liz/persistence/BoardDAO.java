package com.liz.persistence;

import java.util.List;

import com.liz.domain.BoardVO;
import com.liz.domain.Criteria;

public interface BoardDAO {
	public void insert(BoardVO bVo);
	public List<BoardVO> selectListByCNo(int cNo, Criteria cri);
	public BoardVO selectByBNo(int bNo);
	public int selectListCountByCNo(int cNo);
	public void update(BoardVO bVo);
	public void delete(int bNo);	
}
