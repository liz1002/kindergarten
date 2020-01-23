package com.liz.domain;

public class ClassVO {
	private int cNo; //반번호
	private String cName; //반이름
	private KindergartenVO kVo; //유치원 정보
	private int cUse; //삭제여부
	
	public ClassVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ClassVO(int cNo, String cName, KindergartenVO kVo, int cUse) {
		super();
		this.cNo = cNo;
		this.cName = cName;
		this.kVo = kVo;
		this.cUse = cUse;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public KindergartenVO getkVo() {
		return kVo;
	}

	public void setkVo(KindergartenVO kVo) {
		this.kVo = kVo;
	}

	public int getcUse() {
		return cUse;
	}

	public void setcUse(int cUse) {
		this.cUse = cUse;
	}

	@Override
	public String toString() {
		return "ClassVO [cNo=" + cNo + ", cName=" + cName + ", kVo=" + kVo + ", cUse=" + cUse + "]";
	}
}
