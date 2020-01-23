package com.liz.service;

import java.util.List;

import com.liz.domain.ClassVO;

public interface ClassService {
	public void regist(ClassVO cVo);
	public ClassVO selectByNo(int cNo);
	public ClassVO selectByCode(String cCode);
	public List<ClassVO> selectListByKNo(int kNo);
	public void removeByCNo(int cNo);
	public void modify(ClassVO cVo);
	public void modifyUse(int cNo);
}
