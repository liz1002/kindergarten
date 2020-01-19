package com.liz.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("▶ Home GET");
		
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{pick}", method = RequestMethod.GET)
	public void menu(@PathVariable("pick") String pick, HttpSession session) {
		logger.info("▶ Menu GET");
		
		session.setAttribute("Pick", pick);
	}
}
