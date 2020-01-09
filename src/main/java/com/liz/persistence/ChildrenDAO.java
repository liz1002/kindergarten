package com.liz.persistence;

import java.util.List;

import com.liz.domain.ChildrenVO;

public interface ChildrenDAO {
	public void insert(ChildrenVO chVo);
	public List<ChildrenVO> selectListByKNo(int kNo);
	public List<ChildrenVO> selectListByCNo(int cNo);
	public ChildrenVO selectByChNo(int chNo);
	public List<ChildrenVO> selectParentListByChNo(int chNo);
	public void deleteByChNo(int chNo);
}
