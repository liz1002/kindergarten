package com.liz.service;

import java.util.List;

import com.liz.domain.PApproveVO;
import com.liz.domain.ParentVO;

public interface ParentService {
	public void regist(ParentVO pVo);
	public List<ParentVO> selectListByMNo(int mNo);
	public List<ParentVO> selectListByKNo(int kNo);
	public List<ParentVO> selectListByCNo(int cNo);
	public List<ParentVO> selectListByMNoAndKNO(int mNo, int kNo);
	public List<ParentVO> selectChildListByMNo(int mNo);
	public ParentVO selectByPNo(int pNo);
	public ParentVO selectByMNoAndChNo(PApproveVO paVo);
	public void removeByMNo(int mNo);
	public void removeByPNo(int pNo);
	public void modifyNickname(ParentVO pVo);
}
