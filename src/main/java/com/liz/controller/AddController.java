package com.liz.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liz.domain.ChildrenVO;
import com.liz.domain.DirectorVO;
import com.liz.domain.FamilyVO;
import com.liz.domain.MemberVO;
import com.liz.domain.TeacherVO;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.FamilyService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.ParentService;
import com.liz.service.TeacherService;

@Controller
@RequestMapping("/add/*")
public class AddController {
	private static final Logger logger = LoggerFactory.getLogger(AddController.class);
	
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

	@Autowired
	private FamilyService familyService;
	
	
	
	/* * * * * method * * * * */
	
	/*-------------------------------[원장]--------------------------------*/
	
	/* 원장 - 유치원 추가 */
	@RequestMapping(value = "addKinder", method = RequestMethod.GET)
	public void addKinderGet(HttpSession session, Model model) {
		logger.info("▶  Add Kinder GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		if(mVo.getmType() == 1) {
			model.addAttribute("mNo", mVo.getmNo());
		}
		
	}	
	
	@RequestMapping(value = "addKinder", method = RequestMethod.POST) 
	public String addKinderPost(DirectorVO dVo, Model model) {
		logger.info("▶ Add Kinder POST");
		
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
		directorService.registDirector(dVo); //유치원 & 원장 추가
		
		model.addAttribute("kCode", code);
		
		return "redirect:/manage/manageDirector";
	}
	
	
	/*-------------------------------[교사]--------------------------------*/
	
	/* 교사 - 반 추가 */
	@RequestMapping(value = "addClass", method = RequestMethod.GET)
	public void addClassGet(HttpSession session, Model model) {
		logger.info("▶  Add Class GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		if(mVo.getmType() == 2) {
			model.addAttribute("mNo", mVo.getmNo());
		}
	}	
	
	@RequestMapping(value = "addClass", method = RequestMethod.POST)
	public String addClassPost(TeacherVO tVo) {
		logger.info("▶ Add Class POST");
		
		logger.info("[tVo] " + tVo);
		
		//반 코드 생성
		Random rnd = new Random();		
		StringBuffer temp = new StringBuffer();
		
		for(int i = 0; i < 5; i++) { //(5자리 문자열 생성)
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
		tVo.getcVo().setcCode(code);
		
		tVo.getcVo().setkNo(tVo.getkVo().getkNo());
		
		if(tVo.getcVo().getcNo() == 0) { //담임
			classService.regist(tVo); //반 추가 , 교사 추가
		}else { //부담임
			teacherService.regist(tVo); //교사만 추가
		}
		
		return "redirect:/manage/manageTeacher";
	}

	/* 교사 - 원아 추가 */
	@RequestMapping(value = "addChildren", method = RequestMethod.GET)
	public void addChildrenGet(HttpSession session, int cNo, Model model) {
		logger.info("▶  Add Children GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		if(mVo.getmType() == 2) {
			model.addAttribute("cVo", classService.selectByNo(cNo)); //반 정보
			model.addAttribute("chList", childrenService.selectListByCNo(cNo)); //반 원아 리스트
			
		}
	}	

	@ResponseBody
	@RequestMapping(value = "addChildren", method = RequestMethod.POST)
	public List<ChildrenVO> addChildrenPost(@RequestBody ChildrenVO chVo) {
		logger.info("▶ Add Children POST");
		logger.info("[chVo] " + chVo);
		
		childrenService.regist(chVo);
		
		return childrenService.selectListByCNo(chVo.getcVo().getcNo());
	}

	/* 교사 - 가족 추가 */ //ajax로 원아 번호 제외 부모 검색
	@RequestMapping(value = "addFamily", method = RequestMethod.GET)
	public void addFamilyGet(HttpSession session, int cNo, Model model) {
		logger.info("▶  Add Family GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
		
		if(mVo.getmType() == 2) {
			model.addAttribute("cVo", classService.selectByNo(cNo)); //반 정보
			model.addAttribute("chList", childrenService.selectListByCNo(cNo)); //반 원아 리스트
		}
	}	
	
	@ResponseBody
	@RequestMapping(value = "getNotParent", method = RequestMethod.POST)
	public List<FamilyVO> getNotParent(@RequestBody ChildrenVO chVo) {
		logger.info("▶  Get Not Parent GET");
		logger.info("[chVo] " + chVo);
		
		return familyService.selectParentNullListByChNo(chVo.getkVo().getkNo(), chVo.getChNo());
	}	
	
	@ResponseBody
	@RequestMapping(value = "getParent", method = RequestMethod.POST)
	public List<FamilyVO> getParent(@RequestBody ChildrenVO chVo) {
		logger.info("▶  Get Parent GET");
		logger.info("[chVo] " + chVo);
		
		return familyService.selectListByChNo(chVo.getChNo());
	}	
	
	@ResponseBody
	@RequestMapping(value = "addFamily", method = RequestMethod.POST)
	public void addFamilyPost(HttpSession session, @RequestBody FamilyVO fVo) {
		logger.info("▶  Add Family POST");
		logger.info("[fVo] " + fVo);
		
		int mType = (int) session.getAttribute("Type");
		
		if(mType == 2) {
			familyService.regist(fVo.getpVo().getpNo(), fVo.getChVo().getChNo()); //가족 추가
		}
	}	
	
	
	
	/*-------------------------------[학부모]--------------------------------*/
	
	/* 학부모 - 유치원 추가 */
	@RequestMapping(value = "addParent", method = RequestMethod.GET)
	public void addParentGet(HttpSession session, Model model) {
		logger.info("▶  Add Parent GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		if(mVo.getmType() == 3) {
			model.addAttribute("mNo", mVo.getmNo());
		}
	}	
}
