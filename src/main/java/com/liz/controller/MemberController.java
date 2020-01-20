package com.liz.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liz.domain.MemberVO;
import com.liz.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/* * * * * service * * * * */
	
	@Autowired
	private MemberService memberService;
	
	/* * * * * method * * * * */
	
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
	
	/* 회원 가입 */
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String joinGet() {
		logger.info("🏳‍🌈 Join GET");
		
		return "member/joinForm";
	}
	
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String joinPost(MemberVO vo) {
		logger.info("🏳‍🌈 Join POST");
		
		logger.info("[vo] " + vo);
		
		memberService.regist(vo); //회원추가
		
		return "redirect:/member/joinOutro";
	}
	
	/* 가입 후 화면 */
	@RequestMapping(value = "joinOutro", method = RequestMethod.GET)
	public void joinOutro() {
		logger.info("🏳‍🌈 Join Outro POST");
	}
	
	
	/* 회원 정보 수정 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyGet(int mNo, Model model) {
		logger.info("🏳‍🌈 Modify GET");
		logger.info("[mNo] " + mNo);
		
		model.addAttribute("mVo", memberService.selectByNo(mNo)); //회원 정보
		
		return "member/modifyInfo";
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPost(MemberVO vo, Model model) {
		logger.info("🏳‍🌈 Modify POST");
		
		logger.info("[vo] " + vo);
		
		memberService.modifyInfo(vo);
		
		model.addAttribute("mId", vo.getmId());
		
		return "redirect:/info/myInfo";
	}	
	
	/* 탈퇴 처리 */
	@RequestMapping(value = "secession", method = RequestMethod.GET)
	public void secession(HttpSession session, int mNo) {
		logger.info("🏳‍🌈 secession GET");
		logger.info("[mNo] " + mNo);
		
		memberService.modifyUseByMNo(mNo);
		session.invalidate();
	}
}
