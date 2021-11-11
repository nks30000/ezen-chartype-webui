package charType.like;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import charType.utils.common.mapper.CommandMap;

@Controller
@RequestMapping(value="/like")
public class LikeController {
	
	@Resource(name="likeService")
	private LikeService likeService;
	
	@RequestMapping(value="/timeline/insertLike")
	public ModelAndView insertLikeTimeline(CommandMap commandMap)
		throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		likeService.insertTimelineLike(commandMap.getMap());
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
