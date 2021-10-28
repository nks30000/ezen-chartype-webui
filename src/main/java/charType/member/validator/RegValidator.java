package charType.member.validator;

import org.codehaus.plexus.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import charType.member.MemberModel;

public class RegValidator implements Validator {

	@Override
	public boolean supports(Class<?> cls) {
		return MemberModel.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "nick", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "required");
		MemberModel mem = (MemberModel) target;
		String id = mem.getId();
		String email = mem.getEmail();
		
		String id_regex = "^[_a-z]+[0-9a-z]*";
		String email_regex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
		
		if (mem.hasPassword()) {
			if (mem.getPassword().length() < 7)
				errors.rejectValue("password", "reg.password.shortPassword");
			else if (!mem.isSamePasswordConfirmPassword())
				errors.rejectValue("confirmPassword", "reg.confirmPassword.NotSame");
		}
		
		if(mem.getIntro().length()>500){
			errors.rejectValue("intro", "reg.intro.introsize");
		}
		
		if(StringUtils.isBlank(id)){
			errors.rejectValue("id", "required");
		}else if(mem.getId().length()<5){
			errors.rejectValue("id", "reg.id.shortId");
		}else if(!mem.getId().matches(id_regex)){
			errors.rejectValue("id", "reg.id.invalid");
		}
		if(StringUtils.isBlank(email)){
			errors.rejectValue("email", "required");
		} else if(!mem.getEmail().matches(email_regex)){
			errors.rejectValue("email", "reg.email.invalid");
		}
		
	}

}
