package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/map")
public class MapController {
	
	@RequestMapping("/map.jv")
	public ModelAndView map() {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/map/map");
		return mav; 
	}
	
	
	@RequestMapping("/mapdirection.jv")
	public ModelAndView mapDirection() {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/map/mapdirection");
		return mav; 
	}
}
