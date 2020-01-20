package com.liz.service;

import java.util.List;

import com.liz.domain.TeacherVO;

public interface TeacherService {
	public void regist(TeacherVO vo);
	public List<TeacherVO> selectList();
	public List<TeacherVO> selectListByMNo(int mNo);
	public List<TeacherVO> selectListByKNo(int kNo);
	public List<TeacherVO> selectListByCNo(int cNo);
	public List<TeacherVO> selectListByMNoAndKNo(int mNo, int kNo);
	public TeacherVO selectByMNoAndCNoAndTType(TeacherVO tVo);
	public TeacherVO selectByMNoAndCCodeAndTType(TeacherVO tVo);
	public void modify(TeacherVO tVo);
}
