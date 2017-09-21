package controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.PointDao;
import model.StoreDao;

@Controller
public class IndexController {
	
	@Autowired
	PointDao pdao;
	
	@Autowired
	StoreDao sdao;
	
	@RequestMapping({"/", "/index.jv"})
	public ModelAndView toIndex(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_base");
		
		String id = (String)session.getAttribute("auth");
			if(id != null) {
				Map map = sdao.itemInfo(id);
				if(((BigDecimal)map.get("CALENDAR")).intValue() == 1) {
					session.setAttribute("calendar", "c");
				}
				if(((BigDecimal)map.get("ASSET")).intValue() == 1) {
					session.setAttribute("asset", "a");
				} 
				if (((BigDecimal)map.get("FITNESS")).intValue() == 1) {
					session.setAttribute("fitness", "f");
				} 
				if (((BigDecimal)map.get("VOICE")).intValue() == 1) {
					session.setAttribute("voice", "v");
				} 
				if(!id.equals("admin")) {
					
				
					Map point = pdao.getPoint(id);
					session.setAttribute("point", point.get("POINT"));



				}
			}

		
		mav.addObject("nav", "on");
			return mav;
	
	}
}