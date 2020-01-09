package com.liz.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liz.domain.DirectorVO;
import com.liz.domain.MemberVO;
import com.liz.service.DirectorService;
import com.liz.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/* * * * * service * * * * */
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private DirectorService directorService;
	
	/* * * * * method * * * * */
	
	/* 로그인 유형 선택 */
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
	
	/* 아이디 중복 확인 */
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
	
	/* 학부모&교사 가입 */
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String joinPost(MemberVO vo) {
		logger.info("🏳‍🌈 Join POST");
		
		logger.info("[vo] " + vo);
		
		memberService.regist(vo); //회원추가
		
		return "redirect:/member/joinOutro";
	}
	
	/* 원장 가입 */
	@RequestMapping(value = "joinD", method = RequestMethod.POST) 
	public String joinDirectorPost(DirectorVO dVo, Model model) {
		logger.info("🏳‍🌈 Join Director POST");
		
		logger.info("[dVo] " + dVo);

		//유치원 코드 생성
		Random rnd = new Random();		
		StringBuffer temp = new StringBuffer();
		
		for(int i = 0; i < 7; i++) { //(=7자리 문자열 생성)
		    int rndIdx = rnd.nextInt(2); //숫자 or 영어 선택할 랜덤 값(0, 1)
		    switch (rndIdx) {
			    case 0:
			    	// 0-9
			    	temp.append((rnd.nextInt(10)));
			        break;
			    case 1:
			        // A-Z
			    	temp.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
		    }
		}
		
		String code = temp.toString();
		logger.info("[Kcode] " + code);
		
		dVo.getkVo().setkCode(code);
		directorService.registDirector(dVo); //회원추가
		
		model.addAttribute("kCode", code);
		
		return "redirect:/member/joinOutro";
	}
	
	/* 탈퇴 처리 */
	@RequestMapping(value = "secession", method = RequestMethod.GET)
	public void secession(HttpSession session, int mNo) {
		logger.info("🏳‍🌈 secession GET");
		logger.info("[mNo] " + mNo);
		
		memberService.modifyUseByMNo(mNo);
		session.invalidate();
	}
	
	/* 로그인 후 화면 */
	@RequestMapping(value = "joinOutro", method = RequestMethod.GET)
	public void joinOutro() {
		logger.info("🏳‍🌈 Join Outro POST");
	}
}
