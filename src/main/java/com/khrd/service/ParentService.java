package com.khrd.service;

import java.util.List;

import com.khrd.domain.ParentVO;

public interface ParentService {
	public void regist(ParentVO vo);
	public List<ParentVO> selectListByMNo(int mNo);
	public List<ParentVO> selectListByKNo(int kNo);
	public List<ParentVO> selectListByMNoAndKNO(int mNo, int kNo);
}
