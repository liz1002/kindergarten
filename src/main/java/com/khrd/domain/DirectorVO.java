package com.khrd.domain;

public class DirectorVO {
	private int dNo; //원장번호
	private MemberVO mVo; //회원정보
	private KindergartenVO kVo; //유치원정보
	
	public DirectorVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public DirectorVO(int dNo, MemberVO mVo, KindergartenVO kVo) {
		super();
		this.dNo = dNo;
		this.mVo = mVo;
		this.kVo = kVo;
	}

	public int getdNo() {
		return dNo;
	}

	public void setdNo(int dNo) {
		this.dNo = dNo;
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
		return "DirectorVO [dNo=" + dNo + ", mVo=" + mVo + ", kVo=" + kVo + "]";
	}
}
