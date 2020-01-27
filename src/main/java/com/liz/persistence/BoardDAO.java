package com.liz.persistence;

import java.util.List;

import com.liz.domain.BoardVO;

public interface BoardDAO {
	public void insert(BoardVO bVo);
	public List<BoardVO> selectListByCNo(int cNo);
	
}
