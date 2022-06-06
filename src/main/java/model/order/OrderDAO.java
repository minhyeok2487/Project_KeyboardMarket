package model.order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.cart.CartDTO;
import model.item.itemDTO;
import model.member.memberDTO;


public class OrderDAO {
	Connection con;
	PreparedStatement ptmt; // 보안적용
	ResultSet rs;
	String sql;
	
	public OrderDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/qazxsw");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void addOrder(String ordered_num, String merchant, memberDTO member,  String addr1, String addr2, CartDTO cartDTO){
		sql = "insert into orders (ordered_num, ordered_date, category, switchs, "
				+ "select_count,item_name,manufacture,spec,price,reg_date, "
				+ "item_img1,item_img2,memberNo,name,addr1,addr2,tel,status) values "
				+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ptmt = con.prepareStatement(sql);
			ptmt.setString(1, ordered_num);
			ptmt.setString(2, merchant);
			ptmt.setString(3, cartDTO.getCategory());
			ptmt.setString(4, cartDTO.getSwitchs());
			ptmt.setInt(5, cartDTO.getSelected_count());
			ptmt.setString(6, cartDTO.getItem_name());
			ptmt.setString(7, cartDTO.getManufacture());
			ptmt.setString(8, cartDTO.getSpec());
			ptmt.setInt(9, cartDTO.getPrice());
			ptmt.setString(10, cartDTO.getReg_date());
			ptmt.setString(11, cartDTO.getItem_img1());
			ptmt.setString(12, cartDTO.getItem_img2());
			ptmt.setInt(13, member.getMemberNo());
			ptmt.setString(14, member.getName());
			ptmt.setString(15, addr1);
			ptmt.setString(16, addr2);
			ptmt.setString(17, member.getTel());
			ptmt.setString(18, "주문완료");
			ptmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
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
