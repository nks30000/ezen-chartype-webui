package charType.popup;

import charType.account.profile.timeline.TimelineService;
import charType.utils.common.mapper.CommandMap;

import java.util.Map;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;



@Controller
@RequestMapping(value="/community/timeline")
public class PopupController {
	
	@Resource(name="popupService")
	private PopupService popupService;
	
	@Resource(name="timelineService")
	private TimelineService timelineService;
	
	//게시글 보기
	@RequestMapping(value="/detail")
	public ModelAndView communityBoardDetail( CommandMap commandMap, HttpServletRequest request)
		throws Exception {		
		
		ModelAndView mv = new ModelAndView("/front/community/timeline/community_timeline_detail");
		
		if(commandMap.isEmpty()) {
			//파라미터없을때 임시 코드

		
		Map<String, Object> timelineMap = popupService.selectOneCommunityTimeline(commandMap.getMap());		
		List<Map<String, Object>> commentList = popupService.selectComment(commandMap.getMap());
		List<Map<String, Object>> imgList = popupService.selectOneCommunityTimelineImage(commandMap.getMap());
		
		int commentCnt = commentList.size(); 				//총 댓글수
		timelineMap.put("commentCnt", commentCnt);
		
		mv.addObject("timelineMap", timelineMap); 		//게시글
		mv.addObject("commentList",commentList);		//댓글리스트
		mv.addObject("imgList", imgList);						//게시글 이미지
		
		} else {
			Map<String, Object> timelineMap = popupService.selectOneCommunityTimeline(commandMap.getMap());
			List<Map<String, Object>> commentList = popupService.selectComment(commandMap.getMap());
			List<Map<String, Object>> imgList = popupService.selectOneCommunityTimelineImage(commandMap.getMap());
			
			int commentCnt = commentList.size();	 
			timelineMap.put("commentCnt", commentCnt);
			
			mv.addObject("timelineMap", timelineMap); 		//게시글
			mv.addObject("commentList",commentList);		//댓글리스트
			mv.addObject("imgList", imgList);
		}
		return mv;
	}
	
	//팝업 시 게시글 보기
	@RequestMapping(value="/popup")
	@ResponseBody
	public ModelAndView communityBoardPopup(CommandMap commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		/* String aaa = (String)commandMap.get("ID"); */
		System.out.println(commandMap.getMap());
		
		Map<String, Object> timelineMap = popupService.selectOneCommunityTimeline(commandMap.getMap());		
		List<Map<String, Object>> commentList = popupService.selectComment(commandMap.getMap());
		List<Map<String, Object>> imgList = popupService.selectOneCommunityTimelineImage(commandMap.getMap());
		
		int commentCnt = commentList.size(); 				//총 댓글수
		timelineMap.put("commentCnt", commentCnt);
		
		mv.addObject("timelineMap", timelineMap); 		//게시글
		mv.addObject("commentList",commentList);		//댓글리스트
		mv.addObject("imgList", imgList);						//게시글 이미지
		System.out.println("전송");
		return mv;
	}
	
	//게시글 수정
	@RequestMapping(value="/modify")
	public ModelAndView accountTimelineModify(CommandMap commandMap)
		throws Exception {
		
		
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail");
		
		popupService.modifyAccountTimeLine(commandMap.getMap());
		return mv;
	}
	
	//팝업 시 게시글 수정
		@RequestMapping(value="/popup/modify")
		public ModelAndView popupTimelineModify(CommandMap commandMap)
			throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			
			popupService.modifyAccountTimeLine(commandMap.getMap());
			return mv;
		}
		
		//팝업 시 게시글 삭제
		@RequestMapping(value="/popup/delete")
		public ModelAndView accountTimelineDel(@RequestParam("BOARD_NUM") int BOARD_NUM) throws Exception{
			ModelAndView mv = new ModelAndView("jsonView");
			
			timelineService.delComment(BOARD_NUM);
			
			timelineService.delTimelineFile(BOARD_NUM);
			
			timelineService.delAccountTimeline(BOARD_NUM);			
			
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
	
	//팝업 시 댓글 입력
		@RequestMapping(value="/popup/commentWrite")
		public ModelAndView popupWriteComment(CommandMap commandMap)
			throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			
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
	
	//팝업 시 댓글 삭제
		@RequestMapping(value="/popup/commentDelete")
		public ModelAndView popupDeleteComment(CommandMap commandMap)
			throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			popupService.deleteComment(commandMap.getMap());
			return mv;
		}
	
	//댓글 수정
	@RequestMapping(value="/commentModify")
	public ModelAndView modifyComment(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail");
		popupService.modifyComment(commandMap.getMap());
		return mv;
	}
	
	//댓글 수정
		@RequestMapping(value="/popup/commentModify")
		public ModelAndView popupModifyComment(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			popupService.modifyComment(commandMap.getMap());
			return mv;
		}
	
	
	
	
	
	
	
}
