package com.liz.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khrd.domain.MemberVO;
import com.khrd.service.MemberService;

@RequestMapping("/info/*")
@Controller
public class InformationController {
private static final Logger logger = LoggerFactory.getLogger(InformationController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "infoParent", method = RequestMethod.GET)
	public void manageMain(int mNo, Model model) {
		logger.info("🏳‍🌈 Info Parent GET");
		
		MemberVO mVo = memberService.selectByNo(mNo);
		model.addAttribute("mVo", mVo);
	}
}
