package com.liz.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liz.domain.Criteria;
import com.liz.domain.MemberVO;
import com.liz.domain.NoticeVO;
import com.liz.domain.PageMaker;
import com.liz.domain.ParentVO;
import com.liz.domain.TeacherVO;
import com.liz.service.BoardService;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.NoticeService;
import com.liz.service.ParentService;
import com.liz.service.TeacherService;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
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

	@Autowired
	private NoticeService noticeService;
	
	/* * * * * method * * * * */
	
	/* 메인 화면 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void mainGet(HttpSession session, Model model) {
		logger.info("▶ Notice Main GET");

		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
		logger.info("[mVo] " + mVo);

		if(mVo.getmType() == 2) {
			TeacherVO tVo = teacherService.selectBytMainAndMNo(mVo.getmNo());
			model.addAttribute("tVo", tVo);
			model.addAttribute("chList", childrenService.selectListByCNo(tVo.getcVo().getcNo())); //해당 반의 원아 리스트
		}else if(mVo.getmType() == 3) {
			ParentVO pVo = parentService.selectBypMainAndMNo(mVo.getmNo());
			model.addAttribute("pNo", pVo.getpNo());
			model.addAttribute("chNo", pVo.getChVo().getChNo());
		}
	}
	
	/* 교사 - 특정 원아의 알림장 */
	@RequestMapping(value = "teacher", method = RequestMethod.GET)
	public void teacherGet(int tNo, int chNo, Model model, Criteria cri) {
		logger.info("▶ Notice teacher GET");
		logger.info("[tNo] " + tNo);
		logger.info("[chNo] " + chNo);
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeService.selectListCountByChNo(chNo));
		
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("nList", noticeService.selectListByChNo(chNo, cri)); //알림장 기록
		model.addAttribute("tVo", teacherService.selectByTNo(tNo)); //교사 정보
		model.addAttribute("chVo", childrenService.selectByChNo(chNo)); //원아 정보
	}
	
	/* 학부모 - 특정 자녀의 알림장 */
	@RequestMapping(value = "parent", method = RequestMethod.GET)
	public void parentGet(HttpSession session, Model model, Criteria cri) {
		logger.info("▶ Notice parent GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
		logger.info("[mVo] " + mVo);
		
		ParentVO pVo = parentService.selectBypMainAndMNo(mVo.getmNo());
		logger.info("[pVo] " + pVo);
		
		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(5);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(noticeService.selectListCountByChNo(pVo.getChVo().getChNo()));
		
		model.addAttribute("pageMaker", pageMaker);		
		model.addAttribute("pVo", pVo); //학부모 정보
		model.addAttribute("chVo", childrenService.selectByChNo(pVo.getChVo().getChNo())); //원아 정보		
		model.addAttribute("nList", noticeService.selectListByChNo(pVo.getChVo().getChNo(), cri)); //알림장 기록
	}
	
	/* 알림장 작성 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void registGet(int tNo, int chNo, int cNo, Model model) {
		logger.info("▶ Notice regist GET");
		logger.info("[tNo] " + tNo);
		logger.info("[chNo] " + chNo);
		logger.info("[cNo] " + cNo);

		model.addAttribute("tNo", tNo);
		model.addAttribute("chNo", chNo);
		model.addAttribute("chList", childrenService.selectListByCNo(cNo)); //원아 리스트
	}
	
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String registPost(NoticeVO nVo, Model model) {
		logger.info("▶ Notice regist Post");
		logger.info("[nVo] " + nVo);
		
		nVo.setnContent(nVo.getnContent().replaceAll("\r\n", "<br>")); //엔터 적용 
		noticeService.regist(nVo); //추가
		
		model.addAttribute("tNo", nVo.gettVo().gettNo());
		model.addAttribute("chNo", nVo.getChVo().getChNo());
		
		return "redirect:/notice/teacher";
	}
	
	/* 알림장 수정 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void modifyGet(int nNo, Model model) {
		logger.info("▶ Notice modify GET");
		logger.info("[nNo] " + nNo);

		NoticeVO nVo = noticeService.selectByNNo(nNo);
		nVo.setnContent(nVo.getnContent().replaceAll("<br>", "\r\n")); //엔터 적용
		
		model.addAttribute("nVo", nVo);
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPost(NoticeVO nVo, Model model) {
		logger.info("▶ Notice modify Post");
		logger.info("[nVo] " + nVo);
		
		nVo.setnContent(nVo.getnContent().replaceAll("\r\n", "<br>")); //엔터 적용
		noticeService.modify(nVo); //수정

		model.addAttribute("tNo", nVo.gettVo().gettNo());
		model.addAttribute("chNo", nVo.getChVo().getChNo());
		
		return "redirect:/notice/teacher";
	}
	
	/* 알림장 삭제 */
	@RequestMapping(value = "remove", method = RequestMethod.GET)
	public String removeGet(int nNo, Model model) {
		logger.info("▶ Notice remove GET");
		logger.info("[nNo] " + nNo);
		
		NoticeVO nVo = noticeService.selectByNNo(nNo);
		logger.info("[nVo] " + nVo);		
		
		model.addAttribute("tNo", nVo.gettVo().gettNo());
		model.addAttribute("chNo", nVo.getChVo().getChNo());

		noticeService.remove(nNo); //삭제
		
		return "redirect:/notice/teacher";
	}

}

