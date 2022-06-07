package model.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class NoticeDAO {

	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;

	public NoticeDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource) context.lookup("java:comp/env/qazxsw");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<NoticeDTO> list() {
		ArrayList<NoticeDTO> res = new ArrayList<NoticeDTO>();

		sql = "select * from notice where status = ? order by noticeNo desc";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, "게시");
			rs = ptmt.executeQuery();

			while (rs.next()) {
				NoticeDTO dto = new NoticeDTO();

				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSubject(rs.getString("subject"));
				dto.setPname(rs.getString("pname"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setHits(rs.getInt("hits"));
				res.add(dto);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return res;

	}

	public NoticeDTO detail(int no) {

		NoticeDTO dto = null;

		sql = "select * from notice where noticeNo = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, no);
			rs = ptmt.executeQuery();

			while (rs.next()) {
				dto = new NoticeDTO();

				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSubject(rs.getString("subject"));
				dto.setPname(rs.getString("pname"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setHits(rs.getInt("hits"));
				dto.setUpfile(rs.getString("upfile"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return dto;

	}

	public void insert(NoticeDTO dto) {

		sql = "insert into notice(subject, pname, content, upfile, hits, reg_date) values (?, ?, ?, ?, 0, now())";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.subject);
			ptmt.setString(2, dto.pname);
			ptmt.setString(3, dto.content);
			ptmt.setString(4, dto.upfile);
			ptmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public int modify(NoticeDTO dto) {

		int res = 0;

		sql = "update notice set subject = ?, content = ?, reg_date = now() where noticeNo = ?";

		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.subject);
			ptmt.setString(2, dto.content);
			ptmt.setInt(3, dto.noticeNo);

			res = ptmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return res;

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