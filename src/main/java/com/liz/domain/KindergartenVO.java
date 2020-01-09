package com.liz.domain;

public class KindergartenVO {
	private int kNo; //유치원번호
	private String kCode; //유치원코드
	private String kName; //유치원이름
	private String kTel; //유치원전화번호
	private String kAddress; //유치원주소
	
	public KindergartenVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public KindergartenVO(int kNo, String kCode, String kName, String kTel, String kAddress) {
		super();
		this.kNo = kNo;
		this.kCode = kCode;
		this.kName = kName;
		this.kTel = kTel;
		this.kAddress = kAddress;
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

	@Override
	public String toString() {
		return "KindergartenVO [kNo=" + kNo + ", kCode=" + kCode + ", kName=" + kName + ", kTel=" + kTel + ", kAddress="
				+ kAddress + "]";
	}
}
