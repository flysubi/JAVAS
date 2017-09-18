package controller;




import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.AssetDao;

@Controller
@RequestMapping("/function")
public class AssetController {
	
	@Autowired
	AssetDao adao;
	
	@RequestMapping("/asset.jv")
	public ModelAndView toJoin(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
		List<Map> list = adao.getAsset((String)session.getAttribute("auth"));
		mav.addObject("section", "function/asset");
		session.setAttribute("title", "자산관리");
		mav.addObject("list", list);
		return mav;
	}
}