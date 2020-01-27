package com.liz.persistence;

import java.util.List;

import com.liz.domain.PApproveVO;
import com.liz.domain.ParentVO;

public interface ParentDAO {
	public void insert(ParentVO pVo);
	public List<ParentVO> selectListByMNo(int mNo);
	public List<ParentVO> selectListByKNo(int kNo);
	public List<ParentVO> selectListByCNo(int cNo);
	public List<ParentVO> selectListByMNoAndKNO(int mNo, int kNo);
	public List<ParentVO> selectChildListByMNoAndKNo(int mNo, int kNo);
	public List<ParentVO> selectListByChNo(int chNo);
	public ParentVO selectByPNo(int pNo);
	public ParentVO selectByMNoAndChNo(PApproveVO paVo);
	public ParentVO selectBypMainAndMNo(int mNo);
	public void deleteByMNoAndKNo(int mNo, int kNo);
	public void deleteByPNo(int pNo);
	public void deleteByMNo(int mNo);
	public void deleteByChNo(int chNo);
	public void updateNickname(ParentVO pVo);
	public void updatePMainByMNo(int mNo);
	public void updatePMainByPNo(int pNo);
}
