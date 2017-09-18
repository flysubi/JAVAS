package controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.AdminDao;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	AdminDao ad;

	@RequestMapping("/statistics.jv")
	public ModelAndView statics() {
		ModelAndView mav = new ModelAndView("t_el");

		List<Map<String, Object>> list = ad.statics();
		int c = ad.infocount();

		int mc = 0;
		int wc = 0;
		int nc = 0;

		int c1 = 0;
		int c2 = 0;
		int c3 = 0;
		int c4 = 0;
		int c5 = 0;
		int c6 = 0;
		int dc = 0;

		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);

			if (map.get("GENDER") == null) {
				nc += 1;
			} else {
				if (map.get("GENDER").equals("³²")) {
					mc += 1;
				} else {
					wc += 1;
				}
			}

		}

		mav.addObject("list", list);
		mav.addObject("count", c);
		mav.addObject("man", mc);
		mav.addObject("woman", wc);
		mav.addObject("no", nc);
		mav.addObject("section", "/admin/statistics");
		return mav;
	}
}
