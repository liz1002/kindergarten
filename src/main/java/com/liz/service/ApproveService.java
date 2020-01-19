package com.liz.service;

import java.util.List;

import com.liz.domain.ApproveVO;

public interface ApproveService {
	public void regist(ApproveVO aVo);
	public List<ApproveVO> selectListByCNo(int cNo);		
//	public List<FamilyVO> selectParentNullListByChNo(int kNo, int chNo);
//	public List<FamilyVO> selectListByChNo(int chNo);
//	public List<FamilyVO> selectChListByMNoAndKNo(int mNo, int kNo);
//	public void removeByChNo(int chNo);
	public void removeByMNoAndChNo(ApproveVO aVo);
}
