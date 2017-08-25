package controller;




import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping({"/", "/index.sz"})
	public String toIndex() {
		return "t_base";
	}
	
}