package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

import model.AssetDao;
import model.CalendarDao;

@Controller
@RequestMapping("/function")
public class CalendarController {

	@Autowired
	CalendarDao cdao;

	@Autowired
	AssetDao adao;

	@RequestMapping("/calendar.jv")
	public ModelAndView calendar(HttpSession session) {
		String id = (String) session.getAttribute("auth");
		ModelAndView mav = new ModelAndView("t_el");
		List<Map> list = cdao.getCal(id);
		mav.addObject("list", list);
		mav.addObject("title", "캘린더");
		mav.addObject("section", "function/calendar");
		return mav;
	}

	@RequestMapping("/addCal.jv")
	public ModelAndView addCal(@RequestParam Map map, @RequestParam(name = "income", defaultValue = "0") int[] income,
			@RequestParam(name = "icontent", defaultValue = "기타수입") String[] icontent,
			@RequestParam(name = "expense", defaultValue = "0") int[] expense,
			@RequestParam(name = "econtent", defaultValue = "기타지출") String[] econtent, HttpSession session) {
		String id = (String) session.getAttribute("auth");
		map.put("id", id);
		if (map.get("dday") != null) {
			map.put("dday", "true");
		} else {
			map.put("dday", "false");
		}
		boolean b = cdao.addCal(map);
		if (income[0] != 0 || expense[0] != 0) {
			List<Map<String, Object>> list = new ArrayList<>();
			for (int i = 0; i < income.length; i++) {
				if (income[i] != 0 || expense[i] != 0) {
					if (icontent[i].equals("")) {
						icontent[i] = "기타";
					}
					if (econtent[i].equals("")) {
						econtent[i] = "기타";
					}
					Map<String, Object> map2 = new HashMap<>();
					map2.put("income", income[i]);
					map2.put("icontent", icontent[i]);
					map2.put("expense", expense[i]);
					map2.put("econtent", econtent[i]);
					map2.put("adate", map.get("date"));
					map2.put("id", session.getAttribute("auth"));
					list.add(map2);
				}
			}
			adao.addAsset(list);
		}
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("rst", b);
		mav.addObject("section", "alert/addCal");

		return mav;
	}

	@RequestMapping("/calModify.jv")
	public ModelAndView calModify(@RequestParam Map map, @RequestParam(name = "num") int n,
			@RequestParam(name = "income", defaultValue = "0", required = false) int[] income,
			@RequestParam(name = "icontent", required = false) String[] icontent,
			@RequestParam(name = "expense", defaultValue = "0", required = false) int[] expense,
			@RequestParam(name = "econtent", required = false) String[] econtent,
			@RequestParam(name = "anum", defaultValue = "0") int[] anum, HttpSession session) {
		boolean flag = false;
		List<HashMap<String, Object>> list = null;
		List<Map<String, Object>> list2 = null;
		if (income[0] != 0 || expense[0] != 0) {
			list = new ArrayList<>();

			for (int i = 0; i < income.length; i++) {
				if (income[i] != 0 || expense[i] != 0) {
					if (anum[i] != 0) {
						if (icontent[i].equals("")) {
							icontent[i] = "기타";
						}
						if (econtent[i].equals("")) {
							econtent[i] = "기타";
						}
						HashMap<String, Object> map2 = new HashMap<>();
						map2.put("income", income[i]);
						map2.put("icontent", icontent[i]);
						map2.put("expense", expense[i]);
						map2.put("econtent", econtent[i]);
						map2.put("num", anum[i]);
						map2.put("id", session.getAttribute("auth"));
						list.add(map2);
					} else {
						list2 = new ArrayList<>();
						if (icontent[i].equals("")) {
							icontent[i] = "기타";
						}
						if (econtent[i].equals("")) {
							econtent[i] = "기타";
						}
						HashMap<String, Object> map3 = new HashMap<>();
						map3.put("income", income[i]);
						map3.put("icontent", icontent[i]);
						map3.put("expense", expense[i]);
						map3.put("econtent", econtent[i]);
						map3.put("adate", map.get("date"));
						map3.put("num", n);
						list2.add(map3);
					}
				}
			}
		}
		if (map.get("mode").equals("delete")) {
			flag = cdao.deleteCal(n);
			adao.deleteAsset(n);

		} else {
			if (map.get("dday") != null) {
				map.put("dday", "true");
			} else {
				map.put("dday", "false");
			}
			flag = cdao.updateCal(map);
			adao.updateAsset(list);
			if (list2 != null) {
				adao.addAsset2(list2);
			}
		}
		ModelAndView mav = new ModelAndView();

		mav.setViewName("redirect:/function/calendar.jv");
		return mav;
	}

	@RequestMapping("/calTest.jv")
	public ModelAndView calTest(HttpSession session) {
		String id = (String) session.getAttribute("auth");
		ModelAndView mav = new ModelAndView("t_el");
		List<Map> dday = cdao.ddayCal(id);
		List<Map> today = cdao.todayCal();
		mav.addObject("dday", dday);
		mav.addObject("today", today);
		mav.addObject("section", "function/calTest");
		return mav;
	}
}
