package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;


import controller.DataSourceManager;


public class MemberDAO {

	private static MemberDAO dao=new MemberDAO();
	private DataSource dataSource;
	
	private MemberDAO(){
		dataSource=DataSourceManager.getInstance().getDataSource();
	}
	
	public static MemberDAO getInstance(){		
		return dao;
	}
	
	public void closeAll(PreparedStatement pstmt,
			Connection con) throws SQLException{
		closeAll(null,pstmt,con);
	}
	
	public void closeAll(ResultSet rs,PreparedStatement pstmt,
			Connection con) throws SQLException{
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(con!=null)
			con.close();
	}
	
	public MemberVO login(String id,String password) throws SQLException{
		MemberVO vo=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try{
			con=dataSource.getConnection();
			String sql="select name from board_member where email=? and password=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()){
				vo=new MemberVO();
			}
		}finally{
			closeAll(rs, pstmt,con);
		}
		return vo;
	}

	public void register(String email, String password, String name) throws SQLException {
		Connection con=null;
		PreparedStatement pstmt=null;
		try{
			con=dataSource.getConnection();
			StringBuilder sql=new StringBuilder();		
			sql.append("INSERT INTO board(email,password,name) ");
			sql.append("values(?,?,?) ");
			sql.append("WHERE b.id=m.id ");	
			sql.append("order by no desc");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.executeUpdate();
		}finally{
			closeAll(pstmt,con);
		}
	}

}