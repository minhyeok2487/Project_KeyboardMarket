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
			DataSource ds = (DataSource) context.lookup("java:comp/env/unKnown");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<NoticeDTO> list() {
		ArrayList<NoticeDTO> res = new ArrayList<NoticeDTO>();

		sql = "select * from notice order by noticeNo desc";

		try {
			ptmt = con.prepareStatement(sql);
//			ptmt.setInt(1, start);
//			ptmt.setInt(2, limit);
			rs = ptmt.executeQuery();

			while (rs.next()) {
				NoticeDTO dto = new NoticeDTO();

				dto.setNoticeNo(rs.getInt("noticeNo"));
				dto.setSubject(rs.getString("subject"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setHits(rs.getInt("hits"));
				System.out.println(dto);

				res.add(dto);
			}

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
