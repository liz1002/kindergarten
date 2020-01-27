package com.liz.persistence;

import java.util.List;

import com.liz.domain.PApproveVO;

public interface PApproveDAO {
	public void insert(PApproveVO paVo);	
	public List<PApproveVO> selectListByKNo(int kNo);
	public List<PApproveVO> selectListByCNo(int cNo);
	public List<PApproveVO> selectListByMNo(int mNo);
	public List<PApproveVO> selectListByChNo(int chNo);
	public void deleteByMNoAndChNo(PApproveVO paVo);
	public void deleteByChNo(int chNo);
}
