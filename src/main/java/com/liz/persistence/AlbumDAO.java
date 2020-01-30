package com.liz.persistence;

import java.util.List;

import com.liz.domain.AlbumVO;
import com.liz.domain.Criteria;

public interface AlbumDAO {
	public void insert(AlbumVO aVo);
	public List<AlbumVO> selectListByCNo(int cNo, Criteria cri);
	public int selectListCountByCNo(int cNo);
	public AlbumVO selectByANo(int aNo);
	public void delete(int aNo);	
}
