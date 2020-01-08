package com.khrd.persistence;

import java.util.List;

import com.khrd.domain.TeacherVO;

public interface TeacherDAO {
	public void insert(TeacherVO vo);
	public List<TeacherVO> selectList();
	public List<TeacherVO> selectByMNo(int mNo);
	public List<TeacherVO> selectListByKNo(int kNo);
	public List<TeacherVO> selectListByCNo(int cNo);
	public List<TeacherVO> selectByMNoAndKNo(int mNo, int kNo);
	public void update(TeacherVO vo, int tNo);
}
