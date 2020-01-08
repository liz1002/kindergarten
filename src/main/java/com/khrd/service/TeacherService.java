package com.khrd.service;

import java.util.List;

import com.khrd.domain.TeacherVO;

public interface TeacherService {
	public void regist(TeacherVO vo);
	public List<TeacherVO> selectList();
	public List<TeacherVO> selectByMNo(int mNo);
	public List<TeacherVO> selectListByKNo(int kNo);
	public List<TeacherVO> selectListByCNo(int cNo);
	public List<TeacherVO> selectByMNoAndKNo(int mNo, int kNo);
	public void modify(TeacherVO vo, int tNo);
}
