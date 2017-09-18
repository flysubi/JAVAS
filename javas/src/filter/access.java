package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class access implements Filter {
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		String uri = request.getRequestURI();
		
		HttpSession session = request.getSession();
		if(session.getAttribute("auth") == null) {
			if(uri.startsWith("/freetalk/allTalks") ||uri.startsWith("/question/list") ) {
				chain.doFilter(req, resp);
			} else {
				response.sendRedirect("/user/login.jv");
			}
		} else {
			chain.doFilter(req, resp);
		}
	}
}

