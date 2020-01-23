package com.liz.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liz.domain.DirectorVO;
import com.liz.domain.KindergartenVO;
import com.liz.domain.MemberVO;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.ParentService;
import com.liz.service.TeacherService;

@Controller
@RequestMapping("/kinder/*")
public class KinderController {
	private static final Logger logger = LoggerFactory.getLogger(KinderController.class);
	
	/* * * * * service * * * * */
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private KindergartenService kindergartenService;
	
	@Autowired
	private ClassService classService;
	
	@Autowired
	private DirectorService directorService;
	
	@Autowired
	private TeacherService teacherService;
	
	@Autowired
	private ParentService parentService;
	
	@Autowired
	private ChildrenService childrenService;

	
	/* * * * * method * * * * */
	
	/* 유치원 관리 */
	@RequestMapping(value = "manage", method = RequestMethod.GET)
	public void manage(HttpSession session, int kNo, Model model) {
		logger.info("▶ Kinder Manage GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO vo = memberService.selectById((String) mId);

		model.addAttribute("mNo", vo.getmNo());
		
		if(vo.getmType() == 1) {
			model.addAttribute("kVo", kindergartenService.selectByNo(kNo)); //해당 유치원 정보
			model.addAttribute("cList", classService.selectListByKNo(kNo)); //해당 유치원 반 리스트
			model.addAttribute("tList", teacherService.selectListByKNo(kNo)); //해당 유치원번호의 교사 리스트
			model.addAttribute("pList", parentService.selectListByKNo(kNo)); //해당 유치원번호의 학부모 리스트
			model.addAttribute("chList", childrenService.selectListByKNo(kNo)); //해당 유치원번호의 원아 리스트
		}
	}

	/* 유치원 추가 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public void addGet(HttpSession session, int mNo, Model model) {
		logger.info("▶  Kinder Add GET");
		logger.info("[mNo] " + mNo);
		
		int mType = (int) session.getAttribute("Type");

		if(mType == 1) {
			model.addAttribute("mNo", mNo);
		}
	}	
	
	@RequestMapping(value = "add", method = RequestMethod.POST) 
	public String addPost(DirectorVO dVo, Model model) {
		logger.info("▶ Kinder Add POST");
		logger.info("[dVo] " + dVo);

		kindergartenService.regist(dVo); //유치원 & 원장 추가
			
		return "redirect:/director/manage";
	}
	
	/* 유치원 수정 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void modifyGet(HttpSession session, int kNo, Model model) {
		logger.info("▶ Kinder Modify GET");
		
		int mType = (int) session.getAttribute("Type");

		if(mType == 1) {
			model.addAttribute("kVo", kindergartenService.selectByNo(kNo));
		}else {
			model.addAttribute("msg", "권한이 없습니다.");
		}
	}	
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPost(KindergartenVO kVo, Model model) {
		logger.info("▶ Kinder Modify POST");

		kindergartenService.modify(kVo);
		
		return "redirect:/director/manage";
	}	
	
	/* 유치원 삭제 */
	@RequestMapping(value = "remove", method = RequestMethod.GET)
	public String removeKinder(int kNo, int mNo, Model model) {
		logger.info("▶ Remove Kinder GET");
		logger.info("[kNo] " + kNo);
		
		kindergartenService.modifyUse(kNo); //유치원 삭제
		
		model.addAttribute("dList", directorService.selectListByMNo(mNo));
		model.addAttribute("mNo", mNo);
		
		return "director/manage";
	}
	
}
