package controller;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/function")
public class MapController {
	
	@RequestMapping("/map.jv")
	public ModelAndView map(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/function/map");
			mav.addObject("title", "��ã��");
		return mav; 
	}
		
	@RequestMapping("/transfertest.jv")
	public ModelAndView transferTest() {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/function/transferTest");
		return mav; 
	}
	
	@RequestMapping("/map1.jv")
	public ModelAndView map1() {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/function/map1");
		return mav; 
	}
	
	@RequestMapping("/search.jv")
	public ModelAndView searchMap(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/function/search");
			mav.addObject("title", "��ã��");
		return mav; 
	}
		
	@RequestMapping("/transferDataAjax.jv")
	@ResponseBody
	public ModelAndView transferData(@RequestParam(name="transfer") List list , @RequestParam(name="info") List list1) {
		System.out.println("transfer : "+list);
		//System.out.println("info : "+list1);
		
		
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/function/transferTest");
		
			
		return mav; 
	}
	
	@RequestMapping("/transferAjax.jv")
	@ResponseBody
	public ModelAndView transfer(@RequestParam(name="transfer") List list) {
		System.out.println("transfer : "+list);
		//System.out.println("info : "+list1);
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/function/map1");
		
			
		return mav; 
	}
	

			
			
}
