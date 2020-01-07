package com.khrd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khrd.domain.DirectorVO;
import com.khrd.persistence.DirectorDAO;

@Service
public class DirectorServiceImpl implements DirectorService{
	
	@Autowired
	private DirectorDAO dao;

	@Override
	public DirectorVO selectByNo(int mNo) {
		return dao.selectByNo(mNo);
	}
	
}
