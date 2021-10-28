package charType.member;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.codehaus.plexus.util.StringUtils;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import charType.member.validator.RegValidator;
import charType.utils.common.mapper.CommandMap;
import charType.member.validator.LoginValidator;
import charType.member.validator.FindIdValidator;
import charType.member.validator.FindPwValidator;
import charType.member.validator.ModifyValidator;
import charType.member.validator.PwChangeValidator;
import charType.cons.charConst;
import charType.cons.listMbti;


@Controller
public class MemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	//file upload path
	private String uploadPath = charConst.UPLOAD_PATH_IMAGE+"mem_prof\\";

	@Resource(name = "memberService")
	private MemberService memberService;
	

	@RequestMapping(value = "/pleaseLogin")
	public String pleaseLogin() {
		
		return "member/pleaseLogin";
	}

	
	@RequestMapping(value = "/member/login/form", method = RequestMethod.GET)
	public ModelAndView loginForm(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		//Session Check
		if(session.getAttribute("id") == null || session.getAttribute("id") =="" ) { //session검증 추가 처리 필요
			mv.setViewName("front/member/login/member_login_form");
		} else {
			mv.setViewName("redirect:/charType/acccount/profile/modify");
		}
		
		
		return mv;
	}
	
	@RequestMapping(value = "/member/login/form", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("mem") MemberModel mem, BindingResult bindingResult, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();

		
		//Validation
		new LoginValidator().validate(mem, bindingResult);
		
		if(bindingResult.hasErrors()){
			mv.setViewName("front/member/login/member_login_form");
			return mv;
		}

		
		MemberModel m = memberService.selectIdMember(mem.getId());
		if( m != null ) {
			if(m.getPassword().equals(mem.getPassword())) {
				//로그인성공
				//세션 생성
				session.setAttribute("session_mem_id", m.getId());
				session.setAttribute("session_mem_nick", m.getNick());
				session.setAttribute("session_mem_mbti", m.getMbti());
				session.setAttribute("session_mem_prof_img", m.getProf_img());
				session.setAttribute("session_mem_back_img", m.getBack_img());
				
				mv.setViewName("redirect:/account/profile/config/modify");//임시로 회원정보수정으로 리다이렉트
			}
			else {
				//비밀번호 틀림
				bindingResult.rejectValue("password", "login.password.duplication");
				mv.setViewName("front/member/login/member_login_form");
			}
		} else {
			//아이디 없음
			bindingResult.rejectValue("id", "login.id.duplication");
			mv.setViewName("front/member/login/member_login_form");
		}
		return mv;
	}
		
