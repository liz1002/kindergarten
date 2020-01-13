package com.liz.domain;

public class FamilyVO {
	private ParentVO pVo; //학부모 회원 정보
	private ChildrenVO chVo; //원아 정보
	
	public FamilyVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FamilyVO(ParentVO pVo, ChildrenVO chVo) {
		super();
		this.pVo = pVo;
		this.chVo = chVo;
	}

	public ParentVO getpVo() {
		return pVo;
	}

	public void setpVo(ParentVO pVo) {
		this.pVo = pVo;
	}

	public ChildrenVO getChVo() {
		return chVo;
	}

	public void setChVo(ChildrenVO chVo) {
		this.chVo = chVo;
	}

	@Override
	public String toString() {
		return "FamilyVO [pVo=" + pVo + ", chVo=" + chVo + "]";
	}
}
