package com.liz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liz.domain.ClassVO;
import com.liz.domain.MemberVO;
import com.liz.domain.ParentVO;
import com.liz.domain.TeacherVO;
import com.liz.service.BoardService;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.ParentService;
import com.liz.service.TeacherService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
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
	private BoardService boardService;

	
	/* * * * * method * * * * */
	
	/* 메인 화면 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void mainClassGet(HttpSession session, Model model) {
		logger.info("▶ Board Main GET");

		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
		logger.info("[mVo] " + mVo);

		if(mVo.getmType() == 2) {
			TeacherVO tVo = teacherService.selectBytMainAndMNo(mVo.getmNo());
			logger.info("[tVo] " + tVo);
			model.addAttribute("tVo", tVo); 
			model.addAttribute("bList", boardService.selectListByCNo(tVo.getcVo().getcNo()));
		}else if(mVo.getmType() == 3) {
			ParentVO pVo = parentService.selectBypMainAndMNo(mVo.getmNo());
			logger.info("[pVo] " + pVo);
			model.addAttribute("pVo", pVo);
			model.addAttribute("bList", boardService.selectListByCNo(pVo.getChVo().getcVo().getcNo()));
		}	
	}

	/* 원장 - 메인(유치원 리스트) 화면 */
	@RequestMapping(value = "mainDirector", method = RequestMethod.GET)
	public void mainDirectorGet(HttpSession session, Model model) {
		logger.info("▶ Main Director GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		model.addAttribute("mNo", mVo.getmNo());
		
		if(mVo.getmType() == 1) {
			model.addAttribute("dList", directorService.selectListByMNo(mVo.getmNo())); //해당 원장의 유치원 리스트
		}
	}
	
	/* 유치원 별 반 리스트 */
	@ResponseBody
	@RequestMapping(value = "getCList", method = RequestMethod.GET)
	public List<ClassVO> getCList(int kNo) {
		logger.info("▶ Get Class List GET");
		logger.info("[kNo] " + kNo);
		
		return classService.selectListByKNo(kNo); //해당 유치원의 반 리스트
	}
}
