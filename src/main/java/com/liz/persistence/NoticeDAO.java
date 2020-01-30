package com.liz.persistence;

import java.util.List;

import com.liz.domain.Criteria;
import com.liz.domain.NoticeVO;

public interface NoticeDAO {
	public void insert(NoticeVO nVo);
	public List<NoticeVO> selectListByChNo(int chNo, Criteria cri);
	public NoticeVO selectByNNo(int nNo);
	public int selectListCountByChNo(int chNo);
	public void update(NoticeVO nVo);
	public void delete(int nNo);
	
}
