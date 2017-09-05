package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.CalendarDao;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	CalendarDao cdao;

	@RequestMapping("/mainCal.jv")
	public ModelAndView calendar(HttpSession session) {
		String id = (String)session.getAttribute("auth");
		ModelAndView mav = new ModelAndView("t_el");
		List<Map> list = cdao.getCal(id);
			mav.addObject("list",list);
			mav.addObject("section", "calendar/mainCal");
		return mav;
	}
	
	@RequestMapping("/addCal.jv")
	public ModelAndView addCal(@RequestParam Map map, HttpSession session) {
		System.out.println(map);
		String id = (String)session.getAttribute("auth");
			map.put("id",id);
		boolean b = cdao.addCal(map);
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("rst", b);
			mav.addObject("section", "alert/addCal");
		return mav;
	}
}
