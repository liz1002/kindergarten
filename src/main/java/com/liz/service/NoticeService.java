package com.liz.service;

import java.util.List;

import com.liz.domain.Criteria;
import com.liz.domain.NoticeVO;

public interface NoticeService {
	public void regist(NoticeVO nVo);
	public List<NoticeVO> selectListByChNo(int chNo, Criteria cri);
	public NoticeVO selectByNNo(int nNo);
	public int selectListCountByChNo(int chNo);
	public void modify(NoticeVO nVo);
	public void remove(int nNo);
}
