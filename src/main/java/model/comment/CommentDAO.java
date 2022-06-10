package model.comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDAO {

	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;

	public CommentDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/qazxsw");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<CommentDTO> list(int start, int limit) {
		
		ArrayList<CommentDTO> res = new ArrayList<CommentDTO>();

		sql = "select * from comment order by commentNo";

		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();

			while (rs.next()) {
				CommentDTO dto = new CommentDTO();

				dto.setCommentNo(rs.getInt("commentNo"));
				dto.setSubject(rs.getString("subject"));
				dto.setComment(rs.getString("comment"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPname(rs.getString("pname"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setQnaNo(rs.getInt("qnaNo"));
				dto.setMemberNo(rs.getInt("memberNo"));
				res.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return res;

	}
	

	public CommentDTO detail(int no) {

		CommentDTO dto = null;

		sql = "select * from comment where commentNo = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, no);
			rs = ptmt.executeQuery();

			while (rs.next()) {
				dto = new CommentDTO();

				dto.setCommentNo(rs.getInt("commentNo"));
				dto.setSubject(rs.getString("subject"));
				dto.setComment(rs.getString("comment"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setPname(rs.getString("pname"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setQnaNo(rs.getInt("qnaNo"));
				dto.setMemberNo(rs.getInt("memberNo"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return dto;

	}

	public void insert(CommentDTO dto) {

		sql = "insert into comment(subject, comment, user_id, pname, reg_date, qnaNo, memberNo) values (?, ?, ?, ?, now(), ?, ?)";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.subject);
			ptmt.setString(2, dto.comment);
			ptmt.setString(3, dto.user_id);
			ptmt.setString(4, dto.pname);
			ptmt.setInt(5, dto.qnaNo);
			ptmt.setInt(6, dto.memberNo);
			ptmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public int modify(CommentDTO dto) {

		int res = 0;

		sql = "update comment set subject = ?, comment = ?, reg_date = now() where commentNo = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.subject);
			ptmt.setString(2, dto.comment);
			ptmt.setInt(3, dto.commentNo);

			res = ptmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return res;

	}

	public int postCount() {

		sql = "select count(*) from comment";

		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();

			rs.next();

			return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return 0;
	}

	public void close() {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException e) {
			}
		if (ptmt != null)
			try {
				ptmt.close();
			} catch (SQLException e) {
			}
		if (con != null)
			try {
				con.close();
			} catch (SQLException e) {
			}

	}

}