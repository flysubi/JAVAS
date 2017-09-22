package controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.PointDao;

@Controller
public class MenuerController {
	@Autowired
	PointDao pdao;
	
	@RequestMapping("/menuer.jv")
	public ModelAndView toIndex(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
		
		
		mav.addObject("title","¸Þ´º¾ó");
		mav.addObject("section", "menuer");
		return mav;
	}
	
	

}
