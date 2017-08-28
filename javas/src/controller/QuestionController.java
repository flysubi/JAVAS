package controller;

import java.util.ArrayList;
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

	@RequestMapping("/list.js")
	public ModelAndView boardList() {
		ModelAndView mav = new ModelAndView("t_el");
		List<Map<String, String>> list = qs.boardList();
		mav.addObject("section", "/question/boardlist");
		mav.addObject("active", "list");
		mav.addObject("postsList", list);

		return mav;
	}

	@RequestMapping("/write.js")
	public ModelAndView boardWrite() {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "/question/boardwrite");
		mav.addObject("active", "write");
		return mav;
	}

	@RequestMapping("/writeExec.choc")
	public ModelAndView boardWriteExec(@RequestParam Map<String, String> map, HttpSession session) {
		map.put("writer", (String) session.getAttribute("auth"));
		qs.postsUpload(map);
		ModelAndView mav = new ModelAndView("redirect:/question/list.js");
		return mav;
	}

	@RequestMapping("/detail.js")
	public ModelAndView boardDetail(@RequestParam(name = "num") String num) {
		ModelAndView mav = new ModelAndView("t_el_freeboard");
		Map<String, String> map = qs.boardDetail(num);
		mav.addObject("section", "/freeboard/boarddetail");
		mav.addObject("posts", map);
		return mav;
	}

	@RequestMapping("/answer.js")
	public ModelAndView BoardReply(@RequestParam(name = "num") String num) {
		ModelAndView mav = new ModelAndView("t_el_freeboard");
		Map<String, String> map = qs.boardDetail(num);
		mav.addObject("section", "/freeboard/boardanswer");
		mav.addObject("posts", map);
		return mav;
	}

	@RequestMapping("/replyExec.js")
	public ModelAndView boardReplyExec(@RequestParam Map<String, Object> map, HttpSession session) {
		map.put("writer", (String) session.getAttribute("auth"));
		ModelAndView mav = new ModelAndView("redirect:/freeboard/list.choc");
		qs.boardReply(map);
		return mav;
	}

	@RequestMapping("/likeup.js")
	@ResponseBody
	public boolean boardLikeUp(@RequestParam Map<String, String> map, HttpSession session) {
		map.put("id", (String) session.getAttribute("auth"));
		boolean flag = qs.boardLike(map);
		return flag;
	}

	@RequestMapping("/search.js")
	public ModelAndView freeSearchList(@RequestParam (name="keyword") String keyword, String[] strAr, Map<String, List<String>> map) {
		strAr = keyword.split(" ");
		List Arlist = new ArrayList();
		for(String str : strAr) {
			Arlist.add("%"+str+"%");
		}
		map.put("arr", Arlist);
		List data = qs.boardSearch(map);
		
		ModelAndView mav = new ModelAndView("t_el_freeboard");
		mav.addObject("section", "/question/boardlist");
		mav.addObject("active", "list");
		mav.addObject("postsList", data);
		return mav;
	}
	
	@RequestMapping("/reply.choc")
	@ResponseBody
	public List<Map<String, Object>> freeboardsmallReply(@RequestParam Map<String, Object> reply, HttpSession session) {
		reply.put("writer", (String)session.getAttribute("auth"));
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		list = qs.replyAddList(reply);
		return list;
	}
	
	@RequestMapping("/replylist.choc")
	@ResponseBody
	public List<Map<String, Object>> freeboardgetlReply(@RequestParam Map<String, Object> reply) {
		
		List<Map<String, Object>> list = new ArrayList<>();
		
		list = qs.replyGetList(reply);
		return list;
	}
	
	
	
	
}
	
	

