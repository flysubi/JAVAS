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
		session.setAttribute("title", "�ڻ����");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping("/assetListAjax.jv")
	public List assetListAjax(@RequestParam(name="first") String first, 
			@RequestParam(name="last") String last, HttpSession session) {
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("first", first);
		map.put("last", last);
		map.put("id", session.getAttribute("auth"));
		list = adao.getAsset(map);
		return list;
	}
}