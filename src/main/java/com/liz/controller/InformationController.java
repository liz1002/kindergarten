package com.liz.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liz.domain.MemberVO;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.ParentService;
import com.liz.service.TeacherService;

@RequestMapping("/info/*")
@Controller
public class InformationController {
private static final Logger logger = LoggerFactory.getLogger(InformationController.class);
	
	/* * * * * service * * * * */

	@Autowired
	private MemberService memberService;

	@Autowired
	private KindergartenService kindergartenService;
	
	@Autowired
	private ClassService classService; 
	
	@Autowired
	private TeacherService teacherService; 
	
	@Autowired
	private ParentService parentService;
	
	@Autowired
	private ChildrenService childrenService; 
	
	/* * * * * method * * * * */
	
	/* 타인 회원 정보 */
	@RequestMapping(value = "infoOther", method = RequestMethod.GET)
	public void infoOther(int mNo, int kNo, Model model) {
		logger.info("🏳‍🌈 Info Other GET");
		logger.info("[mNo] " + mNo);
		logger.info("[kNo] " + kNo);
		
		MemberVO mVo = memberService.selectByNo(mNo);
		model.addAttribute("mVo", mVo); //선택한 회원 정보 
		
		switch (mVo.getmType()) {
			case 2:
				model.addAttribute("tList", teacherService.selectByMNoAndKNo(mNo, kNo)); //선택한 교사 정보
				break;
			case 3:
				model.addAttribute("pList", parentService.selectListByMNoAndKNO(mNo, kNo)); //선택한 부모 정보 <-이건 필요 X
					//선택한 부모의 자녀 정보
				break;
		}
		
		//선택한 원아 정보 => controller & jsp 따로 만들기
	}
	
	/* 본인 회원 정보 */
	@RequestMapping(value = "myInfo", method = RequestMethod.GET)
	public void myInfo(String mId, Model model) {
		logger.info("🏳‍🌈 My Info GET");
		logger.info("[mId] " + mId);
		
		MemberVO mVo = memberService.selectById(mId); 
		model.addAttribute("mVo", mVo); //나의 회원 정보
		
		switch (mVo.getmType()) {
			case 1:
				model.addAttribute("dList", teacherService.selectByMNo(mVo.getmNo()));
			break;
			case 2:
				model.addAttribute("tList", teacherService.selectByMNo(mVo.getmNo()));
				break;
			case 3:
				model.addAttribute("pList", parentService.selectListByMNo(mVo.getmNo()));
				//선택한 부모의 자녀 정보
				break;
		}
	}
	
	/* 유치원 정보 */
	@RequestMapping(value = "infoKinder", method = RequestMethod.GET)
	public void infoKinder(int kNo, Model model) {
		logger.info("🏳‍🌈 Info Kindergarten GET");
		logger.info("[kNo] " + kNo);
		
		model.addAttribute("kVo", kindergartenService.selectByNo(kNo)); //유치원 정보
		model.addAttribute("cList", classService.selectListByKNo(kNo)); //해당 유치원 반 리스트
		model.addAttribute("tList", teacherService.selectListByKNo(kNo)); //해당 유치원번호의 교사 리스트
		model.addAttribute("pList", parentService.selectListByKNo(kNo)); //해당 유치원번호의 학부모 리스트
		model.addAttribute("chList", childrenService.selectListByKNo(kNo)); //해당 유치원번호의 원아 리스트
	}
	
	/* 반 정보 */
	@RequestMapping(value = "infoClass", method = RequestMethod.GET)
	public void infoClass(int cNo, Model model) {
		logger.info("🏳‍🌈 Info Class GET");
		logger.info("[cNo] " + cNo);
		
		model.addAttribute("cVo", classService.selectByNo(cNo)); //반 정보
		logger.info("[cVo] " + classService.selectByNo(cNo));
		model.addAttribute("tList", teacherService.selectListByCNo(cNo)); //해당 반의 교사 리스트
		model.addAttribute("chList", childrenService.selectListByCNo(cNo)); //해당 반의 원아 리스트
	}
	
	/* 원아 정보 */
	@RequestMapping(value = "infoChild", method = RequestMethod.GET)
	public void infoChild(int chNo, Model model) {
		logger.info("🏳‍🌈 Info Child GET");
		logger.info("[chNo] " + chNo);
		
		model.addAttribute("chVo", childrenService.selectByChNo(chNo)); //해당 원아의 정보
	}
}
