package controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.JoinSocketHandler;
import model.MemoModel;
import model.PointDao;
import model.UserDao;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserDao udao;
	
	@Autowired
	PointDao pdao;
	
	@Autowired
	MemoModel mm;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	JoinSocketHandler jsh;
		
	@RequestMapping("/join.jv")
	public ModelAndView toJoin(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "user/join");
		session.setAttribute("title", "회원가입");
		return mav;
	}
	
	@RequestMapping("idCheckAjax.jv")
	@ResponseBody
	public boolean idCheckAjax(@RequestParam(name="id") String id) {
		boolean rst = udao.idCheck(id);
		return rst;
	}
	
	@RequestMapping("emailCheckAjax.jv")
	@ResponseBody
	public boolean emailCheckAjax(@RequestParam(name="email") String email) {
		boolean rst = udao.emailCheck(email);
		return rst;
	}
	
	@RequestMapping("/joinResult.jv")
	public ModelAndView join(@RequestParam Map map, HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "user/joinResult");
		mav.addObject("height", "52%");
		session.setAttribute("user", map);
		try {
			MimeMessage msg = sender.createMimeMessage();
			
			InternetAddress from = new InternetAddress("admin");
			msg.setSender(from);
			
			InternetAddress to = new InternetAddress((String)map.get("email"));
			msg.setRecipient(RecipientType.TO, to);
			msg.setSubject("JAVAS 회원가입");
			String text ="<h1>JAVAS회원가입을 축하드립니다!</h1>";
			String code = UUID.randomUUID().toString().substring(0, 8);
			InetAddress local = InetAddress.getLocalHost();
			text += "아래 링크를 클릭하고 가입 페이지를 확인해주세요.<br/>";
			text += "<a href=\"http://"+local.getHostAddress()+"/user/emailAuth.jv?key="+code+"\">인증하기</a>";
			msg.setText(text, "UTF-8", "html");
			sender.send(msg);
			session.setAttribute("code", code);
			mav.addObject("ip", local.getHostAddress());
		}catch(Exception e) {
			System.out.println(e);
		}
		return mav;
	}
	
	@RequestMapping("emailAuth.jv")
	public void emailAuth(@RequestParam(name="key", defaultValue="0") String key, HttpSession session) {
		if(((String)session.getAttribute("code")).equals(key)) {
			jsh.sendMessage("true");
		}else {
			jsh.sendMessage("false");
		}
	}
	
	@RequestMapping("/success.jv")
	public ModelAndView successJoin(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
		Map map = (Map)session.getAttribute("user");
		udao.joinMember(map);
		session.setAttribute("auth", map.get("id"));
		mav.addObject("id", map.get("id"));
		mav.addObject("section", "user/success");
		mav.addObject("height", "52%");
		
		String id = (String)session.getAttribute("auth");
		Map point = new HashMap();
		point.put("id", id);
		point.put("point", 10);
		point.put("content", "login");
	boolean bb = pdao.pointUp(point);
	Map getPoint = pdao.getPoint(id);
	session.setAttribute("point", getPoint.get("POINT"));
		return mav;
	}
	
	@RequestMapping("/fail.jv")
	public ModelAndView failJoin() {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "user/fail");
		mav.addObject("height", "52%");
		return mav;
	}
	
	@RequestMapping("/login.jv")
	public ModelAndView toLogin(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "user/login");
		session.setAttribute("title", "로그인");
		mav.addObject("height", "52%");
		return mav;
	}
	
	@RequestMapping("/loginResult.jv")
	public ModelAndView toLoginResult(@RequestParam Map map, HttpSession session, HttpServletResponse resp, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		boolean b = udao.login(map);
		if (b) {
			if (map.get("keep") != null) {
				Cookie c = new Cookie("login", (String) map.get("id"));
				c.setMaxAge(60 * 60 * 24 * 7);
				c.setPath("/");
				resp.addCookie(c);
			}
			if (session.getAttribute("logo") == null) {
				mav.setViewName("redirect:/");
			} else {
				mav.setViewName("redirect:/" + session.getAttribute("logo"));
			}
			session.setAttribute("auth", map.get("id"));
			String id = (String)session.getAttribute("auth");
			Map login = new HashMap<>();
				login.put("id", id);
				login.put("content", "login");
			int logCk = pdao.loginCk(login);
			if(logCk >= 1 || logCk == -1) {
				Map point = new HashMap();
					point.put("id", id);
					point.put("point", 1);
					point.put("content", "login");
				boolean bb = pdao.pointUp(point);
				Map getPoint = pdao.getPoint(id);
				session.setAttribute("point", getPoint.get("POINT"));
				
				int c = mm.countAll(id);
				session.setAttribute("memo", c);
			}

			return mav;
		} else {
			mav.setViewName("t_el");
			mav.addObject("section", "user/login");
			mav.addObject("lfalse", "on");
			return mav;
		}
	}
	

	@RequestMapping("/findUser.jv")
	public ModelAndView findId() {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "user/findUser");
		mav.addObject("height", "52%");
		return mav;
	}

	@RequestMapping("/findResult.jv")
	public ModelAndView findMemberResult(@RequestParam(name = "email") String email) {
		String arr = udao.findUser(email);
		ModelAndView mav = new ModelAndView();
		if (arr.equals("no")) {
			mav.setViewName("t_el");
			mav.addObject("section", "user/findNoResult");
			mav.addObject("height", "52%");
			return mav;
		} else {
			String[] s = arr.split("&");
			mav.setViewName("t_el");
			mav.addObject("section", "user/findResult");
			mav.addObject("id", s[0]);
			mav.addObject("pass", s[1]);
			mav.addObject("height", "52%");
			return mav;
		}
	}

	@RequestMapping("/logout.jv")
	public String logout(HttpSession session, HttpServletResponse resp) throws IOException {
		// ModelAndView mav = new ModelAndView("t_base");

		Cookie c = new Cookie("login", (String) session.getAttribute("auth"));
		c.setPath("/");
		c.setMaxAge(0);
		resp.addCookie(c);
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/userInfo.jv")
	public ModelAndView userInfo(HttpSession session) {
		ModelAndView mav = new ModelAndView("t_el_info");
		mav.addObject("section", "user/userInfo");
		session.setAttribute("title", "정보수정");
		Map map = udao.userInfo((String)session.getAttribute("auth"));
		mav.addObject("map", map);
		return mav;
	}
	@RequestMapping("/infoResult.jv")
	public ModelAndView infoResult(@RequestParam Map map) {
		ModelAndView mav = new ModelAndView("alert/userInfo");
		boolean rst = udao.infoResult(map);
		mav.addObject("rst", rst);
		return mav;
	}
	
}
