package com.liz.service;

import java.util.List;

import com.liz.domain.TApproveVO;

public interface TApproveService {
	public void regist(TApproveVO taVo);
	public List<TApproveVO> selectListByKNo(int kNo);
	public void removeByMNoAndCNo(TApproveVO taVo);
}
