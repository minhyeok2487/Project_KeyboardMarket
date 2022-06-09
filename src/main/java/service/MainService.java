package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDAO;
import model.item.itemDTO;
import model.main.MainDAO;
import model.main.MainDTO;

public class MainService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 1.추천상품 리스트
		ArrayList<MainDTO> GoodList = new MainDAO().Currentlist("추천상품");
		ArrayList<itemDTO> GList = new ArrayList<itemDTO>();
		for (MainDTO res : GoodList) {
			GList.add(new itemDAO().Detail(res.getItemNo()));
		}
		// 2.신상품 리스트
		ArrayList<MainDTO> NewList = new MainDAO().Currentlist("신상품");
		ArrayList<itemDTO> NList = new ArrayList<itemDTO>();
		for (MainDTO res : NewList) {
			NList.add(new itemDAO().Detail(res.getItemNo()));
		}
		System.out.println(GList);
		request.setAttribute("GList", GList);
		request.setAttribute("NList", NList);
		request.setAttribute("mainUrl", "./main/pages");
	}
}
