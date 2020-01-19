package com.liz.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberVO {
	private int mNo; //회원번호
	private int mType; //회원타입
	private String mId; //아이디
	private String mPwd; //비밀번호
	private String mName; //회원이름
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mRegdate; //생년월일
	private String mFirsttel; //회원앞번호
	private String mMiddletel; //회원중간번호
	private String mLasttel; //회원뒷번호
	private int mUse; //탈퇴여부
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(int mNo, int mType, String mId, String mPwd, String mName, Date mRegdate, String mFirsttel,
			String mMiddletel, String mLasttel, int mUse) {
		super();
		this.mNo = mNo;
		this.mType = mType;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mRegdate = mRegdate;
		this.mFirsttel = mFirsttel;
		this.mMiddletel = mMiddletel;
		this.mLasttel = mLasttel;
		this.mUse = mUse;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getmType() {
		return mType;
	}

	public void setmType(int mType) {
		this.mType = mType;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public Date getmRegdate() {
		return mRegdate;
	}

	public void setmRegdate(Date mRegdate) {
		this.mRegdate = mRegdate;
	}

	public String getmFirsttel() {
		return mFirsttel;
	}

	public void setmFirsttel(String mFirsttel) {
		this.mFirsttel = mFirsttel;
	}

	public String getmMiddletel() {
		return mMiddletel;
	}

	public void setmMiddletel(String mMiddletel) {
		this.mMiddletel = mMiddletel;
	}

	public String getmLasttel() {
		return mLasttel;
	}

	public void setmLasttel(String mLasttel) {
		this.mLasttel = mLasttel;
	}

	public int getmUse() {
		return mUse;
	}

	public void setmUse(int mUse) {
		this.mUse = mUse;
	}

	@Override
	public String toString() {
		return "MemberVO [mNo=" + mNo + ", mType=" + mType + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName
				+ ", mRegdate=" + mRegdate + ", mFirsttel=" + mFirsttel + ", mMiddletel=" + mMiddletel + ", mLasttel="
				+ mLasttel + ", mUse=" + mUse + "]";
	}
}
