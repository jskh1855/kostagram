package model;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;



public class MemberDAO {



	private Connection conn;

	private ResultSet rs;



	public MemberDAO() {

		try {

			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";

			String user = "scott";

			String pass = "tiger";

			Class.forName("oracle.jdbc.OracleDriver");

			conn= DriverManager.getConnection(url, user, pass);
		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	

	public int login(String userID, String userPassword) {

		String SQL = "SELECT userPassword FROM MEMBER WHERE userID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				if(rs.getString(1).equals(userPassword))

					return 1; // 로그인 성공

				else

					return 0; // 비밀번호 틀림

			}

			return -1; // 아이디 없음

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return -2; // 데이터베이스 오류

	}

	

	public int join(MemberVO user) {

		String SQL = "INSERT INTO MEMBER VALUES (?, ?, ?, ?, 0)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user.getUserID());

			pstmt.setString(2, user.getUserPassword());

			pstmt.setString(3, user.getUserEmail());

			pstmt.setString(4, user.getUserEmailHash());

			return pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return -1; // 회원가입 실패

	}

	

	public String getUserEmail(String userID) {

		String SQL = "SELECT userEmail FROM MEMBER WHERE userID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				return rs.getString(1); // 이메일 주소 반환

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return null; // 데이터베이스 오류

	}

	

	public boolean getUserEmailChecked(String userID) {

		String SQL = "SELECT userEmailChecked FROM MEMBER WHERE userID = ?";
		int ans = 0;
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			rs = pstmt.executeQuery();

			while(rs.next()) {

				ans = rs.getInt(1); // 이메일 등록 여부 반환

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}

		if (ans == 1)
			return true;
		else
			return false;

	}

	

	public boolean setUserEmailChecked(String userID) {

		String SQL = "UPDATE MEMBER SET userEmailChecked = 1 WHERE userID = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);

			pstmt.executeUpdate();

			return true; // 이메일 등록 설정 성공

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return false; // 이메일 등록 설정 실패

	}

}