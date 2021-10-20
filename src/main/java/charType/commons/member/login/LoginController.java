package charType.commons.member.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import charType.utils.common.mapper.CommandMap;

@Controller
@RequestMapping("/common/member")
public class LoginController {
	@RequestMapping("/login/form")
	public String loginForm(CommandMap commandMap) throws Exception {
		
		return "/front/common/member/login/common_member_login_form";
	}
}
