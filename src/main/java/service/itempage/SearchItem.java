package service.itempage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDAO;
import model.item.itemDTO;
import model.member.memberDAO;
import model.member.memberDTO;

public class SearchItem implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String itemname = request.getParameter("itemname");
		String item_name = "%"+itemname+"%";
		ArrayList<itemDTO> itemList = new itemDAO().searchList(item_name);
		
		request.setAttribute("itemList", itemList);
		request.setAttribute("itemname", itemname);
		request.setAttribute("mainUrl", "./items/itemsearchpage");
		
	}
}
