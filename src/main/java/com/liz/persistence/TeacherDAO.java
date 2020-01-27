package com.liz.persistence;

import java.util.List;

import com.liz.domain.TApproveVO;
import com.liz.domain.TeacherVO;

public interface TeacherDAO {
	public void insert(TeacherVO tVo);
	public List<TeacherVO> selectList();
	public List<TeacherVO> selectListByMNo(int mNo);
	public List<TeacherVO> selectListByKNo(int kNo);
	public List<TeacherVO> selectListByCNo(int cNo);
	public List<TeacherVO> selectListByMNoAndKNo(int mNo, int kNo);
	public TeacherVO selectByTNo(int tNo);
	public TeacherVO selectByMNoAndCNoAndTType(TApproveVO taVo);
	public TeacherVO selectBytMainAndMNo(int mNo);
	public void updateNickname(TeacherVO tVo);
	public void updateTMainByMNo(int mNo);
	public void updateTMainByTNo(int tNo);
	public void deleteByTNo(int tNo);
	public void deleteByMNoAndKNo(int mNo, int kNo);
}