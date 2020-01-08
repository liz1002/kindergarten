package com.khrd.service;

import java.util.List;

import com.khrd.domain.DirectorVO;

public interface DirectorService {
	public void registDirector(DirectorVO dVo);
	public List<DirectorVO> selectListByNo(int mNo);
}
