package com.liz.service;

import java.util.List;

import com.liz.domain.ClassVO;
import com.liz.domain.TeacherVO;

public interface ClassService {
	public void regist(TeacherVO tVo);
	public ClassVO selectByNo(int cNo);
	public ClassVO selectByCode(String cCode);
	public List<ClassVO> selectListByKNo(int kNo);
	public void removeByCNo(int cNo);
}
