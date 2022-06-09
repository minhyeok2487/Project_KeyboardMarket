package service.adminpage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDAO;
import model.item.itemDTO;
import model.main.MainDAO;
import model.main.MainDTO;
import model.notice.NoticeDTO;
import model.order.OrderDAO;
import model.order.OrderDTO;

public class MainControl implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		//1.추천상품 리스트
		ArrayList<MainDTO> GoodList = new MainDAO().Currentlist("추천상품");
		ArrayList<itemDTO> GList = new ArrayList<itemDTO>();
		for(MainDTO res:GoodList) {
			GList.add(new itemDAO().Detail(res.getItemNo()));
		}
		//2.신상품 리스트
		ArrayList<MainDTO> NewList = new MainDAO().Currentlist("신상품");
		ArrayList<itemDTO> NList = new ArrayList<itemDTO>();
		for(MainDTO res:NewList) {
			NList.add(new itemDAO().Detail(res.getItemNo()));
		}
		
		request.setAttribute("GList", GList);
		request.setAttribute("NList", NList);
		request.setAttribute("mainUrl", "./admins/maincontrolpage");
		
	}
}
