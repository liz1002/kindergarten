package com.liz.persistence;

import java.util.List;

import com.liz.domain.FamilyVO;

public interface FamilyDAO {
	public void insert(int pNo, int chNo);
	public List<FamilyVO> selectParentNullListByChNo(int kNo, int chNo);
	public List<FamilyVO> selectListByChNo(int chNo);
	public void deleteByChNo(int chNo);
}
