package com.liz.persistence;

import java.util.List;

import com.liz.domain.DirectorVO;

public interface DirectorDAO {
	public void insert(DirectorVO vo);
	public List<DirectorVO> selectListByMNo(int mNo);
	public DirectorVO selectByDNo(int dNo);
	public void updateNickname(DirectorVO vo);
	public void deleteByKNo(int kNo);
}
