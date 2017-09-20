package controller;

import java.math.BigDecimal;
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

import model.PointDao;
import model.StoreDao;

@Controller
@RequestMapping("/store")
public class StoreController {
	
	@Autowired
	StoreDao sdao;
	
	@Autowired
	PointDao pdao;
	
	@RequestMapping("/main.jv")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("section","store/main");
			mav.addObject("title","»óÁ¡");
		return mav;
	}
	
	@RequestMapping("/itemBuy.jv")
	public ModelAndView itemBuy(@RequestParam Map map, HttpSession session) {
		String id = (String)session.getAttribute("auth");
		Map point = pdao.getPoint(id);
		int myP = ((BigDecimal)point.get("POINT")).intValue();
		String item = (String)map.get("item");
			map.put("id", id);
			map.put("content", "itemBuy");
			boolean rst = false;
			if(item.equals("full")) {
				if(myP >= 500) {
					map.put("point", -500);
					rst = sdao.itemBuy(map);
					sdao.pointDown(map);
				}
			} else if(item.equals("double")) {
				if(myP >= 300) {
					map.put("point", -300);
					rst = sdao.itemBuy(map);
					sdao.pointDown(map);
				}
			} else {
				if(myP >= 200) {
					map.put("point", -200);
					rst = sdao.itemBuy(map);
					sdao.pointDown(map);
				}
			}
		ModelAndView mav = new ModelAndView("t_el");
			mav.addObject("rst",rst);
			mav.addObject("section","alert/itemBuy");
		return mav;
	}
	
	@RequestMapping("/itemBuyAjax.jv")
	@ResponseBody
	public List itemBuyAjax(HttpSession session) {
		String id = (String)session.getAttribute("auth");
		Map map = sdao.itemInfo(id);
		List list = new ArrayList<>();
			if(((BigDecimal)map.get("CALENDAR")).intValue() == 1) {
				list.add("calendar");
			}
			if(((BigDecimal)map.get("ASSET")).intValue() == 1) {
				list.add("asset");
			} 
			if (((BigDecimal)map.get("FITNESS")).intValue() == 1) {
				list.add("fitness");
			} 
			if (((BigDecimal)map.get("VOICE")).intValue() == 1) {
				list.add("voice");
			} 
			if(((BigDecimal)map.get("FULL")).intValue() == 1) {
				list.add("full");
			}
			if (((BigDecimal)map.get("DOUBLE")).intValue() == 1) {
				list.add("double");
			}
		return list;
	}
}
