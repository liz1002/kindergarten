package com.liz.persistence;

import java.util.List;

import com.liz.domain.TApproveVO;

public interface TApproveDAO {
	public void insert(TApproveVO taVo);	
	public List<TApproveVO> selectListByKNo(int kNo);
	public List<TApproveVO> selectListByMNo(int mNo);
	public void deleteByMNoAndCNoAndTType(TApproveVO taVo);
}
