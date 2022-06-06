package service.itempage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDAO;
import model.item.itemDTO;

public class itemList implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		itemDAO dao = new itemDAO();
		ArrayList<itemDTO> dto = dao.list();

		// 1. 제조사 리스트 중복제거
		ArrayList<String> BeforeMF = new ArrayList<String>();
		for (itemDTO item : dto) {
			BeforeMF.add(item.getManufacture());
		}

		ArrayList<String> manufactor = new ArrayList<String>();
		for (String item : BeforeMF) {
			if (!manufactor.contains(item))
				manufactor.add(item);
		}

		// 2. 카테고리 중복제거
		ArrayList<String> BeforeCG = new ArrayList<String>();
		for (itemDTO item : dto) {
			BeforeCG.add(item.getCategory());
		}
		ArrayList<String> category = new ArrayList<String>();
		for (String item : BeforeCG) {
			if (!category.contains(item))
				category.add(item);
		}

		// 2. 스위치 중복제거
		ArrayList<String> BeforeSW = new ArrayList<String>();
		for (itemDTO item : dto) {
			if(item.getSwitchs() != null) {
				BeforeSW.add(item.getSwitchs());
			}
		}
		
		ArrayList<String> sw = new ArrayList<String>();
		for (String item : BeforeSW) {
			if (!sw.contains(item))
				sw.add(item);
		}

		

		ArrayList<String> priceLange = new ArrayList<String>();
		priceLange.add("1~5만원");
		priceLange.add("5~10만원");
		priceLange.add("10~20만원");
		priceLange.add("20만원~");

		request.setAttribute("manufactor", manufactor);
		request.setAttribute("category", category);
		request.setAttribute("sw", sw);
		request.setAttribute("priceLange", priceLange);
		request.setAttribute("dto", dto);

	}
}
