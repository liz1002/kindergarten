package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.DirectorVO;

public interface DirectorDAO {
	public void insert(DirectorVO vo);
	public List<DirectorVO> selectListByNo(int mNo);
}
