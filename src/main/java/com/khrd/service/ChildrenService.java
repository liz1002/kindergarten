package com.khrd.service;

import java.util.List;

import com.khrd.domain.ChildrenVO;

public interface ChildrenService {
	public void regist(ChildrenVO chVo);
	public List<ChildrenVO> selectListByKNo(int kNo);
	public List<ChildrenVO> selectListByCNo(int cNo);
}
