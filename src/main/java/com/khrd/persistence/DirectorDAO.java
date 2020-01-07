package com.khrd.persistence;

import com.khrd.domain.DirectorVO;

public interface DirectorDAO {
	public void insert(DirectorVO vo);
	public DirectorVO selectByNo(int mNo);
}
