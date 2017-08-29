package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.UserDao;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserDao udao;
	
	@RequestMapping("/join.jv")
	public ModelAndView toJoin() {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "user/join");
		return mav;
	}
	
	@RequestMapping("idCheckAjax.jv")
	@ResponseBody
	public boolean idCheckAjax(@RequestParam(name="id") String id) {
		boolean rst = udao.idCheck(id);
		return rst;
	}
	
	@RequestMapping("emailCheckAjax.jv")
	@ResponseBody
	public boolean emailCheckAjax(@RequestParam(name="email") String email) {
		boolean rst = udao.emailCheck(email);
		return rst;
	}
}
