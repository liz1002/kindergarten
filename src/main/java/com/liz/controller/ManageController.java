package com.liz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	
	@RequestMapping(value = "manageMain", method = RequestMethod.GET)
	public void manageMain(HttpSession session, Model model) {
		logger.info("🏳‍🌈 Manage Main GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
		//model.addAttribute("mNo", vo.getmNo());
		List<TeacherVO> teacherList;
		List<ParentVO> parentList; 
				
		switch (mVo.getmType()) {
			case 1: //원장
				//회원 번호로 원장 검색
				DirectorVO dVo = directorService.selectByNo(mVo.getmNo());
				logger.info("[dVo] " + dVo);
				//해당 원장의 유치원 리스트 가져오기
				List<KindergartenVO> kindergartenList = kindergartenService.selectList();
				model.addAttribute("kList", kindergartenList);
				break;
			case 2: //교사
				//회원 번호로 교사 리스트 검색
				teacherList = teacherService.selectByMNo(mVo.getmNo());
				if(teacherList.size() != 0) {
					//화면에 해당 교사가 등록한 모든 유치원, 반 리스트 표시(교사 리스트 수만큼 for문 돌기)
					List<Map<String, Object> > list = new ArrayList<>();
					
					for(TeacherVO tVo : teacherList) {
						KindergartenVO kVo = kindergartenService.selectByNo(tVo.getkVo().getkNo()); //해당 교사가 등록한 유치원
						ClassVO cVo = classService.selectByNo(tVo.getcVo().getcNo()); //해당 교사가 등록한 반

						Map<String, Object> map = new HashMap<>();
						map.put("kVo", kVo);
						map.put("cVo", cVo);
						map.put("tVo", tVo); //해당 교사의 정보
						list.add(map);
					}
					
					//유치원, 반 VO 브라우저 전송
					model.addAttribute("msg", "유치원 등록 돼있음");
					model.addAttribute("list", list);
				}	
				break;
			default: //학부모
				//회원 번호로 학부모 리스트 검색
				parentList = parentService.selectListByMNo(mVo.getmNo());
				if(parentList.size() != 0) {
					//화면에 해당 부모가 등록한 모든 유치원, 반, 자녀 리스트 표시
					List<Map<String, Object> > list = new ArrayList<>();
					
					for(ParentVO pVo : parentList) {
						KindergartenVO kVo = kindergartenService.selectByNo(pVo.getkVo().getkNo()); //해당 부모가 등록한 유치원
						ClassVO cVo = classService.selectByNo(pVo.getcVo().getcNo()); //해당 부모가 등록한 반
						
						Map<String, Object> map = new HashMap<>();
						map.put("kVo", kVo);
						map.put("cVo", cVo);
						list.add(map);
					}
					
					//유치원, 반 VO 브라우저 전송
					model.addAttribute("list", list);
					model.addAttribute("msg", "유치원 등록 돼있음");
				}
				break;
		}
	}
	
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public String registGet(HttpSession session, Model model) {
		logger.info("🏳‍🌈 regist GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO vo = memberService.selectById((String) mId);

		model.addAttribute("mNo", vo.getmNo());
		
		switch (vo.getmType()) {
			case 2: //교사
				
				return "manage/manageTeacher"; 
			case 3: //학부모
				return "manage/manageParent";
			default:
				return null;
		}
	}
	
	@RequestMapping(value = "registD", method = RequestMethod.GET)
	public String registDGet(HttpSession session, int kNo, Model model) {
		logger.info("🏳‍🌈 regist Direcoter GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO vo = memberService.selectById((String) mId);

		model.addAttribute("mNo", vo.getmNo());
		
		if(vo.getmType() == 1) {
			model.addAttribute("kinder", kindergartenService.selectByNo(kNo));
			
			//해당 유치원번호를 가진 교사, 원아, 학부모 검색
			List<TeacherVO> teacherList = teacherService.selectListByKNo(kNo);
			List<ParentVO> parentList = parentService.selectListByKNo(kNo);
			
			logger.info("[teacherList] " + teacherList);
			logger.info("[parentList] " + parentList);
			
			model.addAttribute("tList", teacherList);
			model.addAttribute("pList", parentList);
			
			
			return "manage/manageDirector";
		}
		
		return null;
	}
	
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
		
		return "redirect:/manage/mymanage";
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
}
