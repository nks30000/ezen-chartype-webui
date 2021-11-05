package charType.account.follow;

import charType.member.MemberDao;
import charType.member.MemberModel;
import charType.member.MemberService;
import charType.popup.PopupService;
import charType.utils.common.mapper.CommandMap;

import java.util.Map;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/follow")
public class FollowController {

	
	@Resource(name = "followService")
	private FollowService followService;

	@Resource(name = "memberService")
	private MemberService memberService;

	// 팔로우 리스트
	@RequestMapping(value = "/follow_list/{fId}")
	public ModelAndView followList(CommandMap commandMap, HttpServletRequest request, @PathVariable String fId) throws Exception {
		ModelAndView mv = new ModelAndView("/front/account/follow/follow_List");
		
		commandMap.put("pageId", fId);
		commandMap.put("fId", fId);
		System.out.println(fId);
		commandMap.put("follow_Id", fId);
		commandMap.put("following_Id", fId);
		commandMap.put("pageId", fId);
		
		
		// 팔로우 유무 체크
		List<Map<String, Object>> followList = followService.followerViewData(commandMap.getMap());
		
		commandMap.put("followList", followList);
	
		int followLCnt = followList.size();
		commandMap.put("followLCnt", followLCnt);
			
		mv.addObject("map", commandMap.getMap());
		
		return mv;
	}

	// 팔로잉 리스트
	@RequestMapping(value = "/following_list/{fId}")
	public ModelAndView followingList(CommandMap commandMap, HttpServletRequest request, @PathVariable String fId) throws Exception {
		ModelAndView mv = new ModelAndView("/front/account/follow/following_List");

		commandMap.put("pageId", fId);
		commandMap.put("fId", fId);

		// 팔로잉 유무 체크
		List<Map<String, Object>> followingList = followService.followingViewData(commandMap.getMap());
		commandMap.put("followingList", followingList);
		commandMap.put("follow_id", fId);
		commandMap.put("following_id", fId);
		System.out.println("followingList.size() : "+followingList.size());


		int followingCnt = followingList.size();
		commandMap.put("followingCnt", followingCnt);
		mv.addObject("map", commandMap.getMap());
		return mv;
	}

	// 팔로우 삭제
	@RequestMapping(value = "/deleteFollow")
	public ModelAndView deleteFollow(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		String userId = request.getParameter("user_id");
		HttpSession session = request.getSession();
		String following_id = (String) session.getAttribute("session_mem_id");

		CommandMap commandMap = new CommandMap();
		commandMap.put("following_id", following_id);
		commandMap.put("follow_id", userId);
		int followCnt = followService.followExist(commandMap.getMap());
		
		if (followCnt != 0) {
			followService.followDel(commandMap.getMap());
		}
		mv.setViewName("redirect:/front/account/profile/timeline/" + userId);
		return mv;

	}

	// 팔로우
	@RequestMapping(value = "/requestFollow")
	public ModelAndView requestFollow(HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView();

		String userId = request.getParameter("user_id");
		HttpSession session = request.getSession();
		String follow_id = (String) session.getAttribute("session_mem_id");

		CommandMap commandMap = new CommandMap();
		commandMap.put("follow_id", follow_id);
		commandMap.put("following_id", userId);

		int followCnt = followService.followExist(commandMap.getMap());

		if (followCnt == 0) {
			followService.followReg(commandMap.getMap());
		}
		mv.setViewName("redirect:/front/account/profile/timeline/" + userId);
		return mv;

	}
}
