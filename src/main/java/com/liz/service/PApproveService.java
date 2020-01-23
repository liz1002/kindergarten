package com.liz.service;

import java.util.List;

import com.liz.domain.PApproveVO;

public interface PApproveService {
	public void regist(PApproveVO paVo);
	public List<PApproveVO> selectListByKNo(int kNo);
	public List<PApproveVO> selectListByCNo(int cNo);
	public List<PApproveVO> selectListByMNo(int mNo);
	public void removeByMNoAndChNo(PApproveVO paVo);
}
