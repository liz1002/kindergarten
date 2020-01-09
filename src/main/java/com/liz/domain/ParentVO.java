package com.liz.domain;

public class ParentVO {
	private MemberVO mVo; //학부모 회원 정보
	private ChildrenVO chVo; //원아 정보
	
	public ParentVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ParentVO(MemberVO mVo, ChildrenVO chVo) {
		super();
		this.mVo = mVo;
		this.chVo = chVo;
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

	@Override
	public String toString() {
		return "ParentVO [mVo=" + mVo + ", chVo=" + chVo + "]";
	}
}
