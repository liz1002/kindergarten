package com.liz.service;

import java.util.List;

import com.liz.domain.BoardVO;

public interface BoardService {
	public void regist(BoardVO bVo);
	public List<BoardVO> selectListByCNo(int cNo);
}
