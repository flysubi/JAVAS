package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@RequestMapping("/join.js")
	public ModelAndView toJoin() {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "user/join");
		return mav;
	}
}
