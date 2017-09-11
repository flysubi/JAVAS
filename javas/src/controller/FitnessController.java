package controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.FitnessDao;

@Controller
@RequestMapping("/function")
public class FitnessController {
	
	@Autowired
	FitnessDao fdao;
	
	@RequestMapping("/fitness.jv")
	public ModelAndView health(HttpSession session) {
		String id = (String)session.getAttribute("auth");
		ModelAndView mav = new ModelAndView("t_el");
		Map map = fdao.getMyFit(id);
			mav.addObject("title", "FITNESS");
			mav.addObject("map", map);
			mav.addObject("section", "function/fitness");
		return mav;
	}
	
	@RequestMapping("/fitnessExec.jv")
	public ModelAndView myFit(@RequestParam Map map, HttpSession session) {
		String id = (String)session.getAttribute("auth");
			double cm = (Double.parseDouble((String)map.get("cm")));
			double m = cm/100;
			double b = (Double.parseDouble((String)map.get("kg"))) / Math.pow(m, 2);
			double bmi = Math.round(b* 100) /100;
			double sw = (cm-100) * 0.9;
			double ac = 0;
			if(map.get("active").equals("가벼운 활동")) {
				ac = sw * 25;
			} else if (map.get("active").equals("보통 활동")) {
				ac = sw * 32;
			} else {
				ac = sw * 40;
			}
			map.put("id", id);
			map.put("bmi", bmi);
			map.put("sw", sw);
			map.put("ac", Math.round(ac));
			System.out.println(map);
			fdao.setMyFit(map);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/function/fitness.jv");
		return mav;
	}

}
