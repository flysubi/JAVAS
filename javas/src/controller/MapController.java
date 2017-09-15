package controller;

import java.util.Collection;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/function")
public class MapController {
	
	@RequestMapping("/map.jv")
	public ModelAndView map(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/function/map");
			session.setAttribute("title", "±Ê√£±‚");
		return mav; 
	}
	
	


			
			
}
