package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.ClassVO;

public interface ClassDAO {
	public void insert(ClassVO vo);
	public List<ClassVO> selectList();
	public ClassVO selectByNo(int cNo);
	public ClassVO selectByCode(String cCode);
}
