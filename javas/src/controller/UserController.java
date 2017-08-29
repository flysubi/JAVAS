package controller;

import java.util.Map;
import java.util.UUID;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import handler.JoinSocketHandler;
import model.UserDao;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserDao udao;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	JoinSocketHandler jsh;
	
	@RequestMapping("/join.jv")
	public ModelAndView toJoin() {
		ModelAndView mav = new ModelAndView("t_el");
		mav.addObject("section", "user/join");
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
		mav.addObject("section", "join/result");
		session.setAttribute("user", map);
		try {
			// 단순 text 기반의 메일이 아닐때
			MimeMessage msg = sender.createMimeMessage();
			
			InternetAddress from = new InternetAddress("admin");
			msg.setSender(from);
			
			InternetAddress to = new InternetAddress((String)map.get("email"));
			msg.setRecipient(RecipientType.TO, to);
			msg.setSubject("Cat House 회원가입");
			String text ="<h1>안녕? Cat House다냥!</h1>";
			String code = UUID.randomUUID().toString().substring(0, 8);
			text += "아래 링크를 클릭하고 가입 페이지를 확인해보라냥!!<br/>";
			text += "<a href=\"http://192.168.10.70/join/emailAuth.sz?key="+code+"\">인증하기</a>";
			msg.setText(text, "UTF-8", "html");
			sender.send(msg);
			session.setAttribute("code", code);
		}catch(Exception e) {
			System.out.println(e);
		}
		return mav;
	}
}
