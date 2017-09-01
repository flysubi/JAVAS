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
		System.out.println(map);
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

	@RequestMapping("/writeExec.jv")
	public ModelAndView boardWriteExec(@RequestParam Map<String, Object> map, HttpSession session) {
		map.put("writer", session.getAttribute("auth"));
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
		Map<String, String> map1 = qs.boardDetail(map);
		System.out.println("...."+map1);
		mav.addObject("section", "/question/boarddetail");
		mav.addObject("posts", map1);
		return mav;
	}

	@RequestMapping("/answer.jv")
	public ModelAndView BoardReply(@RequestParam(name = "num") String num) {
		ModelAndView mav = new ModelAndView("t_el");
		Map<String, String> map = new HashMap<>(); 
		map.put("num", num);
		map = qs.boardDetail(map);
		mav.addObject("section", "/question/boardanswer");
		mav.addObject("posts", map);
		return mav;
	}

	@RequestMapping("/replyExec.jv")
	public ModelAndView boardReplyExec(HttpSession session, @RequestParam(name="title") String title, @RequestParam(name="content") String content, @RequestParam(name="group") int group, @RequestParam(name="step") int step, @RequestParam(name="depth") int depth ) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("group", group);
		map.put("step", step);
		map.put("depth", depth);
		map.put("writer", "flysubi");
		map.put("title", title);
		map.put("content", content);
		
		
		
		ModelAndView mav = new ModelAndView("redirect:/question/list.jv");
		qs.boardReply(map);
		return mav;
	}	

	@RequestMapping("/search.jv")
	public ModelAndView freeSearchList(@RequestParam (name="keyword") String keyword, String[] strAr, Map<String, List<String>> map) {
		strAr = keyword.split(" ");
		List Arlist = new ArrayList();
		for(String str : strAr) {
			Arlist.add("%"+str+"%");
		}
		int start;
		map.put("arr", Arlist);
		List data = qs.boardSearch(map);
		
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "/question/boardlist");
		mav.addObject("postsList", data);
		return mav;
	}
	
	@RequestMapping("/reply.jv")
	@ResponseBody
	public List<Map<String, Object>> freeboardsmallReply(@RequestParam Map<String, Object> reply, HttpSession session) {
		reply.put("writer", (String)session.getAttribute("auth"));
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		list = qs.replyAddList(reply);
		return list;
	}
	
	@RequestMapping("/replylist.jv")
	@ResponseBody
	public List<Map<String, Object>> freeboardgetlReply(@RequestParam Map<String, Object> reply) {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		list = qs.replyGetList(reply);
		return list;
	}
	
	
	
	
}
	
	

