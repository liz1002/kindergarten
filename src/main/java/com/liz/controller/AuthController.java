package com.liz.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khrd.domain.MemberVO;
import com.khrd.service.MemberService;

@RequestMapping("/auth/*")
@Controller
public class AuthController {
	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
	
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void loginGet() {
		logger.info("🏳‍🌈 Login GET");
	}
	
	@RequestMapping(value = "loginPost", method = RequestMethod.POST)
	public void loginGet(MemberVO vo, Model model) {
		logger.info("🏳‍🌈 Login POST");
		
		MemberVO dbVo = service.selectByIdAndPwd(vo.getmId(), vo.getmPwd());
		if(dbVo == null) { //id & pw 불일치
			logger.info("🏳‍🌈 Login POST NOT!!");	
			return;
		}
		
		//일치
		model.addAttribute("login", dbVo.getmId());
		model.addAttribute("nick", dbVo.getmNickname());		
	}
	
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logoutGet(HttpSession session) {
		logger.info("🏳‍🌈 Logout GET");
		session.invalidate();
		
		return "redirect:/"; //홈 이동
	}
}
