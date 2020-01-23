package com.liz.service;

import java.util.List;

import com.liz.domain.DirectorVO;
import com.liz.domain.KindergartenVO;

public interface KindergartenService {
	public void regist(DirectorVO dVo);
	public KindergartenVO selectByNo(int kNo);
	public KindergartenVO selectByCode(String kCode);
	public List<KindergartenVO> selectListByKName(String kName);
	public void modify(KindergartenVO kVo);
	public void modifyUse(int kNo);
}
