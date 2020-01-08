package com.liz.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.khrd.domain.ClassVO;
import com.khrd.domain.DirectorVO;
import com.khrd.domain.KindergartenVO;
import com.khrd.domain.MemberVO;
import com.khrd.domain.ParentVO;
import com.khrd.domain.TeacherVO;
import com.khrd.service.ChildrenService;
import com.khrd.service.ClassService;
import com.khrd.service.DirectorService;
import com.khrd.service.KindergartenService;
import com.khrd.service.MemberService;
import com.khrd.service.ParentService;
import com.khrd.service.TeacherService;

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
	
	/* 각자 관리할 리스트 */
	@RequestMapping(value = "manageMain", method = RequestMethod.GET)
	public void manageMain(HttpSession session, Model model) {
		logger.info("🏳‍🌈 Manage Main GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
				
		switch (mVo.getmType()) {
			case 1: //원장
				model.addAttribute("dList", directorService.selectListByNo(mVo.getmNo())); //해당 원장의 유치원 리스트
				break;
			case 2: //교사
				model.addAttribute("tList", teacherService.selectByMNo(mVo.getmNo())); //해당 교사의 유치원&반 리스트	
				break;
			default: //학부모
				model.addAttribute("fList", parentService.selectFamilyListByMNo(mVo.getmNo())); //해당 부모의 자녀 & 반 리스트
				break;
		}
	}
	
	/* 원장 - 유치원 추가, 교사 - 유치원 등록 & 반 추가, 학부모 - 유치원&반 등록 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public String registGet(HttpSession session, Model model) {
		logger.info("🏳‍🌈 regist GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		model.addAttribute("mNo", mVo.getmNo());
		
		switch (mVo.getmType()) {
			case 1:				
				return "manage/manageKinder";
			case 2: //교사	
				return "manage/manageTeacher"; 
			case 3: //학부모
				return "manage/manageParent";
			default:
				return null;
		}
	}
	
	/* 원장 - 유치원의 교사, 학부모 리스트 화면 (가족 추가) */
	@RequestMapping(value = "registD", method = RequestMethod.GET)
	public String registDGet(HttpSession session, int kNo, Model model) {
		logger.info("🏳‍🌈 regist Direcoter GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO vo = memberService.selectById((String) mId);

		model.addAttribute("mNo", vo.getmNo());
		
		if(vo.getmType() == 1) {
			model.addAttribute("kinder", kindergartenService.selectByNo(kNo)); //해당 유치원 정보
			model.addAttribute("tList", teacherService.selectListByKNo(kNo)); //해당 유치원번호의 교사 리스트
			model.addAttribute("pList", parentService.selectListByKNo(kNo)); //해당 유치원번호의 학부모 리스트
			model.addAttribute("chList", childrenService.selectListByKNo(kNo)); //해당 유치원번호의 원아 리스트
			
			return "manage/manageDirector";
		}
		
		return null;
	}
	
	/* 교사 - 원아 추가 화면 */
	@RequestMapping(value = "registCh", method = RequestMethod.GET)
	public String registChGet(HttpSession session, int cNo, Model model) {
		logger.info("🏳‍🌈 regist Childeren GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO vo = memberService.selectById((String) mId);

		model.addAttribute("mNo", vo.getmNo());
		
		if(vo.getmType() == 2) {
			model.addAttribute("cVo", classService.selectByNo(cNo)); //반 정보
			model.addAttribute("chList", childrenService.selectListByCNo(cNo)); //반의 원아 리스트						
		
			return "manage/manageChildren";
		}

		return null;
	}
	
	/* 유치원 코드 확인 */
	@ResponseBody
	@RequestMapping(value = "kCodeCheck", method = RequestMethod.GET)
	public Map<String, Object> kCodeCheck(String kCode) {
		logger.info("🏳‍🌈 K Code Check GET");
		logger.info("[kCode] " + kCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		KindergartenVO vo = kindergartenService.selectByCode(kCode.trim());
		logger.info("[vo] " + vo);
		
		if(vo != null) {
			map.put("msg", "ok");
			map.put("vo", vo);
		}else {
			map.put("msg", "no");
		}
		
		return map;
	}
	
	/* 반 코드 확인 */
	@ResponseBody
	@RequestMapping(value = "cCodeCheck", method = RequestMethod.GET)
	public Map<String, Object>cCodeCheck(String cCode) {
		logger.info("🏳‍🌈 C Code Check GET");
		logger.info("[cCode] " + cCode);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		ClassVO cVo = classService.selectByCode(cCode.trim());
		logger.info("[vo] " + cVo);
		
		if(cVo != null) {
			map.put("msg", "ok");
			map.put("vo", cVo);
		}else {
			map.put("msg", "no");
		}
		
		return map;
	}
	
	/* 교사 - 유치원 등록, 반 생성, 교사 생성 */
	@RequestMapping(value = "registT", method = RequestMethod.POST)
	public String registTPost(TeacherVO tVo) {
		logger.info("🏳‍🌈 regist Teacher POST");
		
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
		
		classService.regist(tVo); //반 추가 , 교사 추가
		
		return "redirect:/manage/manageMain";
	}
	
	/* 교사 - 유아 등록 */
	@RequestMapping(value = "registCh", method = RequestMethod.POST)
	public String registChPost(int cNo, TeacherVO tVo) {
		logger.info("🏳‍🌈 regist Teacher POST");
		logger.info("[cNo] " + cNo);
		logger.info("[tVo] " + tVo);
	
		return "";
	}
	/* 학부모 - 유치원 등록, 반 등록, 학부모 생성 */
	@RequestMapping(value = "registP", method = RequestMethod.POST)
	public String registPPost(ParentVO pVo) {
		logger.info("🏳‍🌈 regist Teacher POST");
		logger.info("[pVo] " + pVo);
		
		// 학부모 추가
		parentService.regist(pVo);
		
		return "redirect:/manage/manageMain";
	}

	/* 원장 - 유치원 추가 등록 */
	@RequestMapping(value = "registK", method = RequestMethod.POST) 
	public String registKPost(DirectorVO dVo, Model model) {
		logger.info("🏳‍🌈 Regist Kinder POST");
		
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
		
		return "redirect:/manage/manageMain";
	}
}
