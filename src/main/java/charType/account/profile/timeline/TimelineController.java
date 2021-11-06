package charType.account.profile.timeline;

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

import charType.account.follow.FollowService;
import charType.member.MemberModel;
import charType.member.MemberService;
import charType.utils.common.mapper.CommandMap;


@Controller
@RequestMapping(value="/front/account/profile")
public class TimelineController {
	
	Logger log = Logger.getLogger(this.getClass()); 
	
	@Resource(name="timelineService") 
	private TimelineService timelineService; 
	
	@Resource(name="followService") 
	private FollowService followService; 
	
	@Resource(name="memberService") 
	private MemberService memberService; 
	
	@RequestMapping(value="/timeline") 
	public ModelAndView accountTimelineMain(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		
		ModelAndView mv = new ModelAndView("/front/account/profile/timeline/account_profile_timeline_main"); 
		if(commandMap.getMap().get("ID") == null) {
			//파라미터없을때 임시 코드
			 HttpSession session = request.getSession();
				/*
				 * session.setAttribute("ID", "EZZ02"); 
				 * session.setAttribute("NICK", "EZZ02");
				 * session.setAttribute("MBTI", "INFP");
				 */
		
			
			commandMap.put("ID", (String)session.getAttribute("session_mem_id")); 
			String sessionId = (String)session.getAttribute("session_mem_id"); 
			mv.addObject("ID", sessionId);
		} else {
			String id= (String)commandMap.get("ID");
            mv.addObject("ID", id);
		}
		List<Map<String,Object>> list = timelineService.selectAccountTimeline(commandMap.getMap(), request);
		mv.addObject("list", list);
		
		List<Map<String,Object>> life = timelineService.selectAccountTimelineLife(commandMap.getMap());
		mv.addObject("life", life);
		
		List<Map<String,Object>> fav = timelineService.selectAccountTimelineFav(commandMap.getMap());
		mv.addObject("fav", fav);
		
		List<Map<String,Object>> shop = timelineService.selectAccountTimelineShop(commandMap.getMap());
		mv.addObject("shop", shop);
		
		List<Map<String,Object>> style = timelineService.selectAccountTimelineStyle(commandMap.getMap());
		mv.addObject("style", style);
		
		
		return mv; 
		}
	
	
	@RequestMapping(value="/timeline/{pageId}") 
	public ModelAndView accountTimeline(CommandMap commandMap, HttpServletRequest request, @PathVariable String pageId) throws Exception{ 
		
		ModelAndView mv = new ModelAndView("/front/account/profile/timeline/account_profile_timeline_main"); 
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("session_mem_id");
		
		commandMap.put("pageId", pageId);		
				
		//following_id: 팔로우 하는 사람, 
		//follow_id: 팔로우 당하는사람
		commandMap.put("following_id", userId);
		commandMap.put("follow_id", pageId);
		
		if(pageId.equals(userId)) { 
		 //자신의 타임라인 페이지일때
			return mv;
		} else {
			//다른사람의 타임라인 페이지일때
			//팔로우 상태인지를 검사 
			int followYN = followService.followExist(commandMap.getMap());
			
			commandMap.put("followYN", followYN);
			
			//pagdId의 팔로워 수 	
			List<Map<String, Object>> followList = followService.followerViewData(commandMap.getMap());
//			mv.addObject("followCnt",followList.size());	
			commandMap.put("followCnt", followList.size());
			
			//pagdId의 팔로잉 수 
			List<Map<String, Object>> followingList = followService.followingViewData(commandMap.getMap());
//			mv.addObject("followingCnt",followingList.size());
			commandMap.put("followingCnt", followingList.size());
		}
		
		mv.addObject("map", commandMap.getMap());
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