//	@RequestMapping(value = "/loginFail", method = RequestMethod.POST)
//	public ModelAndView loginFail(@ModelAttribute("mem") MemberModel mem, BindingResult bindingResult, HttpSession session) throws Exception {
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("front/member/login/member_login_fail");
//		
//		return mv;
//	}
//	@RequestMapping(value = "/loginSuccess", method = RequestMethod.POST)
//	public ModelAndView loginSucess(@ModelAttribute("mem") MemberModel mem, BindingResult bindingResult, HttpSession session) throws Exception {
//		ModelAndView mv = new ModelAndView();
//
//		mv.setViewName("redirect:/community/timeline");
//		
//		return mv;
//	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) throws Exception {
		Enumeration<?> valueNames = session.getAttributeNames();
		while (valueNames.hasMoreElements()) {
			String sessionKey = (String) valueNames.nextElement();
			session.removeAttribute(sessionKey);
		}

		session.invalidate();
		return new ModelAndView("/member/logout");
	}
	
	
	@RequestMapping(value = "/member/sign/form", method = RequestMethod.GET)
	public ModelAndView memRegForm() {
		ModelAndView mv = new ModelAndView("front/member/sign/member_sign_form");
		String[] mbtiList = listMbti.MBTI;
		mv.addObject("mbtiList", mbtiList);
		
		return mv;
	}
	
	@RequestMapping(value = "/member/sign/form", method = RequestMethod.POST)
	public ModelAndView insertMembers(CommandMap commandMap, @ModelAttribute("mem") MemberModel mem, BindingResult bindingResult, HttpSession session, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//validation
//		new RegValidator().validate(mem, bindingResult);
//		if (memberService.selectIdMember(mem.getId()) != null) {
//			bindingResult.rejectValue("id", "reg.id.duplication");
//		}
//		
//		if(bindingResult.hasErrors()){
//			mv.setViewName("member/memberReg");
//			return mv;
//		}
		
		if( mem.getPrivate_yn() ==  null) {
			mem.setPrivate_yn("N");
		}
		
		
		MemberModel m = memberService.insertUser(mem);
		
		log.debug("유저 입력 성공");
		
		if (m != null) {
			session.setAttribute("session_mem_id", m.getId());
			session.setAttribute("session_mem_nick", m.getNick());
			session.setAttribute("session_mem_mbti", m.getMbti());
		}
		log.debug("세션 생성 완료");
//		Iterator<String> keys = commandMap.getMap().keySet().iterator();
//		while( keys.hasNext()) {
//			log.debug("key:" + keys.next());
//		}
//		commandMap.put("is_profile", "Y");
		
		memberService.insertProfileImg(commandMap.getMap(), request);
				
		
		
//		MultipartFile multipartFile = null;
//		
//		while(iterator.hasNext()) {
//			multipartFile = multipartRequest.getFile(iterator.next());
//			if(!multipartFile.isEmpty()) {
//				log.debug("=======================file start=======================");
//				log.debug("name : "+ multipartFile.getName());
//				log.debug("filename : " +  multipartFile.getOriginalFilename());
//				log.debug("byte : " + multipartFile.getSize());
//				log.debug("=======================file end=======================\r\n");
//			}
//		}
		
		mv.setViewName("redirect:/member/login/form");
		return mv;
		
	}
		
		


	@RequestMapping(value = "/memberFind/id", method = RequestMethod.POST)
	public ModelAndView findId(@ModelAttribute("mem") MemberModel mem, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView("memberFindForm");
		mv.addObject("state", "id");
		new FindIdValidator().validate(mem, bindingResult);
		if(bindingResult.hasErrors()){
			return mv;
		} else {
			MemberModel m = memberService.selectFindId(mem);
			if (m == null || StringUtils.isBlank(m.getId())) {
				mv.addObject("message", "입력하신 정보와 일치하는 ID가 없습니다.");
				return mv;
			} else {
				mv.addObject("message", "찾은 ID : <strong>"+m.getId()+"</strong>");
				return mv;
			}
		}
	}
	

	@RequestMapping(value = "/memberFind/pw", method = RequestMethod.POST)
	public ModelAndView findPassword(@ModelAttribute("mem") MemberModel mem, BindingResult bindingResult) throws Exception {
		ModelAndView mv = new ModelAndView("memberFindForm");
		mv.addObject("state", "pw");
		new FindPwValidator().validate(mem, bindingResult);
		if(bindingResult.hasErrors()){
			return mv;
		} else {
			MemberModel m = memberService.selectFindPassword(mem);
			if (m == null || StringUtils.isBlank(m.getPassword())) {
				mv.addObject("message", "입력하신 정보와 일치하는 PW가 없습니다.");
				return mv;
			} else {
				String returnPw = new String(Base64.decodeBase64(m.getPassword().getBytes()));
				m.setPassword(returnPw);
				mv.addObject("message", "찾은 비밀번호 : <strong>"+m.getPassword()+"</strong>");
				return mv;
			}
		}
	}
	
	//정보 수정
	@RequestMapping(value="/account/profile/config/modify", method = RequestMethod.GET)
	public ModelAndView memeberModify(@ModelAttribute("mem") MemberModel mem,
			HttpSession session ) throws Exception {
		ModelAndView mv = new ModelAndView(); 
		
		String[] mbtiList = listMbti.MBTI;
		mv.addObject("mbtiList", mbtiList);
		
		session.getAttribute("session_mem_id");
		
		if(session.getAttribute("session_mem_id") !=null) {
			String id=(String) session.getAttribute("session_mem_id");
			mem=memberService.getMem(id);
			
			mv.setViewName("front/account/profile/config/account_profile_config_modify");
			mv.addObject("mem", mem); 
			return mv;
		
		} else {
			mv.setViewName("front/member/login/member_login_form");
			return mv;
		}
	}
	
	 
	
	@RequestMapping(value="/account/profile/config/modify", method = RequestMethod.POST)
	public ModelAndView memberModifyEnd(@ModelAttribute("mem") MemberModel mem, BindingResult bindingResult,
			HttpSession session, MultipartHttpServletRequest request ) throws Exception { 

		ModelAndView mv = new ModelAndView();
		
		String id=(String) session.getAttribute("session_mem_id");
		mem.setId(id);	
		
		//공개여부설정 처리
		String privateYn = mem.getPrivate_yn();
		System.out.println(privateYn);
		
		//배경이미지는 기본 이미지로 지정			
		mem.setBack_img("mem_no_back_img.png");
		
		memberService.updatemodify(mem);
		mem = memberService.selectIdMember(mem.getId());
		if (mem != null) {
			session.setAttribute("session_mem_nick", mem.getNick());
		}
		
		mv.setViewName("redirect:/account/profile/config/modify");
		return mv;
	}
	
	@RequestMapping(value = "/passwordChange.do", method = RequestMethod.GET)
	public String passwordChange() {
		return "passwordChange";
	}
	
	
	@RequestMapping(value = "/passwordChange.do", method = RequestMethod.POST)
	public ModelAndView changePw(@ModelAttribute("mem") MemberModel mem, BindingResult bindingResult ,HttpSession session
			, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView();
		new PwChangeValidator().validate(mem, bindingResult);
		
		if(bindingResult.hasErrors()){
				mv.setViewName("passwordChange");
				return mv;
				
		}
		
			String id=(String) session.getAttribute("session_mem_id");
			mem.setId(id);
			
			MemberModel m=memberService.getMem(id);
			
			String pw=request.getParameter("pw");
			pw=new String(Base64.encodeBase64(pw.getBytes()));
			
		if(m.getPassword() == null || !m.getPassword().equals(pw)) {
	
			mv.addObject("message", "기존 비밀번호가 일치하지 않습니다.");
			mv.setViewName("passwordChange");
			return mv;
		}  else {
			 
			mem.setPassword(new String(Base64.encodeBase64(mem.getPassword().getBytes())));
			memberService.updatepwChange(mem);	
			mv.setViewName("/mypage_set/InfoModSuc");
		}			
			return mv;
	}

	@RequestMapping(value = "/memberDelete.do")
	public ModelAndView memberDelete(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String id=(String) session.getAttribute("session_mem_id");
		
		memberService.memberDelete(id);
		
		Enumeration<?> valueNames = session.getAttributeNames();
		while (valueNames.hasMoreElements()) {
			String sessionKey = (String) valueNames.nextElement();
			session.removeAttribute(sessionKey);
		}

		session.invalidate();
		
		mv.setViewName("/mypage_set/memDelSuc");

		return mv;
	}

	
}
