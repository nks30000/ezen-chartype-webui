package charType.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	 
	 @Override
	 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

	  System.out.println("Interceptor : LoginInterceptor");
	  
	  // Session userid check
	  HttpSession session = request.getSession();   
	  String userid = (String) session.getAttribute("session_mem_id");
	  
		  // Login false
		  if(userid == null){
			  response.sendRedirect("/member/pleaseLogin.do");
		 		return false;
		  }
		  else{
			  return super.preHandle(request, response, handler);
		  }
	  
	 }
}
