package com.liz.domain;

public class TeacherVO {
	private int tNo; //교사번호
	private int tType; //교사타입
	private MemberVO mVo; //회원정보
	private KindergartenVO kVo; //유치원정보
	private ClassVO cVo; //반정보
	
	
	public TeacherVO() {
		super();
		// TODO Auto-generated constructor stub
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


	public KindergartenVO getkVo() {
		return kVo;
	}


	public void setkVo(KindergartenVO kVo) {
		this.kVo = kVo;
	}


	public MemberVO getmVo() {
		return mVo;
	}


	public void setmVo(MemberVO mVo) {
		this.mVo = mVo;
	}


	public ClassVO getcVo() {
		return cVo;
	}


	public void setcVo(ClassVO cVo) {
		this.cVo = cVo;
	}

	@Override
	public String toString() {
		return "TeacherVO [tNo=" + tNo + ", tType=" + tType + ", kVo=" + kVo + ", mVo=" + mVo + ", cVo=" + cVo + "]";
	}
}
