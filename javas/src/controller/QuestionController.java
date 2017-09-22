package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.QuestionModel;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	QuestionModel qs;

	@RequestMapping("/list.jv")
	public ModelAndView boardList(@RequestParam(name="p", defaultValue="1")int p,
			@RequestParam(name="search", required=false) String s) {
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
		List<Map<String, Object>> list = qs.boardList(map);
		
		
		int tot = qs.countAll(map);
		int size = tot%10 == 0 ? tot/10 : tot/10+1;
		
		ModelAndView mav = new ModelAndView("t_el");
		
		mav.addObject("section", "/question/boardlist");
		mav.addObject("title","Q&A");
		mav.addObject("postsList", list);
		mav.addObject("page", p);
		mav.addObject("total", tot);
		mav.addObject("size", size);
		return mav;
	}

	@RequestMapping("/write.jv")
	public ModelAndView boardWrite() {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("title","Q&A");
		mav.addObject("section", "/question/boardwrite");
		return mav;
	}
	
	@RequestMapping("/test.jv")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("title","Q&A");
		mav.addObject("section", "/question/test");
		return mav;
	}	
	
	
	@RequestMapping("/answer.jv")
	public ModelAndView BoardReply(@RequestParam(name = "num") String num) {
		ModelAndView mav = new ModelAndView("t_el");
		Map<String, Object> map = new HashMap<>(); 
		map.put("num", num);
		Map<String, Object> map1 = qs.boardDetail(map);
		mav.addObject("section", "/question/boardanswer");
		mav.addObject("posts", map1);
		mav.addObject("title", "Q&A");
		return mav;
	}


	@RequestMapping("/replyExec.jv")
	public ModelAndView boardReplyExec(HttpSession session, @RequestParam(name="title") String title, @RequestParam(name="content") String content, @RequestParam(name="group") int group, @RequestParam(name="step") int step, @RequestParam(name="depth") int depth ) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("title", title);
		map.put("writer", session.getAttribute("auth"));
		map.put("content", content);
		map.put("group", group);
		qs.boardReply(map);
		ModelAndView mav = new ModelAndView("redirect:/question/list.jv");
		return mav;
	}	
	
	@RequestMapping("/writeExec.jv")
	public ModelAndView boardWriteExec( @RequestParam(name="title") String title, @RequestParam(name="content") String content, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		map.put("writer", session.getAttribute("auth"));
		map.put("content", content);
		map.put("title", title);
		System.out.println(map);
		qs.postsUpload(map);
		
		ModelAndView mav = new ModelAndView("redirect:/question/list.jv");
		return mav;
	}

	@RequestMapping("/detail.jv")
	public ModelAndView boardDetail(@RequestParam(name = "num") String num, @RequestParam(name="like") int like) {
		ModelAndView mav = new ModelAndView("t_el");
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("like", like);
		Map<String, Object> map1 = qs.boardDetail(map);
		mav.addObject("section", "/question/boarddetail");
		mav.addObject("posts", map1);
		mav.addObject("title", "Q&A");
		return mav;
	}




	@RequestMapping("/boardDel.jv")
	public ModelAndView talkDel(@RequestParam (name="num") int num, HttpSession session ) {
		qs.boardDel(num);
		ModelAndView mav = new ModelAndView("redirect:/question/list.jv");
		return mav;
	}
	
	
	
	
	
}
	
	

