package com.liz.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ClassVO {
	private int cNo; //반번호
	private String cCode; //반코드
	private String cName; //반이름
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cRegdate; //등록날짜
	private int kNo; //유치원번호  *유치원 전체 정보
	
	public ClassVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ClassVO(int cNo, String cCode, String cName, Date cRegdate, int kNo) {
		super();
		this.cNo = cNo;
		this.cCode = cCode;
		this.cName = cName;
		this.cRegdate = cRegdate;
		this.kNo = kNo;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcCode() {
		return cCode;
	}

	public void setcCode(String cCode) {
		this.cCode = cCode;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}
	
	public Date getcRegdate() {
		return cRegdate;
	}

	public void setcRegdate(Date cRegdate) {
		this.cRegdate = cRegdate;
	}

	public int getkNo() {
		return kNo;
	}

	public void setkNo(int kNo) {
		this.kNo = kNo;
	}

	@Override
	public String toString() {
		return "ClassVO [cNo=" + cNo + ", cCode=" + cCode + ", cName=" + cName + ", cRegdate=" + cRegdate + ", kNo="
				+ kNo + "]";
	}
}
