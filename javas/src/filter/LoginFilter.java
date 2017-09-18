package filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;

import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter extends HttpFilter{


   protected void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain)
         throws IOException, ServletException {
      
      HttpSession session = req.getSession();
      String uri = req.getRequestURI();
      boolean b = false;
      if(uri.equals("/freetalk/allTalks.jv") || uri.equals("/question/list.jv")) {
            b = true;
      }
      
      if(session.getAttribute("auth") == null && uri.equals("/freetalk/viewTalk.jv")) {
            session.setAttribute("logo", "freetalk/viewTalk.jv?num="+req.getParameter("num"));
      }
      
      if(session.getAttribute("auth") == null && uri.equals("/freetalk/addNew.jv")) {
         
         session.setAttribute("logo", "freetalk/addNew.jv");
      }
      
      if(session.getAttribute("auth") == null && uri.equals("/question/detail.jv")) {
         
         session.setAttribute("logo", "question/detail.jv?num="+req.getParameter("num"));
      }
      
      if(session.getAttribute("auth") == null && uri.equals("/function/weather.jv")) {
         
         session.setAttribute("logo", "function/weather.jv");
      }
      
      if(session.getAttribute("auth") == null && uri.equals("/function/calendar.jv")) {
          
          session.setAttribute("logo", "function/calendar.jv");
       }
      
      if(session.getAttribute("auth") == null && uri.equals("/function/map.jv")) {
          
          session.setAttribute("logo", "function/map.jv");
       }
      
      if(session.getAttribute("auth") == null && uri.equals("/function/asset.jv")) {
          
          session.setAttribute("logo", "function/asset.jv");
       }
      
      if(session.getAttribute("auth") == null && uri.equals("/function/fitness.jv")) {
          
          session.setAttribute("logo", "function/fitness.jv");
       }
      
      if(session.getAttribute("auth") != null || b) {
         chain.doFilter(req, resp);
      }else {
         resp.sendRedirect("/user/login.sz");
      }
      
      
   }
}

