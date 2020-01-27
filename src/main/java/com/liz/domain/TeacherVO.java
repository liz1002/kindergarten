package com.liz.domain;

public class TeacherVO {
	private int tNo; //교사번호
	private int tType; //교사타입
	private String tNickname; //교사별명
	private MemberVO mVo; //회원정보
	private KindergartenVO kVo; //유치원정보
	private ClassVO cVo; //반정보
	private int tMain; //대표여부
	
	public TeacherVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TeacherVO(int tNo, int tType, String tNickname, MemberVO mVo, KindergartenVO kVo, ClassVO cVo, int tMain) {
		super();
		this.tNo = tNo;
		this.tType = tType;
		this.tNickname = tNickname;
		this.mVo = mVo;
		this.kVo = kVo;
		this.cVo = cVo;
		this.tMain = tMain;
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

	public String gettNickname() {
		return tNickname;
	}

	public void settNickname(String tNickname) {
		this.tNickname = tNickname;
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

	public ClassVO getcVo() {
		return cVo;
	}

	public void setcVo(ClassVO cVo) {
		this.cVo = cVo;
	}
	
	public int gettMain() {
		return tMain;
	}

	public void settMain(int tMain) {
		this.tMain = tMain;
	}

	@Override
	public String toString() {
		return "TeacherVO [tNo=" + tNo + ", tType=" + tType + ", tNickname=" + tNickname + ", mVo=" + mVo + ", kVo="
				+ kVo + ", cVo=" + cVo + ", tMain=" + tMain + "]";
	}	
}

