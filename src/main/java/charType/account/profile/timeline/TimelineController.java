package charType.account.profile.timeline;

import java.util.List; 
import java.util.Map; 

import javax.annotation.Resource; 

import org.apache.log4j.Logger; 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/front/account/profile")
public class TimelineController {
	
	Logger log = Logger.getLogger(this.getClass()); 
	
	@Resource(name="timelineService") 
	private TimelineService timelineService; 
	
	@RequestMapping(value="/timeline") 
	public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{ 
		
		ModelAndView mv = new ModelAndView("/front/account/profile/timeline/account_profile_timeline_main"); 
		if(commandMap.isEmpty()) {
			//파라미터없을때 임시 코드
			commandMap.put("ID", "EZZ01");
			List<Map<String,Object>> list = timelineService.selectAccountTimeline(commandMap);
			mv.addObject("list", list);
		} else {
			List<Map<String,Object>> list = timelineService.selectAccountTimeline(commandMap); 
			
			mv.addObject("list", list);
		}
		return mv; 
		}

}
