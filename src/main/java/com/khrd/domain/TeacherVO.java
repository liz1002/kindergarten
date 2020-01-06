package com.khrd.domain;

public class TeacherVO {
	private int tNo; //교사번호
	private int tType; //교사타입
	private int mNo; //회원번호
	private int kNo; //유치원번호
	private int cNo; //반번호	
	
	public TeacherVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TeacherVO(int tNo, int tType, int mNo, int kNo, int cNo) {
		super();
		this.tNo = tNo;
		this.tType = tType;
		this.mNo = mNo;
		this.kNo = kNo;
		this.cNo = cNo;
	}

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public int gettType() {
		return tType;
	}

	public void settType(int tType) {
		this.tType = tType;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
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
		return "TeacherVO [tNo=" + tNo + ", tType=" + tType + ", mNo=" + mNo + ", kNo=" + kNo + ", cNo=" + cNo + "]";
	}
}
