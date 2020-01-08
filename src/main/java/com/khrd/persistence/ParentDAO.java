package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.ParentVO;

public interface ParentDAO {
	public void insert(ParentVO vo);
	public List<ParentVO> selectListByMNo(int mNo);
	public List<ParentVO> selectListByKNo(int kNo);
	public List<ParentVO> selectListByMNoAndKNO(int mNo, int kNo);
	public List<ParentVO> selectFamilyListByMNo(int mNo);
}
