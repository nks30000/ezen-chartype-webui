package charType.member.validator;

import org.codehaus.plexus.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import charType.member.MemberModel;

public class LoginValidator implements Validator {

	@Override
	public boolean supports(Class<?> cls) {
		return MemberModel.class.isAssignableFrom(cls);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required");
		
		MemberModel mem = (MemberModel) target;
		String id_regex = "^[_a-zA-Z]+[0-9a-zA-Z]*";
		if(StringUtils.isBlank(mem.getId())){
			errors.rejectValue("id", "required");
		} else if(!mem.getId().matches(id_regex)){
			errors.rejectValue("id", "reg.id.invalid");
		}
	}

}
