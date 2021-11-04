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

import charType.utils.common.mapper.CommandMap;

@Controller
@RequestMapping(value="/front/community/timeline")
public class CommunityController {

	Logger log = Logger.getLogger(this.getClass()); 
	
	
	@Resource(name="communityService") 
	private CommunityService communityService; 
	
	
	@RequestMapping(value="/list") 
	public ModelAndView accountTimelineMain(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("/front/community/timeline/community_timeline_list"); 
				
		List<Map<String,Object>> list = communityService.selectListCommunityTimeline(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
}