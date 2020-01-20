package com.liz.domain;

public class TApproveVO {
	private MemberVO mVo; //회원 정보
	private ClassVO cVo; //반 정보
	private String tNickname; //별명
	
	public TApproveVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TApproveVO(MemberVO mVo, ClassVO cVo, String tNickname) {
		super();
		this.mVo = mVo;
		this.cVo = cVo;
		this.tNickname = tNickname;
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

	public String gettNickname() {
		return tNickname;
	}

	public void settNickname(String tNickname) {
		this.tNickname = tNickname;
	}

	@Override
	public String toString() {
		return "TApproveVO [mVo=" + mVo + ", cVo=" + cVo + ", tNickname=" + tNickname + "]";
	}
}
