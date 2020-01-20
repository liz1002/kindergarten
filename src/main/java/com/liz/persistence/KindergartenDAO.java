package com.liz.persistence;

import java.util.List;

import com.liz.domain.KindergartenVO;

public interface KindergartenDAO {
	public void insert(KindergartenVO kVo);
	public List<KindergartenVO> selectList();
	public KindergartenVO selectByNo(int kNo);
	public KindergartenVO selectByCode(String kCode);
	public void update(KindergartenVO kVo);
	public void deleteByKNo(int kNo);
}
