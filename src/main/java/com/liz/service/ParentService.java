package com.liz.service;

import java.util.List;

import com.liz.domain.PApproveVO;
import com.liz.domain.ParentVO;

public interface ParentService {
	public void regist(ParentVO pVo);
	public List<ParentVO> selectListByMNo(int mNo);
	public List<ParentVO> selectListByKNo(int kNo);
	public List<ParentVO> selectListByCNo(int cNo);
	public List<ParentVO> selectChildListByMNoAndKNo(int mNo, int kNo);
	public List<ParentVO> selectListByChNo(int chNo);
	public ParentVO selectByPNo(int pNo);
	public ParentVO selectByMNoAndChNo(PApproveVO paVo);
	public ParentVO selectBypMainAndMNo(int mNo);
	public void removeByMNoAndKNo(int mNo, int kNo);
	public void removeByPNo(int pNo);
	public void removeByMNo(int mNo);
	public void removeByChNo(int chNo);
	public void modifyNickname(ParentVO pVo);
	public void modifyPMain(ParentVO pVo);
}
