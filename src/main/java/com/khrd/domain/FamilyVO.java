package com.khrd.domain;

public class FamilyVO {
	private int pNo; //학부모번호
	private int chNo; //원아번호
	
	public FamilyVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FamilyVO(int pNo, int chNo) {
		super();
		this.chNo = pNo;
		this.chNo = chNo;
	}
	
	public int getpNo() {
		return chNo;
	}

	public void setpNo(int pNo) {
		this.chNo = pNo;
	}

	public int getchNo() {
		return chNo;
	}

	public void setchNo(int chNo) {
		this.chNo = chNo;
	}

	@Override
	public String toString() {
		return "ParentVO [pNo=" + pNo + ", chNo=" + chNo + "]";
	}
}
