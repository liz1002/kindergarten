package com.liz.domain;

public class ParentVO {
	private int pNo; //부모번호
	private int mNo; //회원번호
	private MemberVO mVo; //회원정보
	private KindergartenVO kVo; //유치원정보
	private ClassVO cVo; //반정보
	
	public ParentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ParentVO(int pNo, int mNo, KindergartenVO kVo, ClassVO cVo, MemberVO mVo) {
		super();
		this.pNo = pNo;
		this.mNo = mNo;
		this.kVo = kVo;
		this.cVo = cVo;
		this.mVo = mVo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public KindergartenVO getkVo() {
		return kVo;
	}

	public void setkVo(KindergartenVO kVo) {
		this.kVo = kVo;
	}

	public ClassVO getcVo() {
		return cVo;
	}

	public void setcVo(ClassVO cVo) {
		this.cVo = cVo;
	}

	public MemberVO getmVo() {
		return mVo;
	}

	public void setmVo(MemberVO mVo) {
		this.mVo = mVo;
	}

	@Override
	public String toString() {
		return "ParentVO [pNo=" + pNo + ", mNo=" + mNo + ", kVo=" + kVo + ", cVo=" + cVo + ", mVo=" + mVo + "]";
	}
}
