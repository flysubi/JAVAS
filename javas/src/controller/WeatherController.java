package controller;



import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.WeatherDao;

@Controller
@RequestMapping("/function")
public class WeatherController {
	
	@Autowired
	WeatherDao wdao;
	
	@RequestMapping("/weather.jv")
	public ModelAndView toJoin(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "function/weather");
		session.setAttribute("title", "³¯¾¾");
		return mav;
	}
	@RequestMapping("weatherCodeAjax.jv")
	@ResponseBody
	public Map<String, Object> weatherCodeAjax(@RequestParam(name="code")int code) {
		Map<String, Object> map = new HashMap<>();
		map = wdao.findcode(code);
		return map;
	}
}