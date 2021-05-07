package model;

public class MemberVO {
	private String userID;
	private String userPassword;
	private String userEmail;
	private String userEmailHash;
	private int userEmailChecked;
	private String profileImage;
	private String profileContent;
	public MemberVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberVO(String userID, String userPassword, String userEmail, String userEmailHash, int userEmailChecked,
			String profileImage, String profileContent) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
		this.profileImage = profileImage;
		this.profileContent = profileContent;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
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
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
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
		return "MemberVO [userID=" + userID + ", userPassword=" + userPassword + ", userEmail=" + userEmail
				+ ", userEmailHash=" + userEmailHash + ", userEmailChecked=" + userEmailChecked + ", profileImage="
				+ profileImage + ", profileContent=" + profileContent + "]";
	}
	
	
}