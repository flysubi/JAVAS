package controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.FreetalkDao;

@Controller
@RequestMapping("/freetalk")
public class FreetalkController {

	@Autowired
	FreetalkDao fdao;
	
	@RequestMapping("/addNew.js")
	public ModelAndView addNew() {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "freetalk/addNew");
		return mav;
	}
	
	@RequestMapping("/addNewExec.js")
	public ModelAndView addNewExec(@RequestParam Map map, HttpSession session) {
			map.put("writer", session.getAttribute("login"));
			boolean b = fdao.addNew(map);
			
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/freetalk/allTalks.js");
		return mav;
	}
	
	
	@RequestMapping("/allTalks.js")
	public ModelAndView talkList(@RequestParam(name="p", defaultValue="1") int p, @RequestParam (name="search", required=false) String s) {
		String[] ar = null;
		if(s != null) {
			ar = s.split("\\s+");
			for(int i = 0; i < ar.length; i++) {
				ar[i] = "%"+ar[i]+"%";
			}
		}
		int start = 1+(p-1)*10;
		int end = p*10;
		Map map = new HashMap();
			map.put("start",start );
			map.put("end", end);
			map.put("arr", ar);
		List<Map> list = fdao.allTalks(map);
		
		int tot = fdao.countAll(map);
		int size = tot%10 ==0 ? tot/10 : tot/10+1;
		
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "freetalk/allTalks");
			mav.addObject("total",tot);
			mav.addObject("size", size);
			mav.addObject("page", p);
			mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("/viewTalk.js")
	public ModelAndView viewTalk(@RequestParam (name="num") int n, HttpSession session ) {
		Map map = fdao.oneTalks(n);
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "freetalk/viewTalk");
			session.setAttribute("map", map);
		return mav;
	}
	
	@RequestMapping("/commentsAjax.js")
	@ResponseBody
	public List viewTalkAjax(@RequestParam Map param, @RequestParam (name="num") int num, HttpSession session ) {
		String id = (String)session.getAttribute("login");
			param.put("writer", id);
			List<Map> list = fdao.getComment(num);
			if(param.get("content") != null) {
				boolean b = fdao.addComment(param);
			}
		return list;
	}
	
}