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
import com.liz.domain.DirectorVO;
import com.liz.domain.KindergartenVO;
import com.liz.domain.MemberVO;
import com.liz.domain.TeacherVO;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
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
	
	
	
	/* * * * * method * * * * */
	
	/*-------------------------------[교사]--------------------------------*/
	
	
	
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
