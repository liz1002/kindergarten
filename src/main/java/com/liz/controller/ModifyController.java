package com.liz.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liz.domain.ClassVO;
import com.liz.domain.KindergartenVO;
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
@RequestMapping("/modify/*")
public class ModifyController {
	private static final Logger logger = LoggerFactory.getLogger(ModifyController.class);
	
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
	
	/* 원장 - 유치원 수정 */
	@RequestMapping(value = "modifyKinder", method = RequestMethod.GET)
	public void addKinderGet(HttpSession session, int kNo, Model model) {
		logger.info("▶  Modify Kinder GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		if(mVo.getmType() == 1) {
			model.addAttribute("kVo", kindergartenService.selectByNo(kNo));
		}else {
			model.addAttribute("msg", "권한이 없습니다.");
		}
	}	
	
	@RequestMapping(value = "modifyKinder", method = RequestMethod.POST)
	public String addKinderPost(KindergartenVO kVo, Model model) {
		logger.info("▶  Modify Kinder POST");

		kindergartenService.modify(kVo);
		
		model.addAttribute("kNo", kVo.getkNo());
		
		return "redirect:/manage/manageKinder";
	}	
	
	
	/*-------------------------------[교사]--------------------------------*/
	
	/* 교사 - 반 수정 */
	@RequestMapping(value = "modifyClass", method = RequestMethod.GET)
	public void addClassGet(HttpSession session, int cNo, int tType, Model model) {
		logger.info("▶  Modify Class GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
		
		TeacherVO tVo = new TeacherVO();
		tVo.setcVo(new ClassVO(cNo, null, null, 0));
		tVo.setmVo(mVo);
		tVo.settType(tType);

		if(mVo.getmType() == 2) {
			ClassVO cVo = classService.selectByNo(cNo);
			logger.info("[cVo] " + cVo);
			model.addAttribute("cVo", cVo);
			model.addAttribute("kVo", kindergartenService.selectByNo(cVo.getkNo()));
			model.addAttribute("tVo", teacherService.selectByMNoAndCNoAndTType(tVo));
		}else {
			model.addAttribute("msg", "권한이 없습니다.");
		}
	}	
	
	@RequestMapping(value = "modifyClass", method = RequestMethod.POST)
	public String addClassPost(TeacherVO tVo, Model model) {
		logger.info("▶  Modify Class POST");
		logger.info("[tVo] " + tVo);
		
		teacherService.modify(tVo); //교사 타입, 반 번호 수정
		if(tVo.gettType() == 1) { //담임
			classService.modify(tVo.getcVo()); //반 이름 수정
		}
		
		model.addAttribute("cNo", tVo.getcVo().getcNo());
		model.addAttribute("tType", tVo.gettType());
		
		return "redirect:/manage/manageClass";
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
