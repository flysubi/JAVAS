package controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.FitnessDao;

@Controller
@RequestMapping("/function")
public class FitnessController {

	@Autowired
	FitnessDao fdao;

	@RequestMapping("/fitness.jv")
	public ModelAndView health(HttpSession session) {
		String id = (String) session.getAttribute("auth");
		ModelAndView mav = new ModelAndView("t_el");
		List list = fdao.todayMenu(id);
		List list2 = fdao.todayExer(id);
		int n = fdao.totalCal(id);
		int n2 = fdao.totalExer(id);
		Map map = fdao.getMyFit(id);
		if (map == null) {
			fdao.setMyFit(id);
		}
		mav.addObject("total", n);
		mav.addObject("total2", n2);
		mav.addObject("list", list);
		mav.addObject("list2", list2);
		mav.addObject("title", "FITNESS");
		mav.addObject("map", map);
		mav.addObject("section", "function/fitness");
		return mav;
	}

	@RequestMapping("/fitnessExec.jv")
	public ModelAndView myFit(@RequestParam Map map, HttpSession session) {
		String id = (String) session.getAttribute("auth");
		double cm = (Double.parseDouble((String) map.get("cm")));
		double m = cm / 100;
		double b = (Double.parseDouble((String) map.get("kg"))) / Math.pow(m, 2);
		double bmi = Math.round(b * 100) / 100;
		double sw = (cm - 100) * 0.9;
		double ac =  sw * 30;
		map.put("id", id);
		map.put("bmi", bmi);
		map.put("sw", sw);
		map.put("ac", Math.round(ac));
		fdao.myFitUpdate(map);
		fdao.myWeight(map);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/function/fitness.jv");
		return mav;
	}

	@RequestMapping("/fitnessModal.jv")
	public ModelAndView fitnessModal() {
		ModelAndView mav = new ModelAndView();
		List<Map> list = fdao.calSort();
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/exerciseModal.jv")
	public ModelAndView exerciseModal() {
		ModelAndView mav = new ModelAndView();
		List<Map> list = fdao.exerSort();
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/fitnessModalExec.jv")
	public ModelAndView commModalExec(@RequestParam Map map, HttpSession session) {
		String id = (String) session.getAttribute("auth");
			map.put("id", id);
			if(map.get("kcal") == "") {
				int kcal = Integer.parseInt((String)map.get("cal")) * Integer.parseInt((String)map.get("cnt"));
				map.put("kcal", kcal);
			}
		fdao.myMenu(map);
		ModelAndView mav = new ModelAndView();
		List<Map> list = fdao.calSort();
		mav.addObject("list", list);
		mav.setViewName("redirect:/function/fitness.jv");
		return mav;
	}
	
	@RequestMapping("/exerciseModalExec.jv")
	public ModelAndView exerciseModalExec(@RequestParam Map map, HttpSession session) {
		String id = (String) session.getAttribute("auth");
			map.put("id", id);
			if(map.get("kcal") == "") {
				int kcal = Integer.parseInt((String)map.get("cal")) * Integer.parseInt((String)map.get("cnt"));
				map.put("kcal", kcal);
			}
			System.out.println(map);
		fdao.myExercise(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/function/fitness.jv");
		return mav;
	}

	@RequestMapping("/fitnessModalAjax.jv")
	@ResponseBody
	public List commModaAjax(@RequestParam(name = "sort", required = false) String sort,
			@RequestParam(name = "name", required = false) String name, HttpSession session) {
		String id = (String)session.getAttribute("auth");
		List list = new ArrayList<>();
		if (sort != null) {
			list = fdao.calName(sort);
		} else if (name != null) {
			int n = fdao.calKcal(name);
			Map map = new HashMap<>();
			map.put("kcal", n);
			list.add(map);
		}
		return list;
	}
	
	@RequestMapping("/exerciseModalAjax.jv")
	@ResponseBody
	public List exerciseModaAjax(@RequestParam(name = "sort", required = false) String sort,
			@RequestParam(name = "kg", required = false) String kg, HttpSession session) {
		String id = (String)session.getAttribute("auth");
		List list = new ArrayList<>();
		if (sort != null && kg == null) {
			list = fdao.exerName(sort);
		} else if (sort != null && kg != null) {
			Map map2 = new HashMap<>();
				map2.put("sort", sort);
				map2.put("kg", kg	);
			int n = fdao.exerKcal(map2);
			Map map = new HashMap<>();
			map.put("kcal", n);
			list.add(map);
		}
		return list;
	}
	
	@RequestMapping("/totalAjax.jv")
	@ResponseBody
	public List totalAjax( HttpSession session) {
		String id = (String)session.getAttribute("auth");
		List list = new ArrayList<>();
		int n = fdao.totalCal(id);
		Map total = new HashMap<>();
			total.put("total", n);
			list.add(total);
		return list;
	}
	
	@RequestMapping("/exerciseTotalAjax.jv")
	@ResponseBody
	public List exerciseTotalAjax( HttpSession session) {
		String id = (String)session.getAttribute("auth");
		List list = new ArrayList<>();
		int n = fdao.totalExer(id);
		Map total = new HashMap<>();
			total.put("total", n);
			list.add(total);
		return list;
	}
	
	@RequestMapping("/myMenuDelAjax.jv")
	@ResponseBody
	public Map myMenuDelAjax(@RequestParam (name="num") int n) {
		Map map = new HashMap<>();
		boolean flag = fdao.myMenuDel(n);
			map.put("flag", flag);
		return map;
	}
	
	@RequestMapping("/myExerDelAjax.jv")
	@ResponseBody
	public Map myExerDelAjax(@RequestParam (name="num") int n) {
		Map map = new HashMap<>();
		boolean flag = fdao.myMenuDel(n);
			map.put("flag", flag);
		return map;
	}
	
	@RequestMapping("/graphModal.jv")
	public ModelAndView graphModal(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("auth");
		List<Map> list = fdao.WeightGraph(id);
		List<Map> list2 = fdao.graphCal(id);
		Map map = fdao.getMyFit(id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
        Date date2 = new Date();
        long l = date2.getTime();
        Date date = new Date(l-86400000);
        
        int length = 6;
        int length2 = 6;
        String wg = df.format(date);
        String gc = df.format(date);
        if(!list.isEmpty()) {
        	length = 6-list.size();
        	wg = (String)(list.get(list.size()-1)).get("D");
        }
        if(!list2.isEmpty()) {
        	length2 = 6-list2.size();
        	gc = (String)(list2.get(list2.size()-1)).get("EDATE");
        }
        
			mav.addObject("length", length);
			mav.addObject("length2", length2);
			mav.addObject("map",map);
			mav.addObject("list", list);
			mav.addObject("list2", list2);
			mav.addObject("wg",wg);
			mav.addObject("gc", gc);
			
		return mav;
	}

}
