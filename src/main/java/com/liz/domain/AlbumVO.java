package com.liz.domain;

public class AlbumVO {
	private int aNo; //앨범 번호
	private String aFile; //사진
	private String aComent; //내용
	private TeacherVO tVo; //교사 정보
	
	public AlbumVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AlbumVO(int aNo, String aFile, String aComent, TeacherVO tVo) {
		super();
		this.aNo = aNo;
		this.aFile = aFile;
		this.aComent = aComent;
		this.tVo = tVo;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getaFile() {
		return aFile;
	}

	public void setaFile(String aFile) {
		this.aFile = aFile;
	}

	public String getaComent() {
		return aComent;
	}

	public void setaComent(String aComent) {
		this.aComent = aComent;
	}

	public TeacherVO gettVo() {
		return tVo;
	}

	public void settVo(TeacherVO tVo) {
		this.tVo = tVo;
	}

	@Override
	public String toString() {
		return "AlbumVO [aNo=" + aNo + ", aFile=" + aFile + ", aComent=" + aComent + ", tVo=" + tVo + "]";
	}	
}