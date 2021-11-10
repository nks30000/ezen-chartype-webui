package charType.popup;

import charType.like.LikeService;
import charType.account.profile.timeline.TimelineService;
import charType.alram.AlramService;
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
import javax.servlet.http.HttpSession;



@Controller
@RequestMapping(value="/community/timeline")
public class PopupController {
	
	@Resource(name="popupService")
	private PopupService popupService;
	
	@Resource(name="timelineService")
	private TimelineService timelineService;
	
	@Resource(name="likeService")
	private LikeService likeService;
	
	@Resource(name="alramService")
	private AlramService alramService;
	
	//게시글 보기
	@RequestMapping(value="/detail")
	public ModelAndView communityBoardDetail( CommandMap commandMap, HttpServletRequest request)
		throws Exception {		
		
		ModelAndView mv = new ModelAndView("/front/community/timeline/community_timeline_detail");
		//현재 사용자가 해당 게시물에 좋아요를 하였는지 유무를 체크 하기 위해 세션값을 넣어줌
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("session_mem_id");
		Map<String, Object> likeCheckMap = commandMap.getMap();
		likeCheckMap.put("USER_ID", userId);
		
		Map<String, Object> timelineMap = popupService.selectOneCommunityTimeline(commandMap.getMap());
		List<Map<String, Object>> commentList = popupService.selectComment(commandMap.getMap());
		List<Map<String, Object>> imgList = popupService.selectOneCommunityTimelineImage(commandMap.getMap());
		List<Map<String, Object>> likeList = likeService.selectBoardLike(commandMap.getMap());
				
		//좋아요 유무 확인 = 0 없음, 1 있음
		int likeCheck = likeService.selectTimelineLikeCheck(likeCheckMap);
		timelineMap.put("likeCheck", likeCheck);
		
		//좋아요 수 입력
		int likeCnt = likeList.size();
		timelineMap.put("likeCnt", likeCnt);
		
		//댓글 수 입력
		int commentCnt = commentList.size();	 
		timelineMap.put("commentCnt", commentCnt);
		
		mv.addObject("likeList",likeList);							//좋아요 리스트
		mv.addObject("timelineMap", timelineMap); 	//게시글
		mv.addObject("commentList",commentList);		//댓글리스트
		mv.addObject("imgList", imgList);						//게시물 이미지 리스트
		
		return mv;
	}
	
	//팝업 시 게시글 보기
	@RequestMapping(value="/popup")
	@ResponseBody
	public ModelAndView communityBoardPopup(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("jsonView");		
		//현재 사용자가 해당 게시물에 좋아요를 하였는지 유무를 체크 하기 위해 세션값을 넣어줌
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("session_mem_id");
		Map<String, Object> likeCheckMap = commandMap.getMap();
		likeCheckMap.put("USER_ID", userId);		
		
		Map<String, Object> timelineMap = popupService.selectOneCommunityTimeline(commandMap.getMap());		
		List<Map<String, Object>> commentList = popupService.selectComment(commandMap.getMap());
		List<Map<String, Object>> imgList = popupService.selectOneCommunityTimelineImage(commandMap.getMap());
		List<Map<String, Object>> likeList = likeService.selectBoardLike(commandMap.getMap());
		
		//좋아요 유무 확인
		int likeCheck = likeService.selectTimelineLikeCheck(likeCheckMap);
		timelineMap.put("likeCheck", likeCheck);
		
		//좋아요 수 입력
		int likeCnt = likeList.size();
		timelineMap.put("likeCnt", likeCnt);
		
		//댓글 수 입력		
		int commentCnt = commentList.size(); 				//총 댓글수
		timelineMap.put("commentCnt", commentCnt);
		
		mv.addObject("likeList",likeList);							//좋아요 리스트
		mv.addObject("timelineMap", timelineMap); 	//게시글
		mv.addObject("commentList",commentList);		//댓글리스트
		mv.addObject("imgList", imgList);						//게시글 이미지 리스트
		System.out.println("전송");
		return mv;
	}
	
	//게시글 수정
	@RequestMapping(value="/modify")
	public ModelAndView accountTimelineModify(CommandMap commandMap)
		throws Exception {
		String board_num = (String) commandMap.get("BOARD_NUM");
		String id = (String) commandMap.get("ID");
		
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail?BOARD_NUM="+board_num+"&ID="+id);
		
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
		String board_num = (String) commandMap.get("BOARD_NUM");
		String id = (String) commandMap.get("ID");
		String board_id = (String) commandMap.get("BOARD_ID");
		System.out.println(board_id+","+id);
		
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail?BOARD_NUM="+board_num+"&ID="+id);
		
		popupService.writeComment(commandMap.getMap());		
		
		
		commandMap.put("REG_ID", id);
		commandMap.put("ALRAM_ID", board_id);
		commandMap.put("ALRAM_CONTNUM", board_num);
		commandMap.put("ALRAM_INDEX_NO", 1);
		
		System.out.println(commandMap.get("REG_ID")+","+commandMap.get("ALRAM_ID"));
		
		alramService.regAlram(commandMap.getMap());
		
		return mv;
	}
	
	//팝업 시 댓글 입력
		@RequestMapping(value="/popup/commentWrite")
		public ModelAndView popupWriteComment(CommandMap commandMap)
			throws Exception {
			ModelAndView mv = new ModelAndView("jsonView");
			
			String board_num = (String) commandMap.get("BOARD_NUM");
			String id = (String) commandMap.get("ID");
			String board_id = (String) commandMap.get("BOARD_ID");
			System.out.println(board_id+","+id);
			
			popupService.writeComment(commandMap.getMap());	
			
			commandMap.put("REG_ID", id);
			commandMap.put("ALRAM_ID", board_id);
			commandMap.put("ALRAM_CONTNUM", board_num);
			commandMap.put("ALRAM_INDEX_NO", 1);
			
			System.out.println(commandMap.get("REG_ID")+","+commandMap.get("ALRAM_ID"));
			
			alramService.regAlram(commandMap.getMap());
			return mv;
		}	
	
	//댓글 삭제
	@RequestMapping(value="/commentDelete")
	public ModelAndView deleteComment(CommandMap commandMap)
		throws Exception {
		String board_num = (String) commandMap.get("BOARD_NUM");
		String id = (String) commandMap.get("ID");
		
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail?BOARD_NUM="+board_num+"&ID="+id);
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
		String board_num = (String) commandMap.get("BOARD_NUM");
		String id = (String) commandMap.get("ID");
		
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail?BOARD_NUM="+board_num+"&ID="+id);
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


