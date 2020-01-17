package com.liz.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class KindergartenVO {
	private int kNo; //유치원번호
	private String kCode; //유치원코드
	private String kName; //유치원이름
	private String kTel; //유치원전화번호
	private String kAddress; //유치원주소
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date kRegdate; //등록날짜
	
	public KindergartenVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public KindergartenVO(int kNo, String kCode, String kName, String kTel, String kAddress, Date kRegdate) {
		super();
		this.kNo = kNo;
		this.kCode = kCode;
		this.kName = kName;
		this.kTel = kTel;
		this.kAddress = kAddress;
		this.kRegdate = kRegdate;
	}

	public int getkNo() {
		return kNo;
	}

	public void setkNo(int kNo) {
		this.kNo = kNo;
	}

	public String getkCode() {
		return kCode;
	}

	public void setkCode(String kCode) {
		this.kCode = kCode;
	}

	public String getkName() {
		return kName;
	}

	public void setkName(String kName) {
		this.kName = kName;
	}

	public String getkTel() {
		return kTel;
	}

	public void setkTel(String kTel) {
		this.kTel = kTel;
	}

	public String getkAddress() {
		return kAddress;
	}

	public void setkAddress(String kAddress) {
		this.kAddress = kAddress;
	}
	
	public Date getkRegdate() {
		return kRegdate;
	}

	public void setkRegdate(Date kRegdate) {
		this.kRegdate = kRegdate;
	}

	@Override
	public String toString() {
		return "KindergartenVO [kNo=" + kNo + ", kCode=" + kCode + ", kName=" + kName + ", kTel=" + kTel + ", kAddress="
				+ kAddress + ", kRegdate=" + kRegdate + "]";
	}
}
