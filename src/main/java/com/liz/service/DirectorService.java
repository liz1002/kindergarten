package com.liz.service;

import java.util.List;

import com.liz.domain.DirectorVO;

public interface DirectorService {
	public List<DirectorVO> selectListByMNo(int mNo);
	public DirectorVO selectByDNo(int dNo);
	public DirectorVO selectBydMainAndMNo(int mNo);
	public void modifyNickname(DirectorVO dvo);
	public void modifyDMain(DirectorVO dVo);
	public void removeByKNo(int kNo);
}
