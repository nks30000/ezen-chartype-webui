package charType.alram;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import charType.utils.common.mapper.CommandMap;

@Controller
@RequestMapping("/alram/list")
public class AlramController {
	
	@Resource(name="alramService")
	private AlramService alramService;
	
	@RequestMapping(value="/like")
	public ModelAndView alramDetail(CommandMap commandMap, HttpServletRequest request)
	throws Exception{
		ModelAndView mv = new ModelAndView("/front/alram/like/alram_like_list");		
		
		
		if(commandMap.isEmpty()) {
			//파라미터없을때 임시 코드
			commandMap.put("ALRAM_ID", "TEST2");
			List<Map<String, Object>> alramList = alramService.alramLoad(commandMap.getMap());
			mv.addObject("alramList", alramList);
			
			
		} else {
			
			List<Map<String, Object>> alramList = alramService.alramLoad(commandMap.getMap());
			mv.addObject("alramList", alramList);
		}
		return mv;
	}
	
	
	@RequestMapping(value="/readAlram")
	public ModelAndView readAlram(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		String sessionId = (String)session.getAttribute("session_mem_id"); 
		ModelAndView mv = new ModelAndView("redirect:/alram/list/like?ALRAM_ID="+sessionId);
		alramService.readAlram(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/readBoard")
	public ModelAndView readBoard(CommandMap commandMap, HttpServletRequest request) throws Exception {		 
		String board_num = (String)commandMap.get("ALRAM_CONTNUM");
		String alram_id = (String)commandMap.get("ALRAM_ID");
		System.out.println(board_num);
		
		
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail?BOARD_NUM="+board_num+"&ID="+alram_id);
		alramService.readAlram(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/readFollow")
	public ModelAndView readFollow(CommandMap commandMap, HttpServletRequest request) throws Exception {
		String reg_id = (String)commandMap.get("REG_ID");
		System.out.println(reg_id);
		System.out.println((String)commandMap.get("ALARM_NUM"));
		
		
		ModelAndView mv = new ModelAndView("redirect:/front/account/profile/timeline/"+reg_id);
		alramService.readAlram(commandMap.getMap());
		return mv;
	}
	
	
	 
	 

	
	
	
	
}
