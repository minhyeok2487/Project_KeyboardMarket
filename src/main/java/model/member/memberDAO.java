package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import board_p.model_p.BoardDTO;


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
	
	public void signUp(memberDTO dto){
		sql = "insert into board (title, pname, pw, content, upfile, cnt, reg_date) values "
				+ "(?, ?, ?, ?, ?, 0, sysdate())";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.title);
			ptmt.setString(2, dto.pname);
			ptmt.setString(3, dto.pw);
			ptmt.setString(4, dto.content);
			ptmt.setString(5, dto.upfile);
			
			ptmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	
	public memberDTO memberLogin(memberDTO dto) {
		memberDTO res = new memberDTO();
		
		sql = "SELECT * FROM member WHERE user_id = ? and user_pw = ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getUser_id());
			ptmt.setString(2, dto.getUser_pw());
			
			rs = ptmt.executeQuery();
			
			if (rs.next()) {
				res.setMemberNo(rs.getInt("memberNo"));
				res.setUser_id(rs.getString("user_id"));
				res.setName(rs.getString("name"));
				res.setBirthdate(rs.getTimestamp("birthdate"));
				res.setGender(rs.getString("gender"));
				res.setEmail(rs.getString("email"));
				
				if(rs.getString("addr1")!=null) {				
					res.setAddr1(rs.getString("addr1"));
				}
				
				if(rs.getString("addr2")!=null) {
					res.setAddr2(rs.getString("addr2"));
				}
				
				if(rs.getString("tel")!=null) {
					res.setTel(rs.getString("tel"));
				}
				
				res.setReg_date(rs.getTimestamp("reg_date"));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		
		return res;
	}
	
	public memberDTO detail(int id){
		memberDTO dto = null;
		sql = "select * from member where memberNo = ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, id);
			
			rs = ptmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new memberDTO();
				
				dto.setMemberNo(rs.getInt("memberNo"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setName(rs.getString("name"));
				dto.setBirthdate(rs.getTimestamp("birthdate"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail(rs.getString("email"));
				
				if(rs.getString("addr1")!=null) {				
					dto.setAddr1(rs.getString("addr1"));
				}
				if(rs.getString("addr2")!=null) {
					dto.setAddr2(rs.getString("addr2"));
				}
				if(rs.getString("tel")!=null) {
					dto.setTel(rs.getString("tel"));
				}
				dto.setReg_date(rs.getTimestamp("reg_date"));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
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
