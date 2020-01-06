package com.khrd.domain;

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
	private String mTel; //휴대폰번호
	private String mNickname; //닉네임
	
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberVO(int mNo, int mType, String mId, String mPwd, String mName, Date mRegdate, String mTel,
			String mNickname) {
		super();
		this.mNo = mNo;
		this.mType = mType;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.mRegdate = mRegdate;
		this.mTel = mTel;
		this.mNickname = mNickname;
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

	public String getmTel() {
		return mTel;
	}

	public void setmTel(String mTel) {
		this.mTel = mTel;
	}

	public String getmNickname() {
		return mNickname;
	}

	public void setmNickname(String mNickname) {
		this.mNickname = mNickname;
	}

	@Override
	public String toString() {
		return "MemberVO [mNo=" + mNo + ", mType=" + mType + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName
				+ ", mRegdate=" + mRegdate + ", mTel=" + mTel + ", mNickname=" + mNickname + "]";
	}
}
