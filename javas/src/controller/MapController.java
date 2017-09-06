package controller;

import java.util.Collection;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping("/mylocation.jv")
	public ModelAndView gpsMap() {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/map/mylocation");
		return mav; 
	}
	
	@RequestMapping("/mapAjax.jv")
	@ResponseBody
	public ModelAndView mapExec(@RequestParam Map map) {
		System.out.println(map);
		
		ModelAndView mav = new ModelAndView("t_el"); 
			
		mav.addObject("section", "/map/map");
		return mav;
	}


			
			
}
