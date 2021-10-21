package charType.comment;

import charType.utils.common.mapper.CommandMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping(value="/community/timeline")
public class CommentController {
	
	@RequestMapping(value="/commentWrite")
	public ModelAndView writeComment(CommandMap commandMap)
		throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping(value="/commentSelect")
	public ModelAndView selectComment(CommandMap commandMap)
		throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	@RequestMapping(value="/commentDelete")
	public ModelAndView deleteComment(CommandMap commandMap)
		throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}

	
	
	
	
	
	
	
}
