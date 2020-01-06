package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.TeacherVO;

public interface TeacherDAO {
	public void insert(TeacherVO vo);
	public List<TeacherVO> selectList();
}
