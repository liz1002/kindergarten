package com.liz.persistence;

import java.util.List;

import com.liz.domain.KindergartenVO;

public interface KindergartenDAO {
	public void insert(KindergartenVO kVo);
	public KindergartenVO selectByNo(int kNo);
	public KindergartenVO selectByCode(String kCode);
	public List<KindergartenVO> selectListByKName(String kName);
	public void update(KindergartenVO kVo);
	public void updateUse(int kNo);
}
