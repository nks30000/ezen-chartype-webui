package charType.member.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import charType.member.MemberModel;

public class PwChangeValidator  implements Validator {
	
	@Override
	public boolean supports(Class<?> cls) {
		return MemberModel.class.isAssignableFrom(cls);
	}
	
	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "required"); 
		MemberModel mem = (MemberModel) target;
		
		if (mem.hasPassword()) {
			if (mem.getPassword().length() < 7)
				errors.rejectValue("password", "reg.password.shortPassword");
			else if (!mem.isSamePasswordConfirmPassword())
				errors.rejectValue("confirmPassword", "reg.confirmPassword.NotSame");
		}
	}

}
