package com.liz.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khrd.domain.KindergartenVO;
import com.khrd.domain.MemberVO;
import com.khrd.service.ClassService;
import com.khrd.service.KindergartenService;
import com.khrd.service.MemberService;

@Controller
@RequestMapping("/info/*")
public class InformationController {
	private static final Logger logger = LoggerFactory.getLogger(InformationController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private KindergartenService kindergartenService;
	
	@Autowired
	private ClassService classService;
	
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public String registGet(HttpSession session) {
		logger.info("🏳‍🌈 regist GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO vo = memberService.selectById((String) mId);
		int mType = vo.getmType();
		
		switch (mType) {
		case 1: //원장
			
			break;
		case 2: //교사
			
			return "info/infoTeacher"; 
		default: //학부모
			return "info/infoParent";
		}
		
		return null; 
	}
	
	@ResponseBody
	@RequestMapping(value = "codeCheck", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public ResponseEntity<KindergartenVO> codeCheck(String kCode) {
		logger.info("🏳‍🌈  Code Check GET");
		logger.info("[kCode] " + kCode);
		
		ResponseEntity<KindergartenVO> entity = null;
		
		KindergartenVO vo = kindergartenService.selectByCode(kCode);
		logger.info("[vo] " + vo);
		
		if(vo != null) {
			entity = new ResponseEntity<KindergartenVO>(vo, HttpStatus.OK);
		}
		
		return entity;
	}
}
