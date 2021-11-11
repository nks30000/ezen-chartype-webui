package charType.account.profile.config;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import charType.cons.listMbti;
import charType.member.MemberModel;
import charType.member.MemberService;
import charType.utils.common.mapper.CommandMap;

@Controller
@RequestMapping(value="/account/profile/config")
public class ConfigController {

	Logger log = Logger.getLogger(this.getClass()); 
	
	@Resource(name="memberService")
	private MemberService memberService;
	//정보 수정
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public ModelAndView memeberModify(@ModelAttribute("mem") MemberModel mem,
			HttpSession session ) throws Exception {
		ModelAndView mv = new ModelAndView(); 
		
		String[] mbtiList = listMbti.MBTI;
		mv.addObject("mbtiList", mbtiList);
		
		String id=(String) session.getAttribute("session_mem_id");
		mem=memberService.getMem(id);
		
		mv.setViewName("front/account/profile/config/account_profile_config_modify");
		mv.addObject("mem", mem); 
		
		return mv;
	}
		
		
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public ModelAndView memberModifyEnd(CommandMap commandMap, @ModelAttribute("mem") MemberModel mem, BindingResult bindingResult,
			HttpSession session, MultipartHttpServletRequest request ) throws Exception { 

		ModelAndView mv = new ModelAndView();
		
		String id=(String) session.getAttribute("session_mem_id");
		mem.setId(id);	
		
		//공개여부설정 처리
//		if( mem.getPrivate_yn() ==  null) {
//			mem.setPrivate_yn("N");
//		} else {
//			mem.setPrivate_yn("Y");
//		}
		
		memberService.updatemodify(mem);
		mem = memberService.selectIdMember(mem.getId());
		if (mem != null) {
			session.setAttribute("session_mem_nick", mem.getNick());
		}
		
		memberService.updateProfileImg(commandMap.getMap(), request);
		
		mv.setViewName("redirect:/front/account/profile/timeline/"+id);
		return mv;
	}
	
}
