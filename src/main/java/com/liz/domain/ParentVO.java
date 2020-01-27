package com.liz.domain;

public class ParentVO {
	private int pNo; //학부모 번호
	private String pNickname; //학부모 별명
	private MemberVO mVo; //학부모 회원 정보
	private ChildrenVO chVo; //원아 정보
	private int pMain; //대표여부
	
	public ParentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ParentVO(int pNo, String pNickname, MemberVO mVo, ChildrenVO chVo, int pMain) {
		super();
		this.pNo = pNo;
		this.pNickname = pNickname;
		this.mVo = mVo;
		this.chVo = chVo;
		this.pMain = pMain;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public String getpNickname() {
		return pNickname;
	}

	public void setpNickname(String pNickname) {
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

	public int getpMain() {
		return pMain;
	}
	
	public void setpMain(int pMain) {
		this.pMain = pMain;
	}
	
	@Override
	public String toString() {
		return "ParentVO [pNo=" + pNo + ", pNickname=" + pNickname + ", mVo=" + mVo + ", chVo=" + chVo + ", pMain="
				+ pMain + "]";
	}
}
