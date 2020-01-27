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
import com.liz.domain.KindergartenVO;
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
@RequestMapping("/teacher/*")
public class TeacherController {
	private static final Logger logger = LoggerFactory.getLogger(TeacherController.class);
	
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
	public void manageTeacher(HttpSession session, Model model) {
		logger.info("▶ Teacher Manage GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
		
		if(mVo.getmType() == 2) {
			model.addAttribute("tList", teacherService.selectListByMNo(mVo.getmNo())); //해당 교사의 유치원&반 리스트
			model.addAttribute("mNo", mVo.getmNo()); //회원 번호
		}
	}
	
	/* 가입 신청 화면 */
	@RequestMapping(value = "apply", method = RequestMethod.GET)
	public void applyGet(HttpSession session, int mNo, Model model) {
		logger.info("▶  Teacher Apply GET");
		
		int mType = (int) session.getAttribute("Type");

		if(mType == 2) {
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
	
	/* 가입 신청 */
	@RequestMapping(value = "apply", method = RequestMethod.POST)
	public String applyPost(TApproveVO taVo, Model model) {
		logger.info("▶  Teacher Apply POST");
		logger.info("[taVo] " + taVo);

		model.addAttribute("mNo", taVo.getmVo().getmNo());
		
		try{
			logger.info("[중복 값 확인] " + teacherService.selectByMNoAndCNoAndTType(taVo));
			if(teacherService.selectByMNoAndCNoAndTType(taVo) != null){ //가입한 목록에서 중복 확인
				 throw new Exception();	//값이 있으면 에러 발생
			}
			tApproveService.regist(taVo); //교사 가입 신청
		}catch (Exception e) { //신청 목록에서 중복이면 에러 발생
			model.addAttribute("errMsg", "이미 가입 또는 가입 신청된 유치원입니다.");
			return "error/apply"; //실패 안내창(모든 에러 페이지 하나로 통일하고 에러 메세지 파라미터 보내기)***
		}
		
		return "redirect:/teacher/applyList";
	}	
	
	/* 가입 신청 목록 */
	@RequestMapping(value = "applyList", method = RequestMethod.GET)
	public void applyListGet(HttpSession session, int mNo, Model model) {
		logger.info("▶  Teacher Apply List GET");
		logger.info("[mNo] " + mNo);
		
		int mType = (int) session.getAttribute("Type");
		
		if(mType == 2) {
			logger.info("[taList] " + tApproveService.selectListByMNo(mNo));
			model.addAttribute("taList", tApproveService.selectListByMNo(mNo));
			model.addAttribute("mNo", mNo);
		}
	}	
	
	/* 가입 신청 취소 */
	@RequestMapping(value = "applyCancle", method = RequestMethod.GET)
	public String applyCancleGet(HttpSession session, int mNo, int cNo, int tType, Model model) {
		logger.info("▶  Teacher Apply Cancle GET");

		logger.info("[mNo] " + mNo);
		logger.info("[cNo] " + cNo);
		logger.info("[tType] " + tType);
		
		TApproveVO taVo = new TApproveVO(new MemberVO(), new ClassVO(), null, 0);
		taVo.getmVo().setmNo(mNo);
		taVo.getcVo().setcNo(cNo);
		taVo.settType(tType);
		
		logger.info("[taVo] " + taVo);
		
		tApproveService.removeByMNoAndCNoAndTType(taVo); //신청 내역 삭제
		
		model.addAttribute("mNo", mNo);
		
		return "redirect:/teacher/applyList";
	}	
	
	/* 유치원 탙퇴 */
	@RequestMapping(value = "secession", method = RequestMethod.GET)
	public String secessionGet(HttpSession session, int tNo, Model model) {
		logger.info("▶ Teacher Secession GET");
		logger.info("[tNo] " + tNo);
		
		teacherService.removeByTNo(tNo);
		
		return "redirect:/teacher/manage";
	}
	
	/* 별명 수정 */
	@RequestMapping(value = "modifyNick", method = RequestMethod.GET)
	public void modifyNickGet(HttpSession session, int tNo, Model model) {
		logger.info("▶ Teacher Modify Nick GET");
		
		int mType = (int) session.getAttribute("Type");

		if(mType == 2) {
			model.addAttribute("tVo", teacherService.selectByTNo(tNo)); //교사 정보
		}else {
			model.addAttribute("msg", "권한이 없습니다.");
		}
	}	
	
	@RequestMapping(value = "modifyNick", method = RequestMethod.POST)
	public String modifyNickPost(TeacherVO tVo) {
		logger.info("▶ Teacher Modify Nick POST");
		
		teacherService.modifyNickname(tVo); //별명 수정
		
		return "redirect:/teacher/manage";
	}	
	
	/* 교사 삭제 */	
	@ResponseBody
	@RequestMapping(value = "remove/{kNo}", method = RequestMethod.POST)
	public List<TeacherVO> removePost(@RequestBody int[] mNoList, @PathVariable("kNo") int kNo) {
		logger.info("▶ Teacher Remove POST");
		
		for(int mNo : mNoList) {
			logger.info("[mNo 확인] " + mNo);
			teacherService.removeByMNoAndKNo(mNo, kNo); //교사 삭제
		}
		
		logger.info("[kNo] 확인 " + kNo);
		
		return teacherService.selectListByKNo(kNo); //교사 리스트
	}
	
	/* 학부모 가입 신청 목록 */
	@RequestMapping(value = "applyPList", method = RequestMethod.GET)
	public void applyPListGet(HttpSession session, int cNo, Model model) {
		logger.info("▶  Teacher Apply Parent List GET");
		logger.info("[cNo] " + cNo);
		
		int mType = (int) session.getAttribute("Type");
		
		if(mType == 2) {
			logger.info("[paList] " + model.addAttribute("paList", pApproveService.selectListByCNo(cNo)));
			model.addAttribute("paList", pApproveService.selectListByCNo(cNo));
			model.addAttribute("cVo", classService.selectByNo(cNo));
		}
	}	
	
	//가입 승인
	@ResponseBody
	@RequestMapping(value = "admitP/{cNo}", method = RequestMethod.POST)
	public List<PApproveVO> admitP(@RequestBody ParentVO[] pList, @PathVariable("cNo") int cNo) {
		logger.info("▶ Teacher Admit Parent POST");
		logger.info("[cNo] " + cNo);
		
		for(ParentVO pVo : pList) {
			logger.info("[생성한 pVo 확인] " + pVo);
			parentService.regist(pVo); //학부모 추가
			PApproveVO paVo = new PApproveVO(pVo.getmVo(), pVo.getChVo(), null);
			logger.info("[생성한 paVO 값 확인] " + paVo);
			pApproveService.removeByMNoAndChNo(paVo);; //승인 목록에서 삭제
		}
		
		return pApproveService.selectListByCNo(cNo); //남은 신청 학부모 목록
	}	
	
	//가입 거부
	@ResponseBody
	@RequestMapping(value = "refuseP/{cNo}", method = RequestMethod.POST)
	public List<PApproveVO> refuseP(@RequestBody PApproveVO[] pList, @PathVariable("cNo") int cNo) {
		logger.info("▶ Teacher Refuse Parent POST");
		logger.info("[cNo] " + cNo);
		
		for(PApproveVO paVo : pList) {
			logger.info("[생성한 paVo 확인] " + paVo);
			pApproveService.removeByMNoAndChNo(paVo);; //승인 목록에서 삭제
		}
		
		return pApproveService.selectListByCNo(cNo); //남은 신청 학부모 목록
	}	
	
	/* 대표 유치원 설정 */
	@ResponseBody
	@RequestMapping(value = "main", method = RequestMethod.POST)
	public void main(@RequestBody TeacherVO tVo) {
		logger.info("▶ Teacher Remove POST");

		logger.info("[tVo] " + tVo);		
		
		teacherService.modifyTMain(tVo);
	}	
}
