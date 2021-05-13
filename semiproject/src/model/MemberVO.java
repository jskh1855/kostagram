package model;

public class MemberVO {
	private String userName;
	private String userPassword;
	private String userEmail;
	private int userEmailChecked;
	private String profileImage = "";
	private String profileContent = "내용 없음";
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String userName, String userPassword, String userEmail,int userEmailChecked) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userEmailChecked = userEmailChecked;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public int getUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(int userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getProfileContent() {
		return profileContent;
	}
	public void setProfileContent(String profileContent) {
		this.profileContent = profileContent;
	}
	@Override
	public String toString() {
		return "MemberVO [userName=" + userName + ", userPassword=" + userPassword + ", userEmail=" + userEmail
				+  ", userEmailChecked=" + userEmailChecked + ", profileImage="
				+ profileImage + ", profileContent=" + profileContent + "]";
	}
	
	
}