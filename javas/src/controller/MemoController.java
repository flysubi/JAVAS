package controller;

import java.util.HashMap;
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
	public ModelAndView memolist(HttpSession session, @RequestParam(name="p", defaultValue="1")int p,
			@RequestParam(name="search", required=false) String s) {
		String id = (String)session.getAttribute("auth");
		String[] ar = null;
		if(s != null) {
			ar = s.split("\\s+");
			for(int i=0; i < ar.length; i++) {
				ar[i] = "%"+ar[i]+"%";
			}
		}
		int start = 1+(p-1)*10;
		int end = p*10;
		
		Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("arr", ar);
			map.put("id", id);		
		
		
		List<Map<String, String>> list = mm.list(map);
		int c = mm.countAll(id);
		int mc = mm.myCount(id);
		int tot = c;
		int size = tot%10 ==0 ? tot/10 : tot/10+1;
		session.setAttribute("memo", c);
		session.setAttribute("mymemo", mc);
		ModelAndView mav = new ModelAndView("t_el_memo");
			mav.addObject("active", "mylist");
			mav.addObject("section", "/memo/memolist");
			mav.addObject("title","쪽지");
			mav.addObject("name", "list");
			mav.addObject("list", list);
			mav.addObject("total",tot);
			mav.addObject("size", size);
			mav.addObject("page", p);
			
		return mav;
	}
	
	@RequestMapping("/mylist.jv")
	public ModelAndView memomylist(HttpSession session, @RequestParam(name="p", defaultValue="1")int p,
			@RequestParam(name="search", required=false) String s) {
		String id = (String)session.getAttribute("auth");
		String[] ar = null;
		if(s != null) {
			ar = s.split("\\s+");
			for(int i=0; i < ar.length; i++) {
				ar[i] = "%"+ar[i]+"%";
			}
		}
		int start = 1+(p-1)*10;
		int end = p*10;
		
		Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			map.put("arr", ar);
			map.put("id", id);		
		
		
		List<Map<String, String>> list = mm.mylist(map);
		
		int c = mm.countAll(id);
		int mc = mm.myCount(id);
		int tot = mc;
		int size = tot%10 ==0 ? tot/10 : tot/10+1;
		session.setAttribute("memo", c);
		session.setAttribute("mymemo", mc);
		ModelAndView mav = new ModelAndView("t_el_memo");
			mav.addObject("active", "mylist");
			mav.addObject("section", "/memo/mymemolist");
			mav.addObject("title","쪽지");
			mav.addObject("name", "list");
			mav.addObject("list", list);
			mav.addObject("total",tot);
			mav.addObject("size", size);
			mav.addObject("page", p);
			
		return mav;
	}
	
	
	
	
	
		
	
		@RequestMapping("/write.jv")
	public ModelAndView memosend(@RequestParam (name= "w", required= false) String w, @RequestParam (name= "my", required= false) String my) {
		ModelAndView mav = new ModelAndView("t_el_memo");
		mav.addObject("title","쪽지");
		mav.addObject("w", w);
		mav.addObject("my", my);
		mav.addObject("section", "/memo/memowrite");
		mav.addObject("name", "write");
		return mav;
	}
	
	@RequestMapping("/mywrite.jv")
	public ModelAndView myMemoWrite() {
		ModelAndView mav = new ModelAndView("t_el_memo");
		mav.addObject("title","쪽지");
		mav.addObject("section", "/memo/mymemowrite");
		mav.addObject("name", "mywrite");
		return mav;
	}
	
	
	@RequestMapping("/writeExec.jv")
	public ModelAndView sendExec(@RequestParam Map<String, String> map, HttpSession session) {
		map.put("id", (String) session.getAttribute("auth"));
		ModelAndView mav = new ModelAndView();
		
		
		if(map.get("receiver").equals(map.get("id"))) {
			map.put("category", "내게쓴쪽지");
		}else {
			map.put("category", "보낸쪽지");
		}	
		mav.addObject("section", "alert/memo");
		mav.addObject("rst", mm.send(map));
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
