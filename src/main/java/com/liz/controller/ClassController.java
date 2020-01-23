package com.liz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liz.domain.ClassVO;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.ParentService;
import com.liz.service.TeacherService;

@Controller
@RequestMapping("/class/*")
public class ClassController {
	private static final Logger logger = LoggerFactory.getLogger(ClassController.class);
	
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
	
	/* 반 추가 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public void addGet(HttpSession session, int kNo, Model model) {
		logger.info("▶ Class Add GET");
		
		int mType = (int) session.getAttribute("Type");

		if(mType == 1) {
			model.addAttribute("kVo", kindergartenService.selectByNo(kNo));
		}
	}	
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addPost(HttpSession session, ClassVO cVo, Model model) {
		logger.info("▶ Class Add POST");
		
		classService.regist(cVo); //반 추가
		
		model.addAttribute("kNo", cVo.getkVo().getkNo());
		
		return "redirect:/kinder/manage";
	}
	
	/* 반 삭제 */	
	@ResponseBody
	@RequestMapping(value = "remove/{kNo}", method = RequestMethod.POST)
	public List<ClassVO> removePost(@RequestBody int[] cNoList, @PathVariable("kNo") int kNo) {
		logger.info("▶ Class Remove POST");
		
		for(int cNo : cNoList) {
			logger.info("[cNo 확인] " + cNo);
			classService.modifyUse(cNo); //반 삭제
		}
		
		return classService.selectListByKNo(kNo); //반 리스트
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* 교사 - 반 수정 */
//	@RequestMapping(value = "modifyClass", method = RequestMethod.GET)
//	public void addClassGet(HttpSession session, int cNo, int tType, Model model) {
//		logger.info("▶  Modify Class GET");
//		
//		Object mId = session.getAttribute("Auth");
//		MemberVO mVo = memberService.selectById((String) mId);
//		
//		TeacherVO tVo = new TeacherVO();
//		tVo.setcVo(new ClassVO(cNo, null, null, 0));
//		tVo.setmVo(mVo);
//		tVo.settType(tType);
//
//		if(mVo.getmType() == 2) {
//			ClassVO cVo = classService.selectByNo(cNo);
//			logger.info("[cVo] " + cVo);
//			model.addAttribute("cVo", cVo);
//			model.addAttribute("kVo", kindergartenService.selectByNo(cVo.getkNo()));
//			model.addAttribute("tVo", teacherService.selectByMNoAndCNoAndTType(tVo));
//		}else {
//			model.addAttribute("msg", "권한이 없습니다.");
//		}
//	}	
//	
//	@RequestMapping(value = "modifyClass", method = RequestMethod.POST)
//	public String addClassPost(TeacherVO tVo, Model model) {
//		logger.info("▶  Modify Class POST");
//		logger.info("[tVo] " + tVo);
//		
//		teacherService.modify(tVo); //교사 타입, 반 번호 수정
//		if(tVo.gettType() == 1) { //담임
//			classService.modify(tVo.getcVo()); //반 이름 수정
//		}
//		
//		model.addAttribute("cNo", tVo.getcVo().getcNo());
//		model.addAttribute("tType", tVo.gettType());
//		
//		return "redirect:/manage/manageClass";
//	}	
}
