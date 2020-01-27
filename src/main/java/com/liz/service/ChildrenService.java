package com.liz.service;

import java.util.List;

import com.liz.domain.ChildrenVO;

public interface ChildrenService {
	public void regist(ChildrenVO chVo);
	public List<ChildrenVO> selectListByKNo(int kNo);
	public List<ChildrenVO> selectListByCNo(int cNo);
	public ChildrenVO selectByChNo(int chNo);
	public void removeByChNo(int chNo);
}
