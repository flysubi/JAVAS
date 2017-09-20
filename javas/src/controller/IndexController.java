package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.PointDao;

@Controller
public class IndexController {
	
	@Autowired
	PointDao pdao;
	
	@RequestMapping({"/", "/index.jv"})
	public ModelAndView toIndex(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_base");
		
		String id = (String)session.getAttribute("auth");
	
			if(id != null) {
				if(!id.equals("admin")) {
					
				
					Map point = pdao.getPoint(id);
					session.setAttribute("point", point.get("POINT"));
				}
		
				
	
				
			}
			mav.addObject("nav", "on");
			return mav;
	
	}
}