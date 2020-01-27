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

import com.liz.domain.DirectorVO;
import com.liz.domain.MemberVO;
import com.liz.domain.PApproveVO;
import com.liz.domain.ParentVO;
import com.liz.domain.TApproveVO;
import com.liz.domain.TeacherVO;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.PApproveService;
import com.liz.service.ParentService;
import com.liz.service.TApproveService;
import com.liz.service.TeacherService;

@Controller
@RequestMapping("/director/*")
public class DirectorController {
	private static final Logger logger = LoggerFactory.getLogger(DirectorController.class);
	
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
	private TApproveService tApproveService;
	
	@Autowired
	private PApproveService pApproveService;
	
	
	/* * * * * method * * * * */
	
	/* 관리 화면 */
	@RequestMapping(value = "manage", method = RequestMethod.GET)
	public void manage(HttpSession session, Model model) {
		logger.info("▶ Director Manage GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
		
		model.addAttribute("mNo", mVo.getmNo()); //회원 번호		
		if(mVo.getmType() == 1) {
			model.addAttribute("dList", directorService.selectListByMNo(mVo.getmNo())); //해당 원장의 유치원 리스트
		}
	}	
	
	/* 별명 수정 */
	@RequestMapping(value = "modifyNick", method = RequestMethod.GET)
	public void modifyNickGet(HttpSession session, int dNo, Model model) {
		logger.info("▶ Director Modify Nick GET");
		
		int mType = (int) session.getAttribute("Type");

		if(mType == 1) {
			model.addAttribute("dVo", directorService.selectByDNo(dNo)); //원장 정보(회원, 유치원)
		}else {
			model.addAttribute("msg", "권한이 없습니다.");
		}
	}	
	
	@RequestMapping(value = "modifyNick", method = RequestMethod.POST)
	public String modifyNickPost(DirectorVO dVo) {
		logger.info("▶ Director Modify Nick POST");
		
		directorService.modifyNickname(dVo); //별명 수정
		
		return "redirect:/director/manage";
	}	
	
	/* 교사 가입 신청 목록 */
	@RequestMapping(value = "applyTList", method = RequestMethod.GET)
	public void applyTListGet(HttpSession session, int kNo, Model model) {
		logger.info("▶ Director Apply Teacher List GET");
		logger.info("[kNo] " + kNo);
		
		int mType = (int) session.getAttribute("Type");
		
		if(mType == 1) {
			logger.info("[taList] " + model.addAttribute("taList", tApproveService.selectListByKNo(kNo)));
			model.addAttribute("taList", tApproveService.selectListByKNo(kNo));
			model.addAttribute("kVo", kindergartenService.selectByNo(kNo));
		}
	}	
	
	//가입 승인
	@ResponseBody
	@RequestMapping(value = "admitT/{kNo}", method = RequestMethod.POST)
	public List<TApproveVO> admitT(@RequestBody TeacherVO[] tList, @PathVariable("kNo") int kNo) {
		logger.info("▶ Director Admit Teacher POST");
		logger.info("[kNo] " + kNo);
		
		for(TeacherVO tVo : tList) {
			logger.info("[생성한 tVo 확인] " + tVo);
			teacherService.regist(tVo); //교사 추가
			TApproveVO taVo = new TApproveVO(tVo.getmVo(), tVo.getcVo(), null, tVo.gettType());
			logger.info("[생성한 taVO 값 확인] " + taVo);
			tApproveService.removeByMNoAndCNoAndTType(taVo); //승인 목록에서 삭제
		}
		
		return tApproveService.selectListByKNo(kNo); //남은 신청 교사 목록
	}	
	
	//가입 거부
	@ResponseBody
	@RequestMapping(value = "refuseT/{kNo}", method = RequestMethod.POST)
	public List<TApproveVO> refuseT(@RequestBody TApproveVO[] taList, @PathVariable("kNo") int kNo) {
		logger.info("▶ Director Refuse Teacher POST");
		logger.info("[kNo] " + kNo);
		
		for(TApproveVO taVo : taList) {
			logger.info("[생성한 taVo 확인] " + taVo);
			tApproveService.removeByMNoAndCNoAndTType(taVo); //승인 목록에서 삭제
		}
		
		return tApproveService.selectListByKNo(kNo); //남은 신청 교사 목록
	}
	
	/* 학부모 가입 신청 목록 */
	@RequestMapping(value = "applyPList", method = RequestMethod.GET)
	public void applyPListGet(HttpSession session, int kNo, Model model) {
		logger.info("▶ Director Apply Parent List GET");
		logger.info("[kNo] " + kNo);
		
		int mType = (int) session.getAttribute("Type");
		
		if(mType == 1) {
			logger.info("[paList] " + model.addAttribute("paList", pApproveService.selectListByKNo(kNo)));
			model.addAttribute("paList", pApproveService.selectListByKNo(kNo));
			model.addAttribute("kVo", kindergartenService.selectByNo(kNo));
		}
	}	
	
	//가입 승인
	@ResponseBody
	@RequestMapping(value = "admitP/{kNo}", method = RequestMethod.POST)
	public List<PApproveVO> admitP(@RequestBody ParentVO[] pList, @PathVariable("kNo") int kNo) {
		logger.info("▶ Director Admit Parent POST");
		logger.info("[kNo] " + kNo);
		
		for(ParentVO pVo : pList) {
			logger.info("[생성한 pVo 확인] " + pVo);
			parentService.regist(pVo); //학부모 추가
			PApproveVO paVo = new PApproveVO(pVo.getmVo(), pVo.getChVo(), null);
			logger.info("[생성한 paVO 값 확인] " + paVo);
			pApproveService.removeByMNoAndChNo(paVo);; //승인 목록에서 삭제
		}
		
		return pApproveService.selectListByKNo(kNo); //남은 신청 학부모 목록
	}	
	
	//가입 거부
	@ResponseBody
	@RequestMapping(value = "refuseP/{kNo}", method = RequestMethod.POST)
	public List<PApproveVO> refuseP(@RequestBody PApproveVO[] pList, @PathVariable("kNo") int kNo) {
		logger.info("▶ Director Refuse Parent POST");
		logger.info("[kNo] " + kNo);
		
		for(PApproveVO paVo : pList) {
			logger.info("[생성한 paVo 확인] " + paVo);
			pApproveService.removeByMNoAndChNo(paVo);; //승인 목록에서 삭제
		}
		
		return pApproveService.selectListByKNo(kNo); //남은 신청 학부모 목록
	}	
	
	
	
}
