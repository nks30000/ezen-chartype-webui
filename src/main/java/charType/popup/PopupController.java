package charType.popup;

import charType.utils.common.mapper.CommandMap;

import java.util.Map;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping(value="/community/timeline")
public class PopupController {
	
	@Resource(name="popupService")
	private PopupService popupService;	
	
	//팝업 게시글 보기
	@RequestMapping(value="/detail")
	public ModelAndView communityBoardDetail(CommandMap commandMap, HttpServletRequest request)
		throws Exception {
		ModelAndView mv = new ModelAndView("/front/community/timeline/community_timeline_detail");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("ID", "ID2");
		session.setAttribute("NICK", "ENIGMA");
		session.setAttribute("MBTI", "INFP");
		session.setAttribute("PROF_IMG", "demo_img4");
		
		
		if(commandMap.isEmpty()) {
			//파라미터없을때 임시 코드
			commandMap.put("BOARD_NUM", 1);
			commandMap.put("ID", "ID1");
		Map<String, Object> timelineMap = popupService.selectOneCommunityTimeline(commandMap.getMap());		
		List<Map<String, Object>> commentList = popupService.selectComment(commandMap.getMap());
		List<Map<String, Object>> imgList = popupService.selectOneCommunityTimelineImage(commandMap.getMap());
		
		int commentCnt = commentList.size(); 				//총 댓글수
		timelineMap.put("commentCnt", commentCnt);
		
		mv.addObject("timelineMap", timelineMap); 		//게시글
		mv.addObject("commentList",commentList);		//댓글리스트
		mv.addObject("imgList", imgList);		
		
		} else {
			Map<String, Object> timelineMap = popupService.selectOneCommunityTimeline(commandMap.getMap());
			mv.addObject("timelineMap", timelineMap);
			List<Map<String, Object>> commentList = popupService.selectComment(commandMap.getMap());
			int commentCnt = commentList.size();	 
			timelineMap.put("commentCnt", commentCnt);
			List<Map<String, Object>> imgList = popupService.selectOneCommunityTimelineImage(commandMap.getMap());
			mv.addObject("timelineMap", timelineMap); 		//게시글
			mv.addObject("commentList",commentList);		//댓글리스트
			mv.addObject("imgList", imgList);
		}
		return mv;
	}
	
	//댓글 입력
	@RequestMapping(value="/commentWrite")
	public ModelAndView writeComment(CommandMap commandMap)
		throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail");
		
		popupService.writeComment(commandMap.getMap());		
		return mv;
	}
	
	
	//댓글 삭제
	@RequestMapping(value="/commentDelete")
	public ModelAndView deleteComment(CommandMap commandMap)
		throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail");
		popupService.deleteComment(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value="/commentModify")
	public ModelAndView modifyComment(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail");
		popupService.modifyComment(commandMap.getMap());
		return mv;
	}
	
	
	
	
	
	
	
}
