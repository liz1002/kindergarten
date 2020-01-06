package com.khrd.domain;

public class DirectorVO {
	private int dNo; //원장번호
	private int mNo; //회원번호
	private int kNo; //유치원번호
	
	public DirectorVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DirectorVO(int dNo, int mNo, int kNo) {
		super();
		this.dNo = dNo;
		this.mNo = mNo;
		this.kNo = kNo;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
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

	@Override
	public String toString() {
		return "DirectorVO [dNo=" + dNo + ", mNo=" + mNo + ", kNo=" + kNo + "]";
	}
}
