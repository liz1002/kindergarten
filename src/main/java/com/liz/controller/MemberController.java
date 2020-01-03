package com.liz.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "joinIntro", method = RequestMethod.GET)
	public void loginIntroGet() {
		logger.info("🏳‍🌈 Join Intro GET");
	}
	
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void loginGet() {
		logger.info("🏳‍🌈 Join GET");
	}
	
}
