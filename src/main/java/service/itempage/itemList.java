package service.itempage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Service;
import model.item.itemDAO;
import model.item.itemDTO;

public class itemList implements Service{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<String> manufactor = new ArrayList<String>();
		manufactor.add("CJ ENM");
		manufactor.add("LEOPOLD");
		manufactor.add("CORSAIR");
		
		ArrayList<String> type = new ArrayList<String>();
		type.add("기계식");
		type.add("멤브레인");
		type.add("펜터그래프");
		type.add("플런저");
		
		ArrayList<String> sw = new ArrayList<String>();
		sw.add("카일");
		sw.add("체리");
		sw.add("오테뮤");
		sw.add("게이트론");
		
		ArrayList<String> priceLange = new ArrayList<String>();
		priceLange.add("1~5만원");
		priceLange.add("5~10만원");
		priceLange.add("10~20만원");
		priceLange.add("20만원~");
		
		itemDAO dao = new itemDAO();
		ArrayList<itemDTO> dto = dao.list();
		
		request.setAttribute("manufactor", manufactor);
		request.setAttribute("type", type);
		request.setAttribute("sw", sw);
		request.setAttribute("priceLange", priceLange);
		request.setAttribute("dto", dto);

		
	}
}

