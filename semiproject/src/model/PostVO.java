package model;

import java.util.ArrayList;

public class PostVO {
	private String no;  // 포스팅 번호
	private String post_image;
	private String content;
	private int hits;
	private String regdate;
	private MemberVO mvo;
	private ArrayList<LikesVO> likesList;
	public PostVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PostVO(String no, String title, String content, int hits, String regdate, MemberVO mvo,
			ArrayList<LikesVO> likesList) {
		super();
		this.no = no;
		this.post_image = post_image;
		this.content = content;
		this.hits = hits;
		this.regdate = regdate;
		this.mvo = mvo;
		this.likesList = likesList;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getTitle() {
		return post_image;
	}
	public void setTitle(String title) {
		this.post_image = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
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
	public ArrayList<LikesVO> getLikesList() {
		return likesList;
	}
	public void setLikesList(ArrayList<LikesVO> likesList) {
		this.likesList = likesList;
	}
	@Override
	public String toString() {
		return "PostVO [no=" + no + ", post_image=" + post_image + ", content=" + content + ", hits=" + hits + ", regdate="
				+ regdate + ", mvo=" + mvo + ", likesList=" + likesList + "]";
	}
	
	
}
