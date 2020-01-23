package com.liz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.liz.domain.PApproveVO;
import com.liz.domain.ChildrenVO;
import com.liz.domain.ClassVO;
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
@RequestMapping("/manage/*")
public class ManageController {
	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);
	
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
	
	
	
	
	/* 원아 삭제 */
	@ResponseBody
	@RequestMapping(value = "removeChildren/{cNo}", method = RequestMethod.POST)
	public List<ChildrenVO> removeChildrenPost(@RequestBody int[] chNoList, @PathVariable("cNo") int cNo) {
		logger.info("▶ Remove Children POST");
		logger.info("[cNo] " + cNo);
		
		for(int chNo : chNoList) {
			logger.info("[chNo] " + chNo);
			
			//유아 번호로 family 검색 null이 아니면 가족 삭제
			List<PApproveVO> fList = familyService.selectListByChNo(chNo);
			logger.info("[fList] " + fList);
			
			if(fList.size() != 0){
				familyService.removeByChNo(chNo); //원아의 모든 가족 삭제
			}			
			childrenService.removeByChNo(chNo);
		}
		
		return childrenService.selectListByCNo(cNo); //원아 리스트
	}
	
	/* 가족 삭제 */
	@ResponseBody
	@RequestMapping(value = "removeFamily/{chNo}", method = RequestMethod.POST)
	public void removeFamilyPost(@RequestBody int[] pNoList, @PathVariable("chNo") int chNo) {
		logger.info("▶ Remove Children POST");
		logger.info("[chNo] " + chNo);
		
		for(int pNo : pNoList) {
			logger.info("[pNo] " + pNo);
	
			familyService.removeByPNoAndChNo(pNo, chNo); //학부모 번호 & 원아 번호로 가족 삭제
		}
	}
}
