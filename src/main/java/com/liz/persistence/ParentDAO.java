package com.liz.persistence;

import java.util.List;

import com.liz.domain.ParentVO;

public interface ParentDAO {
	public void insert(int mNo, int kNo);
	public List<ParentVO> selectListByMNo(int mNo);
	public List<ParentVO> selectListByKNo(int kNo);
	public List<ParentVO> selectListByCNo(int cNo);
	public List<ParentVO> selectListByMNoAndKNO(int mNo, int kNo);
	public List<ParentVO> selectChildListByMNo(int mNo);
	public void deleteByPNo(int pNo);
	public void deleteByMNo(int mNo);
}
