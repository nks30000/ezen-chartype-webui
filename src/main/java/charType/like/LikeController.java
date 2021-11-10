package charType.like;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import charType.alram.AlramService;
import charType.utils.common.mapper.CommandMap;

@Controller
@RequestMapping(value="/like")
public class LikeController {
	
	@Resource(name="likeService")
	private LikeService likeService;
	
	@Resource(name="alramService")
	private AlramService alramService;
	
	@RequestMapping(value="/timeline/insertLike")
	public ModelAndView insertLikeTimeline(CommandMap commandMap)
		throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		String board_num = (String) commandMap.get("BOARD_NUM");
		String id = (String) commandMap.get("USER_ID");
		String board_id = (String) commandMap.get("BOARD_ID");
		System.out.println(board_id+","+id+","+board_num);
		
		likeService.insertTimelineLike(commandMap.getMap());
		
		commandMap.put("REG_ID", id);
		commandMap.put("ALRAM_ID", board_id);
		commandMap.put("ALRAM_CONTNUM", board_num);
		commandMap.put("ALRAM_INDEX_NO", 2);
		
		System.out.println(commandMap.get("REG_ID")+","+commandMap.get("ALRAM_ID")+","+commandMap.get("ALRAM_CONTNUM"));
		alramService.regAlram(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/timeline/deleteLike")
	public ModelAndView deleteLikeTimeline(CommandMap commandMap)
		throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		likeService.deleteTimelineLike(commandMap.getMap());
		return mv;
	}

}
