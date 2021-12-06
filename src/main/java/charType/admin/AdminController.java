package charType.admin;

import java.util.HashMap;
import java.util.List; 
import java.util.Map; 

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import charType.admin.AdminService;
import charType.account.follow.FollowService;
import charType.admin.AdminDAO;
import charType.utils.common.mapper.CommandMap;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	
	@Resource(name="adminService") 
	private AdminService adminService; 
	
	@RequestMapping(value="/member/memberlist") 
	public ModelAndView adminMemberList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/member/admin_member_list");
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("session_mem_id");
		
		
		// 유저 리스트 가져오기
		List<Map<String, Object>> allUserList = adminService.alluserData(commandMap.getMap());
		commandMap.put("allUserList", allUserList);
		
		mv.addObject("map", commandMap.getMap());
		return mv;
		
		
	}
	@RequestMapping(value="/error/notadmin") 
	public ModelAndView notAdmin(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/error/admin_error_notadmin");
		
		return mv;
		
		
	}

}
