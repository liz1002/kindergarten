package com.liz.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.liz.domain.AlbumVO;
import com.liz.domain.AlbumVO;
import com.liz.domain.Criteria;
import com.liz.domain.DirectorVO;
import com.liz.domain.MemberVO;
import com.liz.domain.PageMaker;
import com.liz.domain.ParentVO;
import com.liz.domain.TeacherVO;
import com.liz.service.AlbumService;
import com.liz.service.ChildrenService;
import com.liz.service.ClassService;
import com.liz.service.DirectorService;
import com.liz.service.KindergartenService;
import com.liz.service.MemberService;
import com.liz.service.ParentService;
import com.liz.service.TeacherService;
import com.liz.util.UploadFileUtils;

@Controller
@RequestMapping("/album/*")
public class AlbumController {
	private static final Logger logger = LoggerFactory.getLogger(AlbumController.class);
	
	@Resource(name = "uploadPath") //bean id로 주입 받기(= DI : Dependency Injection)
	private String uploadPath; //파일 저장 경로(c:/kids/upload)
	
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
	private AlbumService albumService;

	
	/* * * * * method * * * * */
	
	/* 반 별 앨범 */
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public void mainGet(HttpSession session, Model model, Criteria cri, int cNo) {
		logger.info("▶ Album Main GET");

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
				
				model.addAttribute("tNo", tVo.gettNo());
			}else if(mVo.getmType() == 3) {
				ParentVO pVo = parentService.selectBypMainAndMNo(mVo.getmNo()); //학부모 대표 유치원 정보
							
				if(cNo == 0) {
					cNo = pVo.getChVo().getcVo().getcNo();
				}
			}		
			
			cri.setPerPageNum(9);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(albumService.selectListCountByCNo(cNo));
			
			model.addAttribute("aList", albumService.selectListByCNo(cNo, cri));
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("cVo", classService.selectByNo(cNo));
		}catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	/* 원장 - 메인(유치원 리스트) 화면 */
	@RequestMapping(value = "mainD", method = RequestMethod.GET)
	public void mainDirectorGet(HttpSession session, Model model) {
		logger.info("▶ Album MainD GET");
		
		Object mId = session.getAttribute("Auth");
		MemberVO mVo = memberService.selectById((String) mId);

		if(mVo.getmType() == 1) {
			DirectorVO dVo = directorService.selectBydMainAndMNo(mVo.getmNo()); //원장 대표 유치원 정보
			model.addAttribute("dVo", dVo);
			model.addAttribute("cList", classService.selectListByKNo(dVo.getkVo().getkNo())); //대표 유치원의 반 리스트
		}
	}
	
	/* 게시글 상세 보기 */
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public void detailGet(int aNo, Model model) {
		logger.info("▶ Album Detail GET");
		logger.info("[aNo] " + aNo);

		model.addAttribute("aVo", albumService.selectByANo(aNo));
	}
	
	/* 앨범 추가 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void registGet(int tNo, int cNo, Model model) {
		logger.info("▶ Album Regist GET");
		logger.info("[tNo] " + tNo);
		logger.info("[cNo] " + cNo);
		
		model.addAttribute("tVo", teacherService.selectByTNo(tNo));
		model.addAttribute("chList", childrenService.selectListByCNo(cNo));
	}
	
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public String registPost(AlbumVO aVo, MultipartFile file, Model model) throws IOException {
		logger.info("▶ Album Regist POST");
		logger.info("[aVo] " + aVo);

		aVo.setaComent(aVo.getaComent().replaceAll("\r\n", "<br>")); //엔터 적용 

		if(file.isEmpty() == false) { //추가할 파일이 있으면 추가
			logger.info("*원본 파일명 ::: " + file.getOriginalFilename());
			logger.info("*파일 크기 ::: " + file.getSize());
		
			System.out.println("uploadpath" + uploadPath);
			
			String savedName = UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
			System.out.println("업로드한 파일명 :: " + savedName);				
			
			aVo.setaFile(savedName); //업로드한 파일명으로 set
			albumService.regist(aVo); //앨범 추가
		}		

		model.addAttribute("cNo", 0);
		
		return "redirect:/album/main";
	}
	
	/* 앨범 수정 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void modifyGet(int bNo, Model model) {
		logger.info("▶ Album Modify GET");
		logger.info("[bNo] " + bNo);
		
//		AlbumVO bVo = AlbumService.selectByBNo(bNo);
//		bVo.setbContent(bVo.getbContent().replaceAll("<br>", "\r\n")); //엔터 적용
		
//		model.addAttribute("bVo", bVo);
	}
	
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPost(AlbumVO aVo, Model model) {
		logger.info("▶ Album Modify POST");
		logger.info("[aVo] " + aVo);

		aVo.setaComent(aVo.getaComent().replaceAll("\r\n", "<br>")); //엔터 적용 
//		AlbumService.modify(bVo); //게시글 수정
//		
//		model.addAttribute("bNo", bVo.getbNo());
		
		return "redirect:/Album/detail";
	}
	
	@RequestMapping(value = "displayThumbFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayThumbFile(String filename){
		logger.info("▶ Album Modify POST");
		ResponseEntity<byte[]> entity = null;
		logger.info("* filename * " + filename);
		
		try {
			String formatName = filename.substring(filename.lastIndexOf(".") + 1);
			MediaType type = null;
			if(formatName.equalsIgnoreCase("jpg")) {
				type = MediaType.IMAGE_JPEG;
			}else if(formatName.equalsIgnoreCase("png")) {
				type = MediaType.IMAGE_PNG;
			}else if(formatName.equalsIgnoreCase("gif")) {
				type = MediaType.IMAGE_GIF;
			}
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(type);
			
			InputStream in = new FileInputStream(uploadPath + "/" + filename);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			in.close(); //파일 삭제 등 안 먹히면 반드시 close
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value = "displayOriginFile", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayOriginFile(String filename){
		ResponseEntity<byte[]> entity = null;
		logger.info("* filename * " + filename);
		
		try {
			String formatName = filename.substring(filename.lastIndexOf(".") + 1);
			MediaType type = null;
			if(formatName.equalsIgnoreCase("jpg")) {
				type = MediaType.IMAGE_JPEG;
			}else if(formatName.equalsIgnoreCase("png")) {
				type = MediaType.IMAGE_PNG;
			}else if(formatName.equalsIgnoreCase("gif")) {
				type = MediaType.IMAGE_GIF;
			}
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(type);
			
			String datePath = filename.substring(0, 12); // "년/월/일/" 자르기
			String originFilename = filename.substring(14); // "년/월/일/s_" 뒤부터
			
			InputStream in = new FileInputStream(uploadPath + datePath + originFilename);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			in.close(); //파일 삭제 등 안 먹히면 반드시 close
		} catch (Exception e) {
			e.printStackTrace();
		}
		return entity;
	}
	
	/* 앨범 삭제 */
	@RequestMapping(value = "remove", method = RequestMethod.GET)
	public String deleteFile(String filename){
		logger.info("********** [deleteFile GET] **********");
		
		try {
			//DB에서 삭제
			//albumService.remove(filename);
			
			//썸네일 삭제
			File file = new File(uploadPath + "/" + filename);
			file.delete();
			 
			//원본 삭제
			String datePath = filename.substring(0, 12); // "년/월/일/" 자르기
			String originFilename = filename.substring(14); // "년/월/일/s_" 뒤부터
			File originFile = new File(uploadPath + datePath + originFilename);

			System.out.println("원본 경로 ::: " + originFile);
			originFile.delete();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/album/main";
	}

}
