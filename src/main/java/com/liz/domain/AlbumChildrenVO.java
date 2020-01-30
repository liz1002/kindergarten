package com.liz.domain;

public class AlbumChildrenVO {
	private ChildrenVO chVo; //원아 정보
	private AlbumVO aVo; //앨범 정보
	
	public AlbumChildrenVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AlbumChildrenVO(ChildrenVO chVo, AlbumVO aVo) {
		super();
		this.chVo = chVo;
		this.aVo = aVo;
	}

	public ChildrenVO getChVo() {
		return chVo;
	}

	public void setChVo(ChildrenVO chVo) {
		this.chVo = chVo;
	}

	public AlbumVO getaVo() {
		return aVo;
	}

	public void setaVo(AlbumVO aVo) {
		this.aVo = aVo;
	}

	@Override
	public String toString() {
		return "AlbumChildrenVO [chVo=" + chVo + ", aVo=" + aVo + "]";
	}
}