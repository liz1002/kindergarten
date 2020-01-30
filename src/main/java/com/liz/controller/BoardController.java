package com.liz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.liz.domain.BoardVO;
import com.liz.domain.ClassVO;
import com.liz.domain.Criteria;
import com.liz.domain.DirectorVO;
import com.liz.domain.MemberVO;
import com.liz.domain.PageMaker;
import com.liz.domain.ParentVO;
import com.liz.domain.TeacherVO;
import com.liz.service.BoardService;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.ParentService;
import com.liz.service.TeacherService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
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

	
	/* * * * * method * * * * */
	
	/* 반 - 게시판*/
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void mainGet(HttpSession session, Model model, Criteria cri, int cNo) {
		logger.info("▶ Board Main GET");

		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);
		logger.info("[mVo] " + mVo);
		logger.info("[cNo] " + cNo);
		
		try {
			if(mVo.getmType() == 2) {
				TeacherVO tVo = teacherService.selectBytMainAndMNo(mVo.getmNo()); //교사 대표 유치원 정보
				
				if(cNo == 0) {
					cNo = tVo.getcVo().getcNo();
				}				
			}else if(mVo.getmType() == 3) {
				ParentVO pVo = parentService.selectBypMainAndMNo(mVo.getmNo()); //학부모 대표 유치원 정보
							
				if(cNo == 0) {
					cNo = pVo.getChVo().getcVo().getcNo();
				}
			}		
			
			cri.setPerPageNum(5);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(boardService.selectListCountByCNo(cNo));
			
			model.addAttribute("mNo", mVo.getmNo());
			model.addAttribute("bList", boardService.selectListByCNo(cNo, cri));
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("cVo", classService.selectByNo(cNo));
		}catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	/* 게시글 상세 보기 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public void detailGet(int bNo, Model model) {
		logger.info("▶ Board Detail GET");
		logger.info("[bNo] " + bNo);

		model.addAttribute("bVo", boardService.selectByBNo(bNo));
	}
	
	/* 게시글 작성 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void registGet(int mNo, int cNo, Model model) {
		logger.info("▶ Board Regist GET");
		logger.info("[mNo] " + mNo);
		logger.info("[cNo] " + cNo);
		
		MemberVO mVo = memberService.selectByNo(mNo);
		if(mVo.getmType() == 1) {
			model.addAttribute("dVo", directorService.selectBydMainAndMNo(mNo));			
		}else if(mVo.getmType() == 2) {
			model.addAttribute("tVo", teacherService.selectBytMainAndMNo(mNo));
		}else if(mVo.getmType() == 3) {
			model.addAttribute("pVo", parentService.selectBypMainAndMNo(mNo));
		}
		
		model.addAttribute("cVo", classService.selectByNo(cNo));
	}
	
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String registPost(BoardVO bVo, int kNo, Model model) {
		logger.info("▶ Board Regist POST");
		logger.info("[bVo] " + bVo);
		
		model.addAttribute("cNo", bVo.getcVo().getcNo()); //현재 선택한 반 번호 저장

		bVo.setbContent(bVo.getbContent().replaceAll("\r\n", "<br>")); //엔터 적용 
		
		if(kNo != 0) {
			List<ClassVO> cList = classService.selectListByKNo(kNo);
			for(ClassVO cVo : cList) {
				bVo.getcVo().setcNo(cVo.getcNo());
				bVo.setbNotice(1);
				logger.info("[cNo 변경 확인] " + bVo.getcVo().getcNo());
				
				boardService.regist(bVo); //게시글 추가
			}
		}
		
		return "redirect:/board/main";
	}
	
	/* 게시글 수정 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void modifyGet(int bNo, Model model) {
		logger.info("▶ Board Modify GET");
		logger.info("[bNo] " + bNo);
		
		BoardVO bVo = boardService.selectByBNo(bNo);
		bVo.setbContent(bVo.getbContent().replaceAll("<br>", "\r\n")); //엔터 적용
		
		model.addAttribute("bVo", bVo);
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPost(BoardVO bVo, Model model) {
		logger.info("▶ Board Modify POST");
		logger.info("[bVo] " + bVo);

		bVo.setbContent(bVo.getbContent().replaceAll("\r\n", "<br>")); //엔터 적용 
		boardService.modify(bVo); //게시글 수정
		
		model.addAttribute("bNo", bVo.getbNo());
		
		return "redirect:/board/detail";
	}
	
	/* 게시글 삭제 */
	@RequestMapping(value = "remove", method = RequestMethod.GET)
	public String removeGet(int bNo, Model model) {
		logger.info("▶ Board remove GET");
		logger.info("[bNo] " + bNo);
		
		BoardVO bVo = boardService.selectByBNo(bNo);
		
		boardService.remove(bNo); //삭제
		
		model.addAttribute("cNo", bVo.getcVo().getcNo());
		
		return "redirect:/board/main";
	}
	
	/* 원장 - 메인(유치원 리스트) 화면 */
	@RequestMapping(value = "mainD", method = RequestMethod.GET)
	public void mainDirectorGet(HttpSession session, Model model) {
		logger.info("▶ Board MainD GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		if(mVo.getmType() == 1) {
			DirectorVO dVo = directorService.selectBydMainAndMNo(mVo.getmNo()); //원장 대표 유치원 정보
			model.addAttribute("dVo", dVo);
			model.addAttribute("cList", classService.selectListByKNo(dVo.getkVo().getkNo())); //대표 유치원의 반 리스트
		}
	}
	
	/* 원장 - 유치원 선택 시 */
	@RequestMapping(value = "mainK", method = RequestMethod.GET)
	public String mainKinderGet(int dNo, int kNo, Model model) {
		logger.info("▶ Board MainK GET");
		
		
		DirectorVO dVo = directorService.selectByDNo(dNo); //원장 유치원 정보
		model.addAttribute("dVo", dVo);
		model.addAttribute("cList", classService.selectListByKNo(kNo)); //선택한 유치원의 반 리스트
		
		return "board/mainD";
	}
	

}
