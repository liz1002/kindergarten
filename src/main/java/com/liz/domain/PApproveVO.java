package com.liz.domain;

public class PApproveVO {
	private MemberVO mVo; //회원 정보
	private ChildrenVO chVo; //원아 정보
	private String pNickname; //학부모 별명
	
	public PApproveVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PApproveVO(MemberVO mVo, ChildrenVO chVo, String pNickname) {
		super();
		this.mVo = mVo;
		this.chVo = chVo;
		this.pNickname = pNickname;
	}

	public MemberVO getmVo() {
		return mVo;
	}

	public void setmVo(MemberVO mVo) {
		this.mVo = mVo;
	}

	public ChildrenVO getChVo() {
		return chVo;
	}

	public void setChVo(ChildrenVO chVo) {
		this.chVo = chVo;
	}

	public String getpNickname() {
		return pNickname;
	}
	
	public void setpNickname(String pNickname) {
		this.pNickname = pNickname;
	}
	
	@Override
	public String toString() {
		return "PApproveVO [mVo=" + mVo + ", chVo=" + chVo + ", pNickname=" + pNickname + "]";
	}
}
