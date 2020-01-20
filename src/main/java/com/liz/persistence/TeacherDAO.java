package com.liz.persistence;

import java.util.List;

import com.liz.domain.TeacherVO;

public interface TeacherDAO {
	public void insert(TeacherVO tVo);
	public List<TeacherVO> selectList();
	public List<TeacherVO> selectListByMNo(int mNo);
	public List<TeacherVO> selectListByKNo(int kNo);
	public List<TeacherVO> selectListByCNo(int cNo);
	public List<TeacherVO> selectListByMNoAndKNo(int mNo, int kNo);
	public TeacherVO selectByMNoAndCNoAndTType(TeacherVO tVo);
	public TeacherVO selectByMNoAndCCodeAndTType(TeacherVO tVo);
	public void update(TeacherVO tVo);
}