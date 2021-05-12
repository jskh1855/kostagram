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
	 * 전체 리스트 출력 // home.jsp 시간순? or 게시글 no순
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

			sql.append("select b.no, b.post_image, b.content, to_char(b.time_posted,'MM.DD'), m.user_name,  m.profile_image, m.user_email ");
			sql.append("from K_BOARD b, K_MEMBER m ");
			sql.append("where b.user_email = m.user_email ");
			sql.append("order by no desc");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostVO pvo = new PostVO();
				pvo.setNo(rs.getString(1));
				pvo.setPostImage(rs.getString(2));
				pvo.setContent(rs.getString(3));
				pvo.setRegdate(rs.getString(4));

				MemberVO mvo = new MemberVO();
				mvo.setUserName(rs.getString(5));
				mvo.setProfileImage(rs.getString(6));
				mvo.setUserEmail(rs.getString(7));
				pvo.setMvo(mvo);

				list.add(pvo);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 좋아요 체크 로그인한 유저가 해당 게시글에 좋아요를 표시했는가?
	 * 
	 */
	public int likeCheck(String no, String user_email) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int likeCKRetrun = 0;
		System.out.println(no + user_email);
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT count(*) ");
			sql.append("FROM k_likes ");
			sql.append("WHERE no=? and user_email=? ");

			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, no);
			pstmt.setString(2, user_email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				likeCKRetrun = rs.getInt(1);
				System.out.println(likeCKRetrun);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return likeCKRetrun;
	}

	/**
	 * 좋아요 top3 리턴 LIST SQL -> Test 후 반영하세요 SELECT ROWNUM, A.* FROM ( SELECT
	 * COUNT(T2.NO) AS LIKE_NUM , T1.TITLE FROM K_BOARD T1 LEFT JOIN K_LIKES T2 ON
	 * T1.NO = T2.NO GROUP BY T2.NO , T1.TITLE ORDER BY LIKE_NUM DESC ) A WHERE
	 * ROWNUM <= 3 ;
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

			sql.append("select rownum, A.* ");
			sql.append(
					"from ( select count(t2.no) as like_sum, t1.no, t1.post_image,"
					+ "t1.content, to_char(t1.time_posted,'MM.DD')AS UPLOAD_DATE,t1.user_email,(SELECT user_name FROM k_member WHERE user_email=t1.user_email) as USER_NAME,  ");
			sql.append("(SELECT profile_image FROM k_member WHERE user_email=t1.user_email) as USER_IMAGE ");
			sql.append("from k_board t1 ");
			sql.append("left join k_likes t2 ");
			sql.append("on t1.no = t2.no ");
			sql.append(
					"group by t2.no, t1.no, t1.post_image,t1.content, to_char(t1.time_posted,'MM.DD'),t1.user_email ");
			sql.append("order by like_sum desc) A ");
			sql.append("where rownum <=3 ");

			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				PostVO pvo = new PostVO();
				pvo.setNo(rs.getString(3));
				pvo.setPostImage(rs.getString(4));
				pvo.setContent(rs.getString(5));
				pvo.setRegdate(rs.getString(6));

				MemberVO mvo = new MemberVO();
				mvo.setUserEmail(rs.getString(7));
				mvo.setUserName(rs.getString(8));
				mvo.setProfileImage(rs.getString(9));
				pvo.setMvo(mvo);

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
	public ArrayList<PostVO> getPostingListByUser(String user_email) throws SQLException {
		ArrayList<PostVO> list = new ArrayList<PostVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT no, post_image, content, to_char(time_posted,'MM.DD')  ");
			sql.append("FROM k_board  ");
			sql.append("WHERE user_email=?  ");
			sql.append("ORDER BY time_posted DESC  ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PostVO pvo = new PostVO();
				pvo.setNo(rs.getString(1));
				pvo.setPostImage(rs.getString(2));
				pvo.setContent(rs.getString(3));
				pvo.setRegdate(rs.getString(4));
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
	public PostVO getPostingByNo(String no) throws SQLException {
		PostVO pvo = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			StringBuilder sql = new StringBuilder();
			/*
			 * sql.
			 * append("select b.title,to_char(b.time_posted,'YYYY.MM.DD  HH24:MI:SS') as time_posted"
			 * ); sql.append(",b.content,b.hits,b.id,m.name");
			 * sql.append(" from board b,board_member m");
			 * sql.append(" where b.id=m.id and b.no=?");
			 */
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pvo = new PostVO();
				MemberVO mvo = new MemberVO();
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return pvo;
	}

	/**
	 * 조회수 증가
	 * 
	 * @param no
	 * @throws SQLException
	 */
	public void updateHit(String no) throws SQLException {
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
			sql.append("insert into k_board(no,post_image,content,user_email,time_posted) ");
			sql.append("values(k_seq.nextval,?,?,?,sysdate)");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, vo.getPostImage());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getMvo().getUserEmail());
			pstmt.executeUpdate();
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

	public ArrayList<String> listLikes(String email) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<String> list = new ArrayList<String>();
		try {
			con = getConnection();
			pstmt = con.prepareStatement("SELECT no FROM k_likes WHERE user_email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString(1));
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return list;
	}

	public int countLikes(String no) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int likes = 0;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("SELECT COUNT(*) FROM k_likes WHERE no = ?");
			pstmt.setString(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				likes = rs.getInt(1);
			}
		} finally {
			closeAll(rs, pstmt, con);
		}
		return likes;
	}

	public void insertLike(String no, String email) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("INSERT INTO k_likes(no,user_email) VALUES(?,?)");
			pstmt.setString(1, no);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

	public void deleteLike(String no, String email) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			pstmt = con.prepareStatement("DELETE FROM k_likes WHERE no=? and user_email=?");
			pstmt.setString(1, no);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
		} finally {
			closeAll(pstmt, con);
		}
	}

}
