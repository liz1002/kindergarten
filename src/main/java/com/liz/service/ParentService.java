package com.liz.service;

import java.util.List;

import com.liz.domain.ParentVO;

public interface ParentService {
	public void regist(int mNo, int kNo);
	public List<ParentVO> selectListByMNo(int mNo);
	public List<ParentVO> selectListByKNo(int kNo);
	public List<ParentVO> selectListByCNo(int cNo);
	public List<ParentVO> selectListByMNoAndKNO(int mNo, int kNo);
	public List<ParentVO> selectChildListByMNo(int mNo);
	public void removeByMNo(int mNo);
	public void removeByPNo(int pNo);
}
