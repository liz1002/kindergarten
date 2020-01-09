package com.liz.service;

import java.util.List;

import com.liz.domain.ClassVO;
import com.liz.domain.TeacherVO;

public interface ClassService {
//	public void regist(ClassVO cVo);
	public void regist(TeacherVO tVo);
	public List<ClassVO> selectList();
	public ClassVO selectByNo(int cNo);
	public ClassVO selectByCode(String cCode);
}
