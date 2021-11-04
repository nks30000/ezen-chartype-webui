package charType.utils.common.session;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class SessionCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		System.out.println("SC: postHandle()");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		System.out.println("SC: afterCompletion()");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("SC: preHandle()");
		HttpSession session = request.getSession(false);
		//1. getSession(), getSession(true)
		// - HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 세션을 생성합니다
		//2. getSession(false)
		// - HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 생성하지 않고 그냥 null을 반환합니다
		if (session == null) {
//			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			response.sendRedirect(request.getContextPath()+"/member/login/pleaselogin");
			return false;
		}
		if (session.getAttribute("session_mem_id") == null) {
//			response.sendError(HttpServletResponse.SC_FORBIDDEN);
			response.sendRedirect(request.getContextPath()+"/member/login/pleaselogin");
			return false;
		}
		return true;
	}

}