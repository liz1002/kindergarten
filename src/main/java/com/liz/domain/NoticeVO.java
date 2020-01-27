package com.liz.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class NoticeVO {
	private int nNo; //번호
	private String nContent; //내용
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date nDate; //등록 날짜
	private TeacherVO tVo; //교사 정보
	private ChildrenVO chVo; //원아 정보
	
	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public NoticeVO(int nNo, String nContent, Date nDate, TeacherVO tVo, ChildrenVO chVo) {
		super();
		this.nNo = nNo;
		this.nContent = nContent;
		this.nDate = nDate;
		this.tVo = tVo;
		this.chVo = chVo;
	}

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public TeacherVO gettVo() {
		return tVo;
	}

	public void settVo(TeacherVO tVo) {
		this.tVo = tVo;
	}

	public ChildrenVO getChVo() {
		return chVo;
	}

	public void setChVo(ChildrenVO chVo) {
		this.chVo = chVo;
	}

	@Override
	public String toString() {
		return "NoticeVO [nNo=" + nNo + ", nContent=" + nContent + ", tVo=" + tVo + ", chVo=" + chVo + "]";
	}

}

