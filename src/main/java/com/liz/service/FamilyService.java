package com.liz.service;

import java.util.List;

import com.liz.domain.FamilyVO;

public interface FamilyService {
	public void regist(int pNo, int chNo);
	public List<FamilyVO> selectParentNullListByChNo(int kNo, int chNo);
	public List<FamilyVO> selectListByChNo(int chNo);
	public List<FamilyVO> selectChListByMNoAndKNo(int mNo, int kNo);
	public void removeByChNo(int chNo);
	public void removeByPNoAndChNo(int pNo, int chNo);
}
