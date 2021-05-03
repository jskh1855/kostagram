package model;

public class MemberVO {
	private String userID;

	private String userPassword;

	private String userEmail;

	private String userEmailHash;

	private int userEmailChecked;

	

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

	public boolean isUserEmailChecked() {
		if (userEmailChecked == 0)
			return false;
		return true;

	}

	public void setUserEmailChecked(int userEmailChecked) {

		this.userEmailChecked = userEmailChecked;

	}

	

	public MemberVO(String userID, String userPassword, String userEmail,

			String userEmailHash, int userEmailChecked) {

		this.userID = userID;

		this.userPassword = userPassword;

		this.userEmail = userEmail;

		this.userEmailHash = userEmailHash;

		this.userEmailChecked = userEmailChecked;

	}

}
