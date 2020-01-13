package com.liz.domain;

public class ParentVO {
	private int pNo; //학부모 번호
	private MemberVO mVo; //학부모 회원 정보
	private KindergartenVO kVo; //유치원 정보
	
	public ParentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ParentVO(int pNo, MemberVO mVo, KindergartenVO kVo) {
		super();
		this.pNo = pNo;
		this.mVo = mVo;
		this.kVo = kVo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public MemberVO getmVo() {
		return mVo;
	}

	public void setmVo(MemberVO mVo) {
		this.mVo = mVo;
	}

	public KindergartenVO getkVo() {
		return kVo;
	}

	public void setkVo(KindergartenVO kVo) {
		this.kVo = kVo;
	}

	@Override
	public String toString() {
		return "ParentVO [pNo=" + pNo + ", mVo=" + mVo + ", kVo=" + kVo + "]";
	}
}
