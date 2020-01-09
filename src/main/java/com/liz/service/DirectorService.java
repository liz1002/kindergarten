package com.liz.service;

import java.util.List;

import com.liz.domain.DirectorVO;

public interface DirectorService {
	public void registDirector(DirectorVO dVo);
	public List<DirectorVO> selectListByNo(int mNo);
}
