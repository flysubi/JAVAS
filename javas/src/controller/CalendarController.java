package controller;

import java.sql.Date;
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
@RequestMapping("/function")
public class CalendarController {
	
	@Autowired
	CalendarDao cdao;

	@RequestMapping("/calendar.jv")
	public ModelAndView calendar(HttpSession session) {
		String id = (String)session.getAttribute("auth");
		ModelAndView mav = new ModelAndView("t_el");
		List<Map> list = cdao.getCal(id);
			mav.addObject("list",list);
			mav.addObject("title","Ä¶¸°´õ");
			mav.addObject("section", "function/calendar");
		return mav;
	}
	
	@RequestMapping("/addCal.jv")
	public ModelAndView addCal(@RequestParam Map map, HttpSession session) {
		String id = (String)session.getAttribute("auth");
			map.put("id",id);
			if(map.get("dday") != null) {
				map.put("dday", "true");
			} else {
				map.put("dday", "false");
			}
		boolean b = cdao.addCal(map);
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("rst", b);
			mav.addObject("section", "alert/addCal");
		return mav;
	}
	
	@RequestMapping("/calModify.jv")
	public ModelAndView calModify(@RequestParam Map map, @RequestParam (name="num") int n) {
		boolean flag = false;
		if(map.get("mode").equals("delete")) {
			flag = cdao.deleteCal(n);
		} else {
			if(map.get("dday") != null) {
				map.put("dday", "true");
			} else {
				map.put("dday", "false");
			}
			flag = cdao.updateCal(map);
		}
		ModelAndView mav = new ModelAndView();
		
			mav.setViewName("redirect:/function/calendar.jv"); 
		return mav;
	}
	
	@RequestMapping("/calTest.jv")
	public ModelAndView calTest(HttpSession session) {
		String id = (String)session.getAttribute("auth");
		ModelAndView mav = new ModelAndView("t_el");
		List<Map> list = cdao.ddayCal(id);
			mav.addObject("list",list);
			mav.addObject("section", "function/calTest");
		return mav;
	}
}
