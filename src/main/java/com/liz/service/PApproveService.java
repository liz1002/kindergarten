package com.liz.service;

import java.util.List;

import com.liz.domain.PApproveVO;

public interface PApproveService {
	public void regist(PApproveVO aVo);
	public List<PApproveVO> selectListByKNo(int kNo);
	public List<PApproveVO> selectListByCNo(int cNo);
	public void removeByMNoAndChNo(PApproveVO aVo);
}
