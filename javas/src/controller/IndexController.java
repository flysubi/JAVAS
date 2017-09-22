package controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.CalendarDao;
import model.PointDao;
import model.StoreDao;
import model.UserDao;

@Controller
public class IndexController {

	@Autowired
	PointDao pdao;

	@Autowired
	CalendarDao cdao;

	@Autowired
	StoreDao sdao;

	@Autowired
	UserDao udao;

	@RequestMapping({ "/", "/index.jv" })
	public ModelAndView toIndex(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_base");

		String id = (String) session.getAttribute("auth");
		Map map2 = null;
		if (id != null) {
			if (!id.equals("admin")) {
				Map map = sdao.itemInfo(id);
				map2 = udao.userInfo(id);
				if (((BigDecimal) map.get("CALENDAR")).intValue() == 1) {
					session.setAttribute("calendar", "c");
				}
				if (((BigDecimal) map.get("ASSET")).intValue() == 1) {
					session.setAttribute("asset", "a");
				}
				if (((BigDecimal) map.get("FITNESS")).intValue() == 1) {
					session.setAttribute("fitness", "f");
				}
				if (!id.equals("admin")) {
					Map point = pdao.getPoint(id);
					session.setAttribute("point", point.get("POINT"));
				}
				List<Map> today = cdao.todayCal(id);
				List<Map> dday = cdao.ddayCal(id);
				mav.addObject("voice", map2.get("VOICE"));
				mav.addObject("dday", dday);
				mav.addObject("today", today);
			}
		}
		mav.addObject("map", map2);

		mav.addObject("nav", "on");

		return mav;

	}
}