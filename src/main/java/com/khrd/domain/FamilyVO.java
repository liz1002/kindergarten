package com.khrd.domain;

public class FamilyVO {
	private ParentVO pVo; //학부모번호
	private ChildrenVO chVo; //원아번호
	
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
