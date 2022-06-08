package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.item.itemDTO;
import model.order.OrderDTO;



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
		memberDTO res = new memberDTO();
		Date date = new Date();
		Object birthDay;
		
		sql = "insert into member (user_id, user_pw, name, birthdate, gender, email, addr1, addr2, tel, reg_date) values "
				+ "(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate())";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, dto.getUser_id());
			ptmt.setString(2, dto.getUser_pw());
			ptmt.setString(3, dto.getName());
			
			date = dto.getBirthdate();
			birthDay = new Timestamp(date.getTime());
			ptmt.setObject(4, birthDay);
			
			ptmt.setString(5, dto.getGender());
			ptmt.setString(6, dto.getEmail());
			ptmt.setString(7, dto.getAddr1());
			ptmt.setString(8, dto.getAddr2());
			ptmt.setString(9, dto.getTel());
			
			rs = ptmt.executeQuery();
			
			if (rs.next()) {
				res.setUser_id(rs.getString("user_id"));
				res.setUser_pw(rs.getString("user_pw"));
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
				
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
				res.setStatus(rs.getString("status"));
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
	
	public int modify(memberDTO dto){
		
		int res = 0;
		sql = "update member set user_id = ?, user_pw = ?, name = ?, email = ?, addr1 = ?, addr2 = ?, tel = ? "

				+ "where memberNo =? ";
		
		try {
			ptmt = con.prepareStatement(sql);
			
			ptmt.setString(1, dto.user_id);
			ptmt.setString(2, dto.user_pw);
			ptmt.setString(3, dto.name);
			ptmt.setString(4, dto.email);
			ptmt.setString(5, dto.addr1);
			ptmt.setString(6, dto.addr2);
			ptmt.setString(7, dto.tel);
			ptmt.setInt(8, dto.memberNo);

			
			// 실행된 갯수만
			res = ptmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return res;
	}
	
	public int totalCnt(int no){
		sql = "SELECT COUNT(*) FROM order WHERE memberNo = ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			
			rs = ptmt.executeQuery();
			
			rs.next();
			
			return rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public ArrayList<OrderDTO> orderList(int start, int limit, int memberNo){
		ArrayList<OrderDTO> res = new ArrayList<OrderDTO>();
		sql = "SELECT * FROM orders WHERE memberNo = ? order by ordered_date desc limit ?, ?";
		
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setInt(1, memberNo);
			ptmt.setInt(2,  start);
			ptmt.setInt(3,  limit);
			
			rs = ptmt.executeQuery();
			
			while(rs.next()) {
				
				OrderDTO dto = new OrderDTO();
				
				dto.setOrderNo(rs.getInt("orderNo"));
				dto.setOrdered_num(rs.getString("ordered_num"));
				dto.setOrdered_date(rs.getTimestamp("ordered_date"));
				dto.setManufacture(rs.getString("manufacture"));
				dto.setCategory(rs.getString("category"));
				if(rs.getString("switchs")!=null) {
					dto.setSwitchs(rs.getString("switchs"));
				}
				dto.setSpec(rs.getString("spec"));
				dto.setPrice(rs.getInt("price"));
				dto.setSelect_count(rs.getInt("select_count"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setItem_img1(rs.getString("item_img1"));
				dto.setItem_img2(rs.getString("item_img2"));
				dto.setMemberNo(memberNo);
				dto.setName(rs.getString("name"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setItemNo(rs.getInt("itemNo"));
				dto.setStatus(rs.getString("status"));
				if(rs.getString("refund") != null) {
					dto.setRefund(rs.getString("refund"));
				}
				if(rs.getTimestamp("refund_date") != null) {
					dto.setRefund_date(rs.getTimestamp("refund_date"));
				}
				
				res.add(dto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return res;
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