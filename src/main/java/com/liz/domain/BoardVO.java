package com.liz.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardVO {
	private int bNo; //게시글 번호
	private	String bTitle; //제목
	private	String bContent; //내용
	@DateTimeFormat(pattern = "yyyy-MM-dd") //hh:mm
	private	Date bDate; //등록날짜
	private int bNotice; //공지여부
	private String bNickname; //작성자별명
	private MemberVO mVo; //회원정보
	private ClassVO cVo; //반정보
	
	public BoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}	

	public BoardVO(int bNo, String bTitle, String bContent, Date bDate, int bNotice, String bNickname, MemberVO mVo,
			ClassVO cVo) {
		super();
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bNotice = bNotice;
		this.bNickname = bNickname;
		this.mVo = mVo;
		this.cVo = cVo;
	}

	public int getbNo() {
		return bNo;
	}

	public void setbNo(int bNo) {
		this.bNo = bNo;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public int getbNotice() {
		return bNotice;
	}

	public void setbNotice(int bNotice) {
		this.bNotice = bNotice;
	}

	public String getbNickname() {
		return bNickname;
	}

	public void setbNickname(String bNickname) {
		this.bNickname = bNickname;
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
		return "BoardVO [bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bDate=" + bDate
				+ ", bNotice=" + bNotice + ", bNickname=" + bNickname + ", mVo=" + mVo + ", cVo=" + cVo + "]";
	}
}
