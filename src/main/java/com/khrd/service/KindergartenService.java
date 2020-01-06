package com.khrd.service;

import java.util.List;

import com.khrd.domain.KindergartenVO;

public interface KindergartenService {
	public void regist(KindergartenVO vo);
	public List<KindergartenVO> selectList();
	public KindergartenVO selectByNo(int kNo);
	public KindergartenVO selectByCode(String kCode);
}
