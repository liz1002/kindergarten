package com.liz.service;

import java.util.List;

import com.liz.domain.FamilyVO;

public interface FamilyService {
	public void regist(int pNo, int chNo);
	public List<FamilyVO> selectParentNullListByChNo(int chNo);
	public void removeByChNo(int chNo);
}
