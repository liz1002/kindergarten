package com.khrd.service;

import java.util.List;

import com.khrd.domain.ClassVO;
import com.khrd.domain.TeacherVO;

public interface ClassService {
//	public void regist(ClassVO cVo);
	public void regist(TeacherVO tVo);
	public List<ClassVO> selectList();
	public ClassVO selectByNo(int cNo);
	public ClassVO selectByCode(String cCode);
}
