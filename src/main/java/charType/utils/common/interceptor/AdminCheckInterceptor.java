package charType.utils.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import charType.member.MemberModel;
import charType.member.MemberService;

public class AdminCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	MemberService memberService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
//		System.out.println("SC: postHandle()");
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
//		System.out.println("SC: afterCompletion()");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		System.out.println("SC: preHandle()");
		HttpSession session = request.getSession(false);
		
		String sessionId = (String)session.getAttribute("session_mem_id");
		
		if(sessionId != null) {
			
			MemberModel user = memberService.getMem(sessionId);
			System.out.println(user.getAdmin_yn());
			if(user != null && user.getAdmin_yn().equals("Y")) {
				
			} else {
				response.sendRedirect(request.getContextPath()+"/admin/error/notadmin");
				return false;
			}
 		} 
		
		if( sessionId == null || sessionId.equals("")){
 			response.sendRedirect(request.getContextPath()+"/admin/error/notadmin");
 			
			return false;
 		}
		
		return super.preHandle(request, response, handler);
	}

}