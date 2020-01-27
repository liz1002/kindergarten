package com.liz.service;

import java.util.List;

import com.liz.domain.TApproveVO;
import com.liz.domain.TeacherVO;

public interface TeacherService {
	public void regist(TeacherVO vo);
	public List<TeacherVO> selectList();
	public List<TeacherVO> selectListByMNo(int mNo);
	public List<TeacherVO> selectListByKNo(int kNo);
	public List<TeacherVO> selectListByCNo(int cNo);
	public List<TeacherVO> selectListByMNoAndKNo(int mNo, int kNo);
	public TeacherVO selectByTNo(int tNo);
	public TeacherVO selectByMNoAndCNoAndTType(TApproveVO taVo);
	public TeacherVO selectBytMainAndMNo(int mNo);
	public void modifyNickname(TeacherVO tVo);
	public void modifyTMain(TeacherVO tVo);
	public void removeByTNo (int tNo);
	public void removeByMNoAndKNo (int mNo, int kNo);
}
