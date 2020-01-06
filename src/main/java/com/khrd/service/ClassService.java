package com.khrd.service;

import java.util.List;

import com.khrd.domain.ClassVO;

public interface ClassService {
	public void regist(ClassVO vo);
	public List<ClassVO> selectList();
	public ClassVO selectByNo(int cNo);
	public ClassVO selectByCode(String cCode);
}
