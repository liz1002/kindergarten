package com.khrd.service;

import java.util.List;

import com.khrd.domain.TeacherVO;

public interface TeacherService {
	public void regist(TeacherVO vo);
	public List<TeacherVO> selectList();
}
