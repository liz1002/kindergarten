package com.liz.persistence;

import java.util.List;

import com.liz.domain.DirectorVO;

public interface DirectorDAO {
	public void insert(DirectorVO vo);
	public List<DirectorVO> selectListByNo(int mNo);
}
