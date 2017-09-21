package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.CalendarDao;
import model.PointDao;

@Controller
public class IndexController {
	
	@Autowired
	PointDao pdao;
	
	@Autowired
	CalendarDao cdao;
	
	@RequestMapping({"/", "/index.jv"})
	public ModelAndView toIndex(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_base");
		
		String id = (String)session.getAttribute("auth");
	
			if(id != null) {
				if(!id.equals("admin")) {
					Map point = pdao.getPoint(id);
					session.setAttribute("point", point.get("POINT"));
				}
				List<Map> dday = cdao.ddayCal(id);
				List<Map> today = cdao.todayCal();
				mav.addObject("dday", dday);
				mav.addObject("today", today);
			}
			mav.addObject("nav", "on");
			return mav;
	
	}
}