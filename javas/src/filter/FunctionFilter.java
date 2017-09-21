package filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FunctionFilter extends HttpFilter {

	@Override
	protected void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
			throws IOException, ServletException {

		HttpSession session = req.getSession();
		String uri = req.getRequestURI();
		 boolean b = true;
		if(session.getAttribute("calendar") == null && uri.equals("/function/calendar.jv") ){
			b = false;
			System.out.println("cccc");
		}else if(session.getAttribute("fitness") == null  && uri.equals("/function/fitness.jv")){
			b = false;
			System.out.println("fffff");
		}else if(session.getAttribute("asset") == null  && uri.equals("/function/asset.jv")){
			b = false;
			System.out.println("aaaaaaaaa");
		}		
		  if(b) {
		         chain.doFilter(req, resp);
		         System.out.println("작동!!!!");
		      }else {
		         resp.sendRedirect("/store/alert.jv");
		         System.out.println("작동ㅇ!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		      }
	}
}
