package charType.Like;

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
	
	@RequestMapping(value="/reg")
	public ModelAndView likeReg(CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail");
			likeService.likeReg(commandMap.getMap());	
			
			/* String alram_id = AlramService.reg */
			
			return mv;
		}
	
	@RequestMapping(value="/del")
	public ModelAndView likeDel(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/community/timeline/detail");
		likeService.likeDel(commandMap.getMap());
		
		
		
		return mv;
		}
	
	
	  @RequestMapping(value="/count") 
	  public ModelAndView likeCount(CommandMap commandMap) throws Exception { 
		  ModelAndView mv = new ModelAndView();
		  likeService.likeCount(commandMap.getMap()); 
		  return mv; 
		 }
	  
	  
	 

	

	 
	
}
