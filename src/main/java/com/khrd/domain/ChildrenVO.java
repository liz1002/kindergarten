package com.khrd.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ChildrenVO {
	private int chNo; //원아번호
	private String chName; //원아이름
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date chRegdate; //생년월일
	private int kNo; //유치원번호
	private int cNo; //반번호
	
	public ChildrenVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChildrenVO(int chNo, String chName, Date chRegdate, int kNo, int cNo) {
		super();
		this.chNo = chNo;
		this.chName = chName;
		this.chRegdate = chRegdate;
		this.kNo = kNo;
		this.cNo = cNo;
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

	public int getkNo() {
		return kNo;
	}

	public void setkNo(int kNo) {
		this.kNo = kNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	@Override
	public String toString() {
		return "ChildrenVO [chNo=" + chNo + ", chName=" + chName + ", chRegdate=" + chRegdate + ", kNo=" + kNo
				+ ", cNo=" + cNo + "]";
	}	
}
