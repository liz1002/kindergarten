package com.liz.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khrd.domain.KindergartenVO;
import com.khrd.domain.MemberVO;
import com.khrd.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "joinIntro", method = RequestMethod.GET)
	public void loginIntro() {
		logger.info("🏳‍🌈 Join Intro GET");
	}
	
	@RequestMapping(value = "joinParent", method = RequestMethod.GET)
	public void loginUser() {
		logger.info("🏳‍🌈 Join Parent GET");
	}
	
	@RequestMapping(value = "joinTeacher", method = RequestMethod.GET)
	public void loginTeacher() {
		logger.info("🏳‍🌈 Join Teacher GET");
	}
	
	@RequestMapping(value = "joinDirector", method = RequestMethod.GET)
	public void loginKinderGet() {
		logger.info("🏳‍🌈 Join Director GET");
	}
	
	@ResponseBody
	@RequestMapping(value = "overlap", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public String overlapCheck(String mId) {
		logger.info("🏳‍🌈 Overlap Check GET");
		
		String result = "true";
		
		MemberVO vo = memberService.selectById(mId);
				
		if(vo != null) { //아이디가 이미 존재
			result = "false";
		}
		
		return result;
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String joinPost(MemberVO vo, int tType) {
		logger.info("🏳‍🌈 Join POST");
		
		logger.info("[vo] " + vo);
		
		memberService.regist(vo, tType); //회원추가
		
		return "redirect:/member/joinOutro";
	}
	
	@RequestMapping(value = "joinD", method = RequestMethod.POST)
	public String joinDirectorPost(MemberVO mVo, KindergartenVO kVo) {
		logger.info("🏳‍🌈 Join Outro Director POST");
		
		logger.info("[mVo] " + mVo);
		logger.info("[kVo] " + kVo);

		kVo.setkCode("sfe");
		memberService.registDirector(mVo, kVo); //회원추가
	
		return "redirect:/member/joinOutro";
	}
	
	@RequestMapping(value = "joinOutro", method = RequestMethod.GET)
	public void joinOutro() {
		logger.info("🏳‍🌈 Join Outro POST");
	}
}
