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

import model.AssetDao;

@Controller
@RequestMapping("/function")
public class AssetController {
	
	@Autowired
	AssetDao adao;
	
	@RequestMapping("/asset.jv")
	public ModelAndView asset(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "function/asset");
		session.setAttribute("title", "자산관리");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/assetListAjax.jv")
	public List<Map<String, Object>> assetListAjax(@RequestParam(name="first") String first, 
			@RequestParam(name="last") String last, HttpSession session) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("first", first);
		map.put("last", last);
		map.put("id", session.getAttribute("auth"));
		list = adao.getAsset(map);
		return list;
	}
	@ResponseBody
	@RequestMapping("/assetListIAjax.jv")
	public List<Object[]> assetListIAjax(@RequestParam(name="first") String first, 
			@RequestParam(name="last") String last, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
			map.put("first", first);
			map.put("last", last);
			map.put("id", session.getAttribute("auth"));
		List<Map<String,Object>> dlist = adao.getAssetI(map);
		List<Object[]> list = new ArrayList<>();
		list.add(new Object[]{"내용","금액"});
		for(Map<String,Object> o : dlist) {
			list.add(new Object[]{o.get("ICONTENT"), o.get("SUM")});
		}
			
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/assetListEAjax.jv")
	public List<Object[]> assetListEAjax(@RequestParam(name="first") String first, 
			@RequestParam(name="last") String last, HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		map.put("first", first);
		map.put("last", last);
		map.put("id", session.getAttribute("auth"));
		List<Map<String,Object>> dlist = adao.getAssetE(map);
		List<Object[]> list = new ArrayList<>();
		list.add(new Object[]{"내용","금액"});
		for(Map<String,Object> o : dlist) {
			list.add(new Object[]{o.get("ECONTENT"), o.get("SUM")});
		}
		return list;
	}
}