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
import com.liz.domain.ClassVO;
import com.liz.domain.KindergartenVO;
import com.liz.domain.MemberVO;
import com.liz.domain.PApproveVO;
import com.liz.domain.ParentVO;
import com.liz.domain.TeacherVO;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.PApproveService;
import com.liz.service.ParentService;
import com.liz.service.TeacherService;

@Controller
@RequestMapping("/parent/*")
public class ParentController {
	private static final Logger logger = LoggerFactory.getLogger(ParentController.class);
	
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
	
	/* 관리 화면 */
	@RequestMapping(value = "manage", method = RequestMethod.GET)
	public void manageParent(HttpSession session, Model model) {
		logger.info("▶ Parent Manage GET");
		
		String mId = (String)session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById(mId);
		
		if(mVo.getmType() == 3) {
			model.addAttribute("pList", parentService.selectListByMNo(mVo.getmNo())); //해당 학부모의 유치원&반&자녀 리스트
			model.addAttribute("mNo", mVo.getmNo()); //회원번호
		}
	}
	
	/* 가입 신청 화면 */
	@RequestMapping(value = "apply", method = RequestMethod.GET)
	public void applyGet(HttpSession session, int mNo, Model model) {
		logger.info("▶  Parent Apply GET");
		
		int mType = (int) session.getAttribute("Type");

		if(mType == 3) {
			model.addAttribute("mNo", mNo);
		}
	}	
	
	//유치원 검색
	@ResponseBody
	@RequestMapping(value = "selectKinder/{kName}", method = RequestMethod.GET)
	public List<KindergartenVO> selectKinder(@PathVariable("kName") String kName) {
		logger.info("▶ Select Kinder GET");
		logger.info("[kName] " + kName);
		
		logger.info("[kList] " + kindergartenService.selectListByKName(kName));
		return kindergartenService.selectListByKName(kName);
	}	
	
	//반 검색
	@ResponseBody
	@RequestMapping(value = "selectClass/{kNo}", method = RequestMethod.GET)
	public List<ClassVO> selectClass(@PathVariable("kNo") int kNo) {
		logger.info("▶ Select Class GET");
		logger.info("[kNo] " + kNo);
		
		logger.info("[cList] " + classService.selectListByKNo(kNo));
		return classService.selectListByKNo(kNo);
	}	
	
	//원아 검색
	@ResponseBody
	@RequestMapping(value = "selectChildren/{cNo}", method = RequestMethod.GET)
	public List<ChildrenVO> selectChildren(@PathVariable("cNo") int cNo) {
		logger.info("▶ Select Children GET");
		logger.info("[cNo] " + cNo);
		
		logger.info("[chList] " + childrenService.selectListByCNo(cNo));
		return childrenService.selectListByCNo(cNo);
	}	
	
	/* 가입 신청 */
	@RequestMapping(value = "apply", method = RequestMethod.POST)
	public String applyPost(PApproveVO paVo, Model model) {
		logger.info("▶  Parent Apply POST");
		logger.info("[paVo] " + paVo);

		model.addAttribute("mNo", paVo.getmVo().getmNo());
		
		try{
			logger.info("[중복 값 확인] " + parentService.selectByMNoAndChNo(paVo));
			if(parentService.selectByMNoAndChNo(paVo) != null){ //가입한 목록에서 중복 확인
				 throw new Exception();	 //값이 있으면 에러 발생
			}
			pApproveService.regist(paVo); //학부모 가입 신청
		}catch (Exception e) { //신청 목록에서 중복이면 에러 발생
			model.addAttribute("errMsg", "이미 가입 또는 가입 신청된 유치원과 자녀입니다.");
			return "error/apply"; //실패 안내창(모든 에러 페이지 하나로 통일하고 에러 메세지 파라미터 보내기)***
		}
		
		return "redirect:/parent/applyList";
	}	
	
	/* 가입 신청 목록 */
	@RequestMapping(value = "applyList", method = RequestMethod.GET)
	public void applyListGet(HttpSession session, int mNo, Model model) {
		logger.info("▶  Parent Apply List GET");
		logger.info("[mNo] " + mNo);
		
		int mType = (int) session.getAttribute("Type");
		
		if(mType == 3) {
			logger.info("[paList] " + pApproveService.selectListByMNo(mNo));
			model.addAttribute("paList", pApproveService.selectListByMNo(mNo));
			model.addAttribute("mNo", mNo);
		}
	}	
	
	/* 가입 신청 취소 */
	@RequestMapping(value = "applyCancle", method = RequestMethod.GET)
	public String applyCancleGet(HttpSession session, int mNo, int chNo, Model model) {
		logger.info("▶  Parent Apply Cancle GET");

		logger.info("[mNo] " + mNo);
		logger.info("[chNo] " + chNo);
		
		PApproveVO paVo = new PApproveVO(new MemberVO(), new ChildrenVO(), null);
		paVo.getmVo().setmNo(mNo);
		paVo.getChVo().setChNo(chNo);
		
		logger.info("[paVo] " + paVo);
		
		pApproveService.removeByMNoAndChNo(paVo); //신청 내역 삭제
		
		model.addAttribute("mNo", mNo);
		
		return "redirect:/parent/applyList";
	}	
	
	/* 유치원 탙퇴 */
	@RequestMapping(value = "secession", method = RequestMethod.GET)
	public String secessionGet(HttpSession session, int pNo, Model model) {
		logger.info("▶ Parent Secession GET");
		logger.info("[pNo] " + pNo);
		
		parentService.removeByPNo(pNo);
		
		return "redirect:/parent/manage";
	}
	
	/* 별명 수정 */
	@RequestMapping(value = "modifyNick", method = RequestMethod.GET)
	public void modifyNickGet(HttpSession session, int pNo, Model model) {
		logger.info("▶ Parent Modify Nick GET");
		
		int mType = (int) session.getAttribute("Type");

		if(mType == 3) {
			model.addAttribute("pVo", parentService.selectByPNo(pNo)); //학부모 정보
		}else {
			model.addAttribute("msg", "권한이 없습니다.");
		}
	}	
	
	@RequestMapping(value = "modifyNick", method = RequestMethod.POST)
	public String modifyNickPost(ParentVO pVo) {
		logger.info("▶ Parent Modify Nick POST");
		
		parentService.modifyNickname(pVo);; //별명 수정
		
		return "redirect:/parent/manage";
	}	
	
	/* 교사 삭제 */	
	@ResponseBody
	@RequestMapping(value = "remove/{kNo}", method = RequestMethod.POST)
	public List<TeacherVO> removePost(@RequestBody int[] tNoList, @PathVariable("kNo") int kNo) {
		logger.info("▶ Teacher Remove POST");
		
		for(int tNo : tNoList) {
			logger.info("[tNo 확인] " + tNo);
			teacherService.removeByTNo(tNo);; //교사 삭제
		}
		
		return teacherService.selectListByKNo(kNo); //교사 리스트
	}
}
