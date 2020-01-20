package com.liz.service;

import java.util.List;

import com.liz.domain.KindergartenVO;

public interface KindergartenService {
	public List<KindergartenVO> selectList();
	public KindergartenVO selectByNo(int kNo);
	public KindergartenVO selectByCode(String kCode);
	public void modify(KindergartenVO kVo);
	public void removeByKNo(int kNo);
}
