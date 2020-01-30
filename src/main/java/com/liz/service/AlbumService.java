package com.liz.service;

import java.util.List;

import com.liz.domain.AlbumVO;
import com.liz.domain.Criteria;

public interface AlbumService {
	public void regist(AlbumVO aVo);
	public List<AlbumVO> selectListByCNo(int cNo, Criteria cri);
	public int selectListCountByCNo(int cNo);
	public AlbumVO selectByANo(int aNo);
	public void remove(int aNo);
}
