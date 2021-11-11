package charType.account.follow;

import charType.alram.AlramService;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@Resource(name="alramService")
	private AlramService alramService;

	// 팔로우 리스트
	@RequestMapping(value = "/follow_list/{fId}")
	public ModelAndView followList(CommandMap commandMap, HttpServletRequest request, @PathVariable String fId) throws Exception {
		ModelAndView mv = new ModelAndView("/front/account/follow/follow_List");
		
		commandMap.put("pageId", fId);
		commandMap.put("fId", fId);
		commandMap.put("follow_Id", fId);
		commandMap.put("following_Id", fId);
		commandMap.put("pageId", fId);
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("session_mem_id");
		commandMap.put("userId", userId);
		
		
		// 팔로우 유무 체크
		List<Map<String, Object>> followList = followService.followerViewData(commandMap.getMap());
		
		
		int index = 0;
		System.out.println("userId:"+userId);
		for(Map<String, Object> row : followList) {
			String rowId = (String) row.get("ID");
			System.out.println("rowId: "+rowId);
			
			CommandMap rowMap = new CommandMap();
			rowMap.put("follow_id", rowId );
			rowMap.put("following_id", userId  );
			int rowFollowCnt = followService.followExist(rowMap.getMap());
			row.put("rowFollowCnt", rowFollowCnt);
			followList.set(index, row);
			index++; 
		}
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
	public ModelAndView deleteFollow(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("session_mem_id");
		String fId  = (String) commandMap.get("fId");//파라미터로 넘어온 fId값
		//following_id: 팔로우 하는 사람, 
		//follow_id: 팔로우 당하는사람
		commandMap.put("following_id", userId);
		commandMap.put("follow_id", fId);

		followService.followDel(commandMap.getMap());
		
		mv.setViewName("redirect:/front/account/profile/timeline/" + fId);
		
		return mv;

	}

	// 팔로우
	@RequestMapping(value = "/requestFollow")
	@ResponseBody
	public ModelAndView requestFollow(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("session_mem_id");
		String fId  = (String) commandMap.get("fId");//파라미터로 넘어온 fId값
		//following_id: 팔로우 하는 사람, 
		//follow_id: 팔로우 당하는사람
		commandMap.put("following_id", userId);
		commandMap.put("follow_id", fId);
		followService.followReg(commandMap.getMap());
		
		int contNum = 0;
		int indexNum = 3;
		commandMap.put("REG_ID", userId);
		commandMap.put("ALRAM_ID", fId);
		commandMap.put("ALRAM_CONTNUM", 0);
		commandMap.put("ALRAM_INDEX_NO", 3);
		
		System.out.println(commandMap.get("REG_ID")+","+commandMap.get("ALRAM_ID"));
		
		alramService.regAlram(commandMap.getMap());
		
		
		System.out.println(request.getRequestURI());
		mv.setViewName("redirect:/front/account/profile/timeline/" + fId);
		
		
		return mv;

	}
}


