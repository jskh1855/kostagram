package model;

public class LikesVO {
	private String no;
	private String email;
	public LikesVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikesVO(String no, String email) {
		super();
		this.no = no;
		this.email = email;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "LikesVO [no=" + no + ", email=" + email + "]";
	}
	
	

}
