package com.liz.service;

import java.util.List;

import com.liz.domain.DirectorVO;

public interface DirectorService {
	public void registDirector(DirectorVO dVo);
	public List<DirectorVO> selectListByMNo(int mNo);
	public DirectorVO selectByDNo(int dNo);
	public void modifyNickname(DirectorVO vo);
	public void removeByKNo(int kNo);
}
