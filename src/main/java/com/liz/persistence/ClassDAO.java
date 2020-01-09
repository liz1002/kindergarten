package com.liz.persistence;

import java.util.List;

import com.liz.domain.ClassVO;

public interface ClassDAO {
	public void insert(ClassVO vo);
	public ClassVO selectByNo(int cNo);
	public ClassVO selectByCode(String cCode);
	public List<ClassVO> selectListByKNo(int kNo);
	public void deleteByCNo(int cNo);
}
