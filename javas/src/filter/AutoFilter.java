package filter;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AutoFilter implements Filter{


	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
	HttpServletRequest req = (HttpServletRequest)arg0;
	HttpServletResponse resp = (HttpServletResponse)arg1;
	
	Cookie[] ar = req.getCookies();
	if(ar != null) {
		for(Cookie c : ar) {
			if(c.getName().equals("login")) {
				req.getSession().setAttribute("auth", c.getValue());
			}
		}
	}else {
		
	}
	chain.doFilter(arg0, arg1);	
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
