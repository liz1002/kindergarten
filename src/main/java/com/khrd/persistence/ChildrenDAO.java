package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.ChildrenVO;

public interface ChildrenDAO {
	public void insert(ChildrenVO chVo);
	public List<ChildrenVO> selectListByKNo(int kNo);
	public List<ChildrenVO> selectListByCNo(int cNo);
}
