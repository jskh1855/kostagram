package model;

import java.util.ArrayList;

public class PostVO {
	private String no;  // 포스팅 번호
	private String postImage;
	private String content;
	private String regdate;
	private MemberVO mvo;
	private int likeCount;
	public PostVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostVO(String no, String postImage, String content, String regdate, MemberVO mvo) {
		super();
		this.no = no;
		this.postImage = postImage;
		this.content = content;
		this.regdate = regdate;
		this.mvo = mvo;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getPostImage() {
		return postImage;
	}
	public void setPostImage(String postImage) {
		this.postImage = postImage;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	public void setLikeCount(int like) {
		this.likeCount = like;
	}
	public int getLikeCount() {
		return likeCount;
	}
	@Override
	public String toString() {
		return "PostVO [no=" + no + ", postImage=" + postImage + ", content=" + content + ", regdate=" + regdate
				+ ", mvo=" + mvo + "]";
	}
	
	
}
