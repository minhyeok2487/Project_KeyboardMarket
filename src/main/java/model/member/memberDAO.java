package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	Connection con;
	PreparedStatement ptmt; // 보안적용
	ResultSet rs;
	String sql;
	
	public memberDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/qazxsw");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public memberDTO memberLogin(memberDTO dto) {
		memberDTO dto = new memberDTO();
		sql = "SELECT * FROM mts_keyboard WHERE user_id = ? user_pw = ? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.get);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return dto;
	}
	
	
	public void close() {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
			}
		}
		if (ptmt != null) {
			try {
				ptmt.close();
			} catch (SQLException e) {
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
	}
}
