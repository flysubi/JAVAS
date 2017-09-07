package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import model.MemoModel;

@Controller
@RequestMapping("/memo")
public class MemoController {

	@Autowired
	MemoModel mm;
	
	@RequestMapping("/list.jv")
	public ModelAndView memolist(HttpSession session) {
		String id = (String)session.getAttribute("auth");
		List<Map<String, String>> list = mm.list(id);
		int c = mm.countAll(id);
		int mc = mm.myCount(id);
		session.setAttribute("memo", c);
		session.setAttribute("mymemo", mc);
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "/memo/memolist");
			mav.addObject("title","쪽지");
			mav.addObject("list", list);
		return mav;
	}	
	
	@RequestMapping("/write.jv")
	public ModelAndView memosend(@RequestParam (name= "target", defaultValue="") String target) {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("title","쪽지");
		mav.addObject("target", target);
		mav.addObject("section", "/memo/memowrite");
		return mav;
	}
	
	@RequestMapping("/writeExec.jv")
	public ModelAndView sendExec(@RequestParam Map<String, String> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		map.put("id", (String) session.getAttribute("auth"));
		System.out.println(".."+map);
		if(mm.send(map)) {
			
			mav.setViewName("redirect:/memo/list.jv");
		}else {
			mav.setViewName("t_el");
			mav.addObject("section", "/memo/memowrite");
			mav.addObject("result", "fff");
		}
		return mav;
	}
	
	@RequestMapping("/delete.jv")
	public ModelAndView delele(@RequestParam(name="num") String[] num, HttpSession session) {
		mm.delete(num, (String)session.getAttribute("auth"));
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/memo/list.jv");
		
		
		return mav;
	}
	
	
}
