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
import model.PointDao;

@Controller
@RequestMapping("/freetalk")
public class FreetalkController {

	@Autowired
	FreetalkDao fdao;
	
	@Autowired
	PointDao pdao;
	
	@RequestMapping("/addNew.jv")
	public ModelAndView addNew() {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("title","게시판");
			mav.addObject("section", "freetalk/addNew");
		return mav;
	}
	
	@RequestMapping("/addNewExec.jv")
	public ModelAndView addNewExec(@RequestParam Map map, HttpSession session) {
		System.out.println(map);
		String id = (String)session.getAttribute("auth");
			map.put("writer", id);
			boolean b = fdao.addNew(map);
			Map point = new HashMap();
				point.put("id", id);
				point.put("point", 5);
				point.put("content", "freetalk");
			boolean bb = pdao.pointUp(point);
			Map getPoint = pdao.getPoint(id);
			session.setAttribute("point", getPoint.get("POINT"));
			
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("rst", b);
			mav.addObject("section","alert/freetalkAdd");
		return mav;
	}
	
	
	@RequestMapping("/allTalks.jv")
	public ModelAndView talkList(@RequestParam(name="p", defaultValue="1") int p, 
			@RequestParam (name="search", required=false) String s, @RequestParam (name="category", required=false) String cate) {
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
			map.put("category", cate);
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
			mav.addObject("title","게시판");
		return mav;
	}
	
	@RequestMapping("/viewTalk.jv")
	public ModelAndView viewTalk(@RequestParam (name="num") int n, HttpSession session ) {
		String id = (String)session.getAttribute("auth");
		Map map = fdao.oneTalks(n);
		int love = fdao.loveCnt(n);
		Map love2 = new HashMap<>();
			love2.put("num", n);
			love2.put("id", id);
		String s = fdao.loveId(love2);
		boolean b = false;
		if(s != null) {
			if(s.equals(id)) {
				b = true;
			}	
		}
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section", "freetalk/viewTalk");
			session.setAttribute("map", map);
			mav.addObject("love",love);
			mav.addObject("b",b);
			mav.addObject("title","게시판");
		return mav;
	}
	
	@RequestMapping("/commentsAjax.jv")
	@ResponseBody
	public List viewTalkAjax(@RequestParam Map param, @RequestParam (name="num") int num, HttpSession session ) {
		String id = (String)session.getAttribute("auth");
			param.put("writer", id);
			List<Map> list = fdao.getComment(num);
			if(param.get("content") != null && param.get("content") != "") {
				boolean b = fdao.addComment(param);
					Map point = new HashMap();
						point.put("commnum", num);
						point.put("id", id);
						point.put("point", 2);
				boolean bb = pdao.commPointUp(point);
				Map getPoint = pdao.getPoint(id);
				session.setAttribute("point", getPoint.get("POINT"));
			}
		return list;
	}
	
	@RequestMapping("/loveAjax.jv")
	@ResponseBody
	public Map loveAjax(@RequestParam Map param, @RequestParam (name="num") int num,HttpSession session ) {
		String id = (String)session.getAttribute("auth");
			param.put("id", id);
		boolean flag = fdao.loveUp(param);
		int n = fdao.loveCnt(num);
		Map map = new HashMap<>();
			map.put("result", flag);
			map.put("cnt", n);
		Map point = new HashMap();
			String writer = (String)param.get("writer");
			point.put("id",writer);
			point.put("point", 1);
			point.put("content", "love");
		boolean bb = pdao.pointUp(point);
		Map getPoint = pdao.getPoint(id);
		session.setAttribute("point", getPoint.get("POINT"));
		return map;
	}
	
	@RequestMapping("/talkDel.jv")
	public ModelAndView talkDel(@RequestParam (name="num") int num, HttpSession session ) {
		ModelAndView mav = new ModelAndView("t_el");
		boolean b = fdao.talkDel(num);
			mav.addObject("section", "alert/talkDel");
			mav.addObject("num",num);
			mav.addObject("rst", b);
			mav.addObject("title","게시판");
		return mav;
	}
	
	
	
}
