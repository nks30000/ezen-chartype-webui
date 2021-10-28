package charType.account.profile.timeline;

import java.util.List; 
import java.util.Map; 

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger; 
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import charType.utils.common.mapper.CommandMap;


@Controller
@RequestMapping(value="/front/account/profile")
public class TimelineController {
	
	Logger log = Logger.getLogger(this.getClass()); 
	
	@Resource(name="timelineService") 
	private TimelineService timelineService; 
	
	@RequestMapping(value="/timeline") 
	public ModelAndView accountTimelineMain(Map<String,Object> commandMap, HttpServletRequest request) throws Exception{ 
		
		ModelAndView mv = new ModelAndView("/front/account/profile/timeline/account_profile_timeline_main"); 
		if(commandMap.isEmpty()) {
			
			  HttpSession session = request.getSession();
		      
		      session.setAttribute("ID", "EZZ02");
		      session.setAttribute("NICK", "EZZ02");
		      session.setAttribute("MBTI", "INFP");
			
			//파라미터없을때 임시 코드
			commandMap.put("ID", "EZZ02");
			List<Map<String,Object>> list = timelineService.selectAccountTimeline(commandMap);
			mv.addObject("list", list);
			

			
		} else {
			  HttpSession session = request.getSession();
		      
		      session.setAttribute("ID", "EZZ02");
		      session.setAttribute("NICK", "EZZ02");
		      session.setAttribute("MBTI", "INFP");
			
			List<Map<String,Object>> list = timelineService.selectAccountTimeline(commandMap); 
			mv.addObject("list", list);


		}
		
		
		return mv; 
		}

	@RequestMapping(value="/form")
	public ModelAndView accountTimelineForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/front/account/profile/timeline/account_profile_timeline_form");
		
		  HttpSession session = request.getSession();
	      
	      session.setAttribute("ID", "EZZ02");
	      session.setAttribute("NICK", "EZZ02");
	      session.setAttribute("MBTI", "INFP");
		
		return mv;
	}
	
	
	@RequestMapping(value="/write")
	public ModelAndView accountTimelineWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/front/account/profile/timeline");
		
		timelineService.writeAccountTimeline(commandMap.getMap(), request);
		
		return mv;
	}
	
	
/*	
	커맨드 맵으로 가져오기
	public ModelAndView accountTimelineDel(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/front/account/profile/timeline");
		
		timelineService.delAccountTimeline(commandMap.getMap());
		
		return mv;*/
	@RequestMapping(value="/delete")
	public ModelAndView accountTimelineDel(@RequestParam("num") int BOARD_NUM) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/front/account/profile/timeline");
		
		timelineService.delComment(BOARD_NUM);
		
		timelineService.delTimelineFile(BOARD_NUM);
		
		timelineService.delAccountTimeline(BOARD_NUM);
		
		
		
		return mv;
	}
	
	
	/*
	 * @RequestMapping(value="/uploadFile")
	 * 
	 * 
	 * 
	 * @RequestMapping(value="/deleteFile")
	 */
}
