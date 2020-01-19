package com.liz.persistence;

import java.util.List;

import com.liz.domain.ApproveVO;

public interface ApproveDAO {
	public void insert(ApproveVO aVo);
	public List<ApproveVO> selectListByCNo(int cNo);	
//	public List<FamilyVO> selectParentNullListByChNo(int kNo, int chNo);
//	public List<FamilyVO> selectListByChNo(int chNo);
//	public List<FamilyVO> selectChListByMNoAndKNo(int mNo, int kNo);
//	public void deleteByChNo(int chNo);
	public void deleteByMNoAndChNo(ApproveVO aVo);
}
