package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/function")
public class WeatherController {
	
	@RequestMapping("/weather.jv")
	public ModelAndView toJoin(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "function/weather");
		session.setAttribute("title", "³¯¾¾¾Ë¸²");
		return mav;
	}
}
