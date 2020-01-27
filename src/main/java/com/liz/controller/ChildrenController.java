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

import com.liz.domain.ChildrenVO;
import com.liz.domain.PApproveVO;
import com.liz.domain.ParentVO;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.PApproveService;
import com.liz.service.ParentService;
import com.liz.service.TeacherService;

@Controller
@RequestMapping("/children/*")
public class ChildrenController {
	private static final Logger logger = LoggerFactory.getLogger(ChildrenController.class);
	
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
	private PApproveService pApproveService;
	
	/* * * * * method * * * * */
	
	/* 원아 추가 */
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public void addChildrenGet(HttpSession session, int cNo, Model model) {
		logger.info("▶  Children Add GET");
		
		int mType = (int) session.getAttribute("Type");
		
		if(mType == 2) {
			model.addAttribute("cVo", classService.selectByNo(cNo)); //반 정보
			model.addAttribute("chList", childrenService.selectListByCNo(cNo)); //반 원아 리스트
		}
	}	

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addChildrenPost(ChildrenVO chVo, Model model) {
		logger.info("▶ Children Add POST");
		logger.info("[chVo] " + chVo);
		
		childrenService.regist(chVo);
		
		model.addAttribute("cNo", chVo.getcVo().getcNo());
		
		return "redirect:/class/manage";
	}
	
	/* 원장 - 원아 삭제 */
	@ResponseBody
	@RequestMapping(value = "removeD/{kNo}", method = RequestMethod.POST)
	public List<ChildrenVO> directorRemoveChildrenPost(@RequestBody int[] chNoList, @PathVariable("kNo") int kNo) {
		logger.info("▶ Children Remove POST");
		logger.info("[kNo] " + kNo);
		
		for(int chNo : chNoList) {
			logger.info("[chNo] " + chNo);
			
			//유아의 모든 학부모 검색 -> null이 아니면 삭제
			List<ParentVO> pList = parentService.selectListByChNo(chNo); //학부모 리스트
			logger.info("[pList] " + pList);
			
			if(pList.size() != 0){
				parentService.removeByChNo(chNo); //원아의 모든 학부모 삭제
			}	
			
			//유아의 모든 학부모 신청 목록 검색 -> null이 아니면 삭제
			List<PApproveVO> paList = pApproveService.selectListByChNo(chNo); //학부모 신청 리스트
			logger.info("[paList] " + paList);
			
			if(paList.size() != 0){
				pApproveService.removeByChNo(chNo); //원아의 모든 학부모 신청 삭제
			}	
			
			childrenService.removeByChNo(chNo); //원아 삭제
		}
		
		return childrenService.selectListByKNo(kNo); //원아 리스트
	}
	
	/* 교사 - 원아 삭제 */
	@ResponseBody
	@RequestMapping(value = "removeT/{cNo}", method = RequestMethod.POST)
	public List<ChildrenVO> teacherRemoveChildrenPost(@RequestBody int[] chNoList, @PathVariable("cNo") int cNo) {
		logger.info("▶ Children Remove POST");
		logger.info("[cNo] " + cNo);
		
		for(int chNo : chNoList) {
			logger.info("[chNo] " + chNo);
			
			//유아의 모든 학부모 검색 -> null이 아니면 삭제
			List<ParentVO> pList = parentService.selectListByChNo(chNo); //학부모 리스트
			logger.info("[pList] " + pList);
			
			if(pList.size() != 0){
				parentService.removeByChNo(chNo); //원아의 모든 학부모 삭제
			}	
			
			//유아의 모든 학부모 신청 목록 검색 -> null이 아니면 삭제
			List<PApproveVO> paList = pApproveService.selectListByChNo(chNo); //학부모 신청 리스트
			logger.info("[paList] " + paList);
			
			if(paList.size() != 0){
				pApproveService.removeByChNo(chNo); //원아의 모든 학부모 신청 삭제
			}	
			
			childrenService.removeByChNo(chNo); //원아 삭제
		}
		
		return childrenService.selectListByCNo(cNo); //원아 리스트
	}
}
