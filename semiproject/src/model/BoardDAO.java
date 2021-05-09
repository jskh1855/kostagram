package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class BoardDAO {
	private static BoardDAO dao = new BoardDAO();
	private DataSource dataSource;

	private BoardDAO() {
		dataSource = DataSourceManager.getInstance().getDataSource();
	}

	public static BoardDAO getInstance() {
		return dao;
	}

	public Connection getConnection() throws SQLException {
		return dataSource.getConnection();
	}

	public void closeAll(PreparedStatement pstmt, Connection con) throws SQLException {
		if (pstmt != null)
			pstmt.close();
		if (con != null)
			con.close();
	}

	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection con) throws SQLException {
		if (rs != null)
			rs.close();
		closeAll(pstmt, con);
	}

	/**
	 * 전체 리스트 출력 // home.jsp 시간순? or 게시글 no순 LIST SQL -> Test 후 반영하세요 SELECT
	 * b.no,b.title,b.hits,to_char(time_posted,'YYYY.MM.DD') as time_posted,m.name
	 * FROM board b , board_member m WHERE b.id=m.id order by no desc
	 * 
	 * @param pageNo
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<PostVO> getPostingTotalList() throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			/*
			 * sql.
			 * append("SELECT b.no,b.title,b.hits,to_char(time_posted,'YYYY.MM.DD') as time_posted,m.name "
			 * ); sql.append("FROM board b , board_member m ");
			 * sql.append("WHERE b.id=m.id "); sql.append("order by no desc");
			 */
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			// 목록에서 게시물 content는 필요없으므로 null로 setting
			// select no,title,time_posted,hits,id,name
			while (rs.next()) {
				PostVO pvo = new PostVO();
				MemberVO mvo = new MemberVO();

				list.add(pvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 좋아요 top3 리턴 LIST SQL -> Test 후 반영하세요 SELECT
	 * b.no,b.title,b.hits,to_char(time_posted,'YYYY.MM.DD') as time_posted,m.name
	 * FROM board b , board_member m WHERE b.id=m.id order by no desc
	 * 
	 * @param pageNo
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<PostVO> getPostingTop3List() throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			/*
			 * sql.
			 * append("SELECT b.no,b.title,b.hits,to_char(time_posted,'YYYY.MM.DD') as time_posted,m.name "
			 * ); sql.append("FROM board b , board_member m ");
			 * sql.append("WHERE b.id=m.id "); sql.append("order by no desc");
			 */
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			// 목록에서 게시물 content는 필요없으므로 null로 setting
			// select no,title,time_posted,hits,id,name
			while (rs.next()) {
				PostVO pvo = new PostVO();
				MemberVO mvo = new MemberVO();

				list.add(pvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 개인 프로필 포스팅 보기
	 * 
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<PostVO> getPostingListByUser(String email) throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			/*
			 * sql.
			 * append("SELECT b.no,b.title,b.hits,to_char(time_posted,'YYYY.MM.DD') as time_posted,m.name "
			 * ); sql.append("FROM board b , board_member m ");
			 * sql.append("WHERE b.id=m.id "); sql.append("order by no desc");
			 */
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			// 목록에서 게시물 content는 필요없으므로 null로 setting
			// select no,title,time_posted,hits,id,name
			while (rs.next()) {
				PostVO pvo = new PostVO();
				MemberVO mvo = new MemberVO();

				list.add(pvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 포스팅 상세보기 ?
	 * 
	 * @param no
	 * @return
	 * @throws SQLException
	 */
	/*
	 * public PostVO getPostingByNo(String no) throws SQLException{ PostVO pvo=null;
	 * Connection con=null; PreparedStatement pstmt=null; ResultSet rs=null; try{
	 * con=getConnection(); StringBuilder sql=new StringBuilder();
	 * 
	 * sql.
	 * append("select b.title,to_char(b.time_posted,'YYYY.MM.DD  HH24:MI:SS') as time_posted"
	 * ); sql.append(",b.content,b.hits,b.id,m.name");
	 * sql.append(" from board b,board_member m");
	 * sql.append(" where b.id=m.id and b.no=?");
	 * 
	 * pstmt=con.prepareStatement(sql.toString()); pstmt.setString(1, no);
	 * rs=pstmt.executeQuery(); if(rs.next()){ pvo=new PostVO(); MemberVO mvo=new
	 * MemberVO(); } }finally{ closeAll(rs,pstmt,con); } return pvo; }
	 */
	/**
	 * 조회수 증가
	 * 
	 * @param no
	 * @throws SQLException
	 */
/*	public void updateHit(String no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update board set hits=hits+1 where no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, no);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}
*/
	/**
	 * 게시물 등록 메서드 게시물 등록 후 생성된 시퀀스를 BoardVO에 setting 한다. insert into
	 * board(no,title,content,id,time_posted)
	 * values(board_seq.nextval,?,?,?,sysdate)
	 * 
	 * @param vo
	 * @throws SQLException
	 */
	public void posting(PostVO vo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into k_board(no, post_image, content, hits, time_posted, user_email) ");
			sql.append("values(k_seq.nextval,?, ?, 0, sysdate, ?)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getMvo().getUserName());
			pstmt.executeUpdate();
			pstmt.close();
			pstmt = con.prepareStatement("select k_seq.currval from dual");
			rs = pstmt.executeQuery();
			if (rs.next())
				vo.setNo(rs.getString(1));
		} finally {
			closeAll(rs, pstmt, con);
		}
	}

	/**
	 * 글번호에 해당하는 포스팅 삭제하는 메서드
	 * 
	 * @param no
	 * @throws SQLException
	 */
	public void deletePosting(String no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("delete from k_board where no=?");
			pstmt.setString(1, no);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	/**
	 * 포스팅 정보 업데이트하는 메서드 (2차)
	 * 
	 * @param vo
	 * @throws SQLException
	 */

}
