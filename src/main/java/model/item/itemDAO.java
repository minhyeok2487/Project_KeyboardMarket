package model.item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class itemDAO {
	Connection con;
	PreparedStatement ptmt;
	ResultSet rs;
	String sql;
	
	public itemDAO() {
		try {
			Context context = new InitialContext();
			DataSource ds = (DataSource)context.lookup("java:comp/env/center");
			con = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<itemDTO> list(){
		ArrayList<itemDTO> res = new ArrayList<itemDTO>();
		sql = "select * from item";
		try {
			ptmt = con.prepareStatement(sql);
			rs = ptmt.executeQuery();
			while(rs.next()) {
				itemDTO dto = new itemDTO();
				dto.setItemNo(rs.getInt("itemNo"));
				dto.setItem_name(rs.getString("item_name"));
				dto.setManufacture(rs.getString("manufacture"));
				dto.setCategory(rs.getString("category"));
				dto.setSwitchs(rs.getString("switchs"));
				dto.setSpec(rs.getString("spec"));
				dto.setPrice(rs.getInt("price"));
				dto.setStock(rs.getInt("stock"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setItem_img1(rs.getString("item_img1"));
				dto.setItem_img2(rs.getString("item_img2"));
				dto.setItem_imgthumb(rs.getString("item_imgthumb"));
				dto.setItem_sold(rs.getInt("item_sold"));
				res.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return res;
	}
	
	
	
	public void close() {
		if(rs!=null)try {rs.close();} catch (Exception e) {}
		if(ptmt!=null)try {ptmt.close();} catch (Exception e) {}
		if(con!=null)try {con.close();} catch (Exception e) {}
	}
}
