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


@Controller
@RequestMapping(value="/community/timeline")
public class PopupController {
	
	@Resource(name="popupService")
	private PopupService popupService;
	
	//팝업 게시글 보기
	@RequestMapping(value="/detail")
	public ModelAndView communityBoardDetail(CommandMap commandMap)
		throws Exception {
		ModelAndView mv = new ModelAndView("/front/community/timeline/community_timeline_detail");
		
		if(commandMap.isEmpty()) {
			//파라미터없을때 임시 코드
			commandMap.put("BOARD_NUM", 1);
		Map<String, Object> timelineMap = popupService.selectOneCommunutyTimeline(commandMap.getMap());
		mv.addObject("timelineMap", timelineMap);
		List<Map<String, Object>> commentList = popupService.selectComment(commandMap.getMap());
		mv.addObject("commentList",commentList);
		
		} else {
			Map<String, Object> timelineMap = popupService.selectOneCommunutyTimeline(commandMap.getMap());
			mv.addObject("timelineMap", timelineMap);
			List<Map<String, Object>> commentList = popupService.selectComment(commandMap.getMap());
			mv.addObject("commentList",commentList);
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
	
	@RequestMapping(value="/commentSelect")
	public ModelAndView selectComment(CommandMap commandMap)
		throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	//댓글 삭제
	@RequestMapping(value="/commentDelete")
	public ModelAndView deleteComment(CommandMap commandMap)
		throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}

	
	
	
	
	
	
	
}
