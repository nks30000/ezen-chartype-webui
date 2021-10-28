package charType.member.validator;

import org.codehaus.plexus.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import charType.member.MemberModel;

public class ModifyValidator  implements Validator{
	
	@Override
	public boolean supports(Class<?> cls) {
		return MemberModel.class.isAssignableFrom(cls);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nickname", "required");
		
		MemberModel mem=(MemberModel) target;
		
		String email=mem.getEmail();
		
		String email_regex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
		
		if(mem.getIntro().length()>500){
			
			errors.rejectValue("intro", "reg.intro.introsize");
		}
		
		if(StringUtils.isBlank(email)){
			errors.rejectValue("email", "required");
		} else if(!mem.getEmail().matches(email_regex)){
			errors.rejectValue("email", "reg.email.invalid");
		}
		
	}

}
