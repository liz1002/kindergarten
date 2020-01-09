package com.liz.persistence;

import java.util.List;

import com.liz.domain.KindergartenVO;

public interface KindergartenDAO {
	public void insert(KindergartenVO vo);
	public List<KindergartenVO> selectList();
	public KindergartenVO selectByNo(int kNo);
	public KindergartenVO selectByCode(String kCode);
}
