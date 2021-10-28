package charType.member.validator;

import org.codehaus.plexus.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import charType.member.MemberModel;

public class FindIdValidator implements Validator {

	@Override
	public boolean supports(Class<?> cls) {
		return MemberModel.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberModel mem = (MemberModel) target;
		String email = mem.getEmail();
		String nick = mem.getNick();

		String email_regex = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
		
		if(StringUtils.isBlank(email)){
			errors.rejectValue("email", "required");
		} else if(!email.matches(email_regex)){
			errors.rejectValue("email", "reg.email.invalid");
		}
		
		if(StringUtils.isBlank(nick)){
			errors.rejectValue("nick", "required");
		}
	}

}
