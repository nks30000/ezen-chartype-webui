package charType.member;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;
import org.codehaus.plexus.util.StringUtils;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import charType.member.validator.RegValidator;
import charType.utils.common.email.EmailConfig;
import charType.utils.common.email.EmailModel;
import charType.utils.common.email.EmailService;
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
	
	@Resource(name = "emailService")
	private EmailService emailService;
	
	@Autowired
    MessageSource messageSource;
	
	
	@RequestMapping(value = "/member/login/pleaselogin")
	public ModelAndView pleaseLogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("front/member/login/member_login_pleaselogin");
		return mv;
	}

	
	@RequestMapping(value = "/member/login/form", method = RequestMethod.GET)
	public ModelAndView loginForm(HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		String sessionId = (String) session.getAttribute("session_mem_id");
		//Session Check
		if(sessionId == null || sessionId =="" ) { //session검증 추가 처리 필요
			mv.setViewName("front/member/login/member_login_form");
		} else {
			mv.setViewName("redirect:/front/community/timeline/list");
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
				
				mv.setViewName("redirect:/front/account/profile/timeline");//mypage
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
		return new ModelAndView("/common/member/logout/common_member_logout");
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
		} else {
			mem.setPrivate_yn("Y");
		}
		
		
		MemberModel m = memberService.insertUser(mem);
		
//		log.debug("유저 입력 성공");
		
		if (m != null) {
			session.setAttribute("session_mem_id", m.getId());
			session.setAttribute("session_mem_nick", m.getNick());
			session.setAttribute("session_mem_mbti", m.getMbti());
		}
//		log.debug("세션 생성 완료");
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
		
	@RequestMapping(value = "/member/password/form")
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("front/member/password/member_password_form");
		
		String phone_regex = "^010+[0-9]{7,8}$";
		String id_regex = "^[A-Za-z]{1}[A-Za-z0-9]{3,19}$";
		String email_regex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		System.out.println("user_input : " + commandMap.get("user_input"));
		if(commandMap.get("user_input") != null) {
			String userInput = commandMap.get("user_input").toString();
			
			if(userInput.matches(phone_regex)) {
				//phone 처리
				System.out.println("휴대폰번호");
			}
			if(userInput.matches(id_regex)) {
				//id 처리
				System.out.println("아이디");
				
			}
			if(userInput.matches(email_regex)) {
				//mail 처리
				System.out.println("이메일");
			}
		}
		
		
		return mv;
	}


//	@RequestMapping(value = "/memberFind/id", method = RequestMethod.POST)
//	public ModelAndView findId(@ModelAttribute("mem") MemberModel mem, BindingResult bindingResult) throws Exception {
//		ModelAndView mv = new ModelAndView("memberFindForm");
//		mv.addObject("state", "id");
//		new FindIdValidator().validate(mem, bindingResult);
//		if(bindingResult.hasErrors()){
//			return mv;
//		} else {
//			MemberModel m = memberService.selectFindId(mem);
//			if (m == null || StringUtils.isBlank(m.getId())) {
//				mv.addObject("message", "입력하신 정보와 일치하는 ID가 없습니다.");
//				return mv;
//			} else {
//				mv.addObject("message", "찾은 ID : <strong>"+m.getId()+"</strong>");
//				return mv;
//			}
//		}
//	}
	

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
	@RequestMapping(value = "/member/deleteMember")
	public ModelAndView deleteMember(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String id=(String) session.getAttribute("session_mem_id");
		
		Map<String, Object> resMap = memberService.selectUserById(commandMap.getMap());
		
		String inputPw = (String) commandMap.get("password");
		
		if(!inputPw.equals((String)resMap.get("PASSWORD"))) {
			mv.setViewName("redirect:/error/500?code=0");
			return mv;
		}
		memberService.memberDelete(id);
		
		Enumeration<?> valueNames = session.getAttributeNames();
		while (valueNames.hasMoreElements()) {
			String sessionKey = (String) valueNames.nextElement();
			session.removeAttribute(sessionKey);
		}
		
		session.invalidate();
		
		mv.setViewName("redirect:/member/login/form");
		
		return mv;
	}
	@RequestMapping(value = "/member/sign/popup/checkNick")
	@ResponseBody
	public int checkNick(@RequestParam("nick") String str) throws Exception {
		return memberService.nickCheck(str);
	}
	@RequestMapping(value = "/member/sign/popup/checkId")
	@ResponseBody
	public int checkId(@RequestParam("id") String str) throws Exception {
		return memberService.idCheck(str);
	}
	
	
	@RequestMapping(value = "/member/sign/sendNewPassword")
	public ModelAndView sendNewPassword(CommandMap commandMap, HttpServletRequest request,  HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/front/member/sign/popup/member_sign_popup_nickcheck");
		
		EmailModel mail = new EmailModel(); 
        mail.setMailFrom("nks30000@gmail.com");
        mail.setMailTo("nks30000@naver.com");
        mail.setMailSubject("회원님의 비밀번호를 초기화했습니다");
        
        String html = "<div>";
        html += "당신의 비밀번호는 알수없네요 미안합니다";
        html += "</div>";
        mail.setMailContent(html);
 
//        AbstractApplicationContext context = new AnnotationConfigApplicationContext(EmailConfig.class);
//        EmailService mailService = (EmailService) context.getBean("emailService");
        
        emailService.sendEmail(mail);
//        context.close();
        
		return mv;
		
	}
}
