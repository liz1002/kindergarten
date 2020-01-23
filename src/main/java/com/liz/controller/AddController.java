package com.liz.controller;

import java.util.List;

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
import com.liz.domain.MemberVO;
import com.liz.domain.PApproveVO;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
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
	
	
	
	/* * * * * method * * * * */
	
	/*-------------------------------[원장]--------------------------------*/
	
	
	
	
	
	
	
	/*-------------------------------[교사]--------------------------------*/
	
	
	
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
	
	
	
	
	
	

	@RequestMapping(value = "applyClass", method = RequestMethod.GET)
	public void addClassGet(HttpSession session, Model model) {
		logger.info("▶  Add Class GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		if(mVo.getmType() == 2) {
			model.addAttribute("mNo", mVo.getmNo());
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

//	/* 교사 - 가족 추가 */ //ajax로 원아 번호 제외 부모 검색
//	@RequestMapping(value = "addFamily", method = RequestMethod.GET)
//	public void addFamilyGet(HttpSession session, int cNo, Model model) {
//		logger.info("▶  Add Family GET");
//		
//		Object mId = session.getAttribute("Auth");
//		MemberVO mVo = memberService.selectById((String) mId);
//		
//		if(mVo.getmType() == 2) {
//			model.addAttribute("cVo", classService.selectByNo(cNo)); //반 정보
//			model.addAttribute("chList", childrenService.selectListByCNo(cNo)); //반 원아 리스트
//		}
//	}	
//	
//	@ResponseBody
//	@RequestMapping(value = "getNotParent", method = RequestMethod.POST)
//	public List<PApproveVO> getNotParent(@RequestBody ChildrenVO chVo) {
//		logger.info("▶  Get Not Parent GET");
//		logger.info("[chVo] " + chVo);
//		
//		return familyService.selectParentNullListByChNo(chVo.getkVo().getkNo(), chVo.getChNo());
//	}	
//	
//	@ResponseBody
//	@RequestMapping(value = "getParent", method = RequestMethod.POST)
//	public List<PApproveVO> getParent(@RequestBody ChildrenVO chVo) {
//		logger.info("▶  Get Parent GET");
//		logger.info("[chVo] " + chVo);
//		
//		return familyService.selectListByChNo(chVo.getChNo());
//	}	
//	
//	@ResponseBody
//	@RequestMapping(value = "addFamily", method = RequestMethod.POST)
//	public void addFamilyPost(HttpSession session, @RequestBody PApproveVO fVo) {
//		logger.info("▶  Add Family POST");
//		logger.info("[fVo] " + fVo);
//		
//		int mType = (int) session.getAttribute("Type");
//		
//		if(mType == 2) {
//			familyService.regist(fVo.getpVo().getpNo(), fVo.getChVo().getChNo()); //가족 추가
//		}
//	}	
	
	
	
	
}
