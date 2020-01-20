package com.liz.persistence;

import java.util.List;

import com.liz.domain.TApproveVO;

public interface TApproveDAO {
	public void insert(TApproveVO taVo);	
	public List<TApproveVO> selectListByKNo(int kNo);
	public void deleteByMNoAndCNo(TApproveVO taVo);
}
