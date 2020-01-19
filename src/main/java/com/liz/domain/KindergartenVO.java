package com.liz.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class KindergartenVO {
	private int kNo; //유치원번호
	private String kName; //유치원이름
	private String kAreacode; //유치원지역번호
	private String kDialing; //유치원국번
	private String kTel; //유치원연락처
	private String kZipcode; //유치원우편번호
	private String kFirstaddr; //유치원도로명
	private String kLastaddr; //유치원상세주소
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date kDate; //등록날짜

	public KindergartenVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public KindergartenVO(int kNo, String kName, String kAreacode, String kDialing, String kTel, String kZipcode,
			String kFirstaddr, String kLastaddr, Date kDate) {
		super();
		this.kNo = kNo;
		this.kName = kName;
		this.kAreacode = kAreacode;
		this.kDialing = kDialing;
		this.kTel = kTel;
		this.kZipcode = kZipcode;
		this.kFirstaddr = kFirstaddr;
		this.kLastaddr = kLastaddr;
		this.kDate = kDate;
	}

	public int getkNo() {
		return kNo;
	}

	public void setkNo(int kNo) {
		this.kNo = kNo;
	}

	public String getkName() {
		return kName;
	}

	public void setkName(String kName) {
		this.kName = kName;
	}

	public String getkAreacode() {
		return kAreacode;
	}

	public void setkAreacode(String kAreacode) {
		this.kAreacode = kAreacode;
	}

	public String getkDialing() {
		return kDialing;
	}

	public void setkDialing(String kDialing) {
		this.kDialing = kDialing;
	}

	public String getkTel() {
		return kTel;
	}

	public void setkTel(String kTel) {
		this.kTel = kTel;
	}

	public String getkZipcode() {
		return kZipcode;
	}

	public void setkZipcode(String kZipcode) {
		this.kZipcode = kZipcode;
	}

	public String getkFirstaddr() {
		return kFirstaddr;
	}

	public void setkFirstaddr(String kFirstaddr) {
		this.kFirstaddr = kFirstaddr;
	}

	public String getkLastaddr() {
		return kLastaddr;
	}

	public void setkLastaddr(String kLastaddr) {
		this.kLastaddr = kLastaddr;
	}

	public Date getkDate() {
		return kDate;
	}

	public void setkDate(Date kDate) {
		this.kDate = kDate;
	}

	@Override
	public String toString() {
		return "KindergartenVO [kNo=" + kNo + ", kName=" + kName + ", kAreacode=" + kAreacode + ", kDialing=" + kDialing
				+ ", kTel=" + kTel + ", kZipcode=" + kZipcode + ", kFirstaddr=" + kFirstaddr + ", kLastaddr="
				+ kLastaddr + ", kDate=" + kDate + "]";
	}
}
