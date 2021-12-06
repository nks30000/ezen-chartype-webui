package charType.community.timeline;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import charType.alram.AlramService;
import charType.utils.common.mapper.CommandMap;

@Controller
@RequestMapping(value="/front/community/timeline")
public class CommunityController {

	Logger log = Logger.getLogger(this.getClass()); 
	
	
	@Resource(name="communityService") 
	private CommunityService communityService; 
	
	@Resource(name="alramService")
	private AlramService alramService;
	
	
	@RequestMapping(value="/list") 
	public ModelAndView communityTimelineList(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("/front/community/timeline/community_timeline_list"); 
				
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("session_mem_id");
		
		commandMap.put("ID", userId);
		commandMap.put("ALRAM_ID", userId);
		
		List<Map<String,Object>> list = communityService.selectListCommunityTimeline(commandMap.getMap());
		mv.addObject("list", list);
		
		List<Map<String,Object>> priv = communityService.selectPrivateCommunityTimeline(commandMap.getMap());
		mv.addObject("priv", priv);
		
		List<Map<String, Object>> alramCnt = alramService.selectOne(commandMap.getMap());
		mv.addObject("alramCnt", alramCnt);
		
		
		return mv;
	}
	
	@RequestMapping(value="/search") 
	public ModelAndView communityStorySearch(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("/front/community/timeline/community_timeline_search"); 
				
		List<Map<String,Object>> nick = communityService.communityStorySearchNick(commandMap.getMap(), request);
		mv.addObject("nick", nick);
		
		return mv;
	}
	
	
	
}
