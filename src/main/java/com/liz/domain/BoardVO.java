package com.liz.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardVO {
	private int bNo; //게시글 번호
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm")
	private	Date bDate; //등록날짜
	private	String bContent; //내용
	private int bNoitce; //공지여부
	private MemberVO mVo; //회원정보
	private ClassVO cVo; //반정보
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardVO(int bNo, Date bDate, String bContent, int bNoitce, MemberVO mVo, ClassVO cVo) {
		super();
		this.bNo = bNo;
		this.bDate = bDate;
		this.bContent = bContent;
		this.bNoitce = bNoitce;
		this.mVo = mVo;
		this.cVo = cVo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public int getbNoitce() {
		return bNoitce;
	}

	public void setbNoitce(int bNoitce) {
		this.bNoitce = bNoitce;
	}

	public MemberVO getmVo() {
		return mVo;
	}

	public void setmVo(MemberVO mVo) {
		this.mVo = mVo;
	}

	public ClassVO getcVo() {
		return cVo;
	}

	public void setcVo(ClassVO cVo) {
		this.cVo = cVo;
	}

	@Override
	public String toString() {
		return "BoardVO [bNo=" + bNo + ", bDate=" + bDate + ", bContent=" + bContent + ", bNoitce=" + bNoitce
				+ ", mVo=" + mVo + ", cVo=" + cVo + "]";
	}	
}
