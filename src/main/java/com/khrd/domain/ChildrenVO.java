package com.khrd.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ChildrenVO {
	private int chNo; //원아번호
	private String chName; //원아이름
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date chRegdate; //생년월일
	private KindergartenVO kVo; //유치원정보
	private ClassVO cVo; //반정보
	
	public ChildrenVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChildrenVO(int chNo, String chName, Date chRegdate, KindergartenVO kVo, ClassVO cVo) {
		super();
		this.chNo = chNo;
		this.chName = chName;
		this.chRegdate = chRegdate;
		this.kVo = kVo;
		this.cVo = cVo;
	}

	public int getChNo() {
		return chNo;
	}

	public void setChNo(int chNo) {
		this.chNo = chNo;
	}

	public String getChName() {
		return chName;
	}

	public void setChName(String chName) {
		this.chName = chName;
	}

	public Date getChRegdate() {
		return chRegdate;
	}

	public void setChRegdate(Date chRegdate) {
		this.chRegdate = chRegdate;
	}

	public KindergartenVO getkVo() {
		return kVo;
	}

	public void setkVo(KindergartenVO kVo) {
		this.kVo = kVo;
	}

	public ClassVO getcVo() {
		return cVo;
	}

	public void setcVo(ClassVO cVo) {
		this.cVo = cVo;
	}

	@Override
	public String toString() {
		return "ChildrenVO [chNo=" + chNo + ", chName=" + chName + ", chRegdate=" + chRegdate + ", kVo=" + kVo
				+ ", cVo=" + cVo + "]";
	}
}
