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

import com.liz.domain.ChildrenVO;
import com.liz.domain.ClassVO;
import com.liz.domain.FamilyVO;
import com.liz.domain.KindergartenVO;
import com.liz.domain.MemberVO;
import com.liz.domain.TeacherVO;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.FamilyService;
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

	@Autowired
	private FamilyService familyService;
	
	/* * * * * method * * * * */
	
	
	
	/* 유치원 코드 확인 */
	@ResponseBody
	@RequestMapping(value = "kCodeCheck", method = RequestMethod.GET)
	public Map<String, Object> kCodeCheck(String kCode) {
		logger.info("▶ K Code Check GET");
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
		logger.info("▶ C Code Check GET");
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
	
	/* 학부모 - 유치원 등록, 반 등록, 학부모 생성 */
	@RequestMapping(value = "registP", method = RequestMethod.POST)
	public String registPPost(int mNo, int kNo) {
		logger.info("▶ regist Teacher POST");
		logger.info("[mNo] " + mNo);
		logger.info("[kNo] " + kNo);
		
		// 학부모 추가
		parentService.regist(mNo, kNo);
		
		return "redirect:/manage/manageMain";
	}

	
	
	
	
	/*-------------------------------[원장]--------------------------------*/
	
	/* 원장 관리 화면 */
	@RequestMapping(value = "manageDirector", method = RequestMethod.GET)
	public void manageDirector(HttpSession session, Model model) {
		logger.info("▶ Manage Director GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
				
		if(mVo.getmType() == 1) {
			model.addAttribute("dList", directorService.selectListByNo(mVo.getmNo())); //해당 원장의 유치원 리스트
		}
	}
	
	/* 원장 - 유치원 - 반, 교사, 학부모 관리 */
	@RequestMapping(value = "manageKinder", method = RequestMethod.GET)
	public void manageKinder(HttpSession session, int kNo, Model model) {
		logger.info("▶ Manage Kinder GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO vo = memberService.selectById((String) mId);

		model.addAttribute("mNo", vo.getmNo());
		
		if(vo.getmType() == 1) {
			model.addAttribute("kVo", kindergartenService.selectByNo(kNo)); //해당 유치원 정보
			model.addAttribute("cList", classService.selectListByKNo(kNo)); //해당 유치원 반 리스트
			model.addAttribute("tList", teacherService.selectListByKNo(kNo)); //해당 유치원번호의 교사 리스트
			model.addAttribute("pList", parentService.selectListByKNo(kNo)); //해당 유치원번호의 학부모 리스트
			model.addAttribute("chList", childrenService.selectListByKNo(kNo)); //해당 유치원번호의 원아 리스트
		}
	}
	
	
	/*-------------------------------[교사]--------------------------------*/
	
	/* 교사 관리 화면 */
	@RequestMapping(value = "manageTeacher", method = RequestMethod.GET)
	public void manageTeacher(HttpSession session, Model model) {
		logger.info("▶ Manage Teacher GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
		
		if(mVo.getmType() == 2) {
			model.addAttribute("tList", teacherService.selectByMNo(mVo.getmNo())); //해당 교사의 유치원&반 리스트
		}
	}
	
	/* 교사 - 반 - 학부모, 원아 관리 */
	@RequestMapping(value = "manageClass", method = RequestMethod.GET)
	public void manageClass(HttpSession session, int cNo, int tType, Model model) {
		logger.info("▶ Manage Class GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		model.addAttribute("mNo", mVo.getmNo());
		TeacherVO tVo = new TeacherVO();
		tVo.setcVo(new ClassVO(cNo, null, null, 0));
		tVo.setmVo(mVo);
		tVo.settType(tType);
		
		if(mVo.getmType() == 2) {
			model.addAttribute("cVo", classService.selectByNo(cNo)); //해당 반 정보
			model.addAttribute("tVo", teacherService.selectByMNoAndCNoAndTType(tVo)); //교사 정보
			model.addAttribute("pList", parentService.selectListByCNo(cNo)); //해당 반번호의 학부모 리스트
			model.addAttribute("chList", childrenService.selectListByCNo(cNo)); //해당 반번호의 원아 리스트
		}
	}
	
	/* 원아 삭제 */
	@ResponseBody
	@RequestMapping(value = "removeChildren/{cNo}", method = RequestMethod.POST)
	public List<ChildrenVO> removeChildrenPost(@RequestBody int[] chNoList, @PathVariable("cNo") int cNo) {
		logger.info("▶ Remove Children POST");
		
		logger.info("[cNo] " + cNo);
		
		for(int chNo : chNoList) {
			logger.info("[chNo] " + chNo);
			
			//유아 번호로 family 검색 null이 아니면 가족 삭제
			List<FamilyVO> fList = familyService.selectListByChNo(chNo);
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
	
	
	/*-------------------------------[학부모]--------------------------------*/
	
	/* 학부모 관리 화면 */
	@RequestMapping(value = "manageParent", method = RequestMethod.GET)
	public void manageParent(HttpSession session, Model model) {
		logger.info("▶ Manage Parent GET");
		
		String mId = (String)session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById(mId);
		
		if(mVo.getmType() == 3) {
			model.addAttribute("pList", parentService.selectListByMNo(mVo.getmNo()));//해당 부모의 자녀 & 반 리스트
		}
	}
}
