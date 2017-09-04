package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

	@RequestMapping("/cal.jv")
	public ModelAndView cal() {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "calendar/cal");
		return mav;
	}
}
