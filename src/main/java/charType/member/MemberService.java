package charType.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import charType.member.MemberModel;

public interface MemberService{

	MemberModel insertUser(MemberModel mem) throws Exception;
	
	MemberModel selectIdMember(String Id) throws Exception;
	
	MemberModel selectFindId(MemberModel mem) throws Exception;
	
	MemberModel selectFindPassword(MemberModel mem) throws Exception;
	
	String findNickName(String id) throws Exception;
	
	String findProfImg(String id) throws Exception;
	
	MemberModel getMem(String id) throws Exception;

	void updatemodify(MemberModel mem) throws Exception;

	void updatepwChange(MemberModel mem) throws Exception;
	
	void memberDelete(String id) throws Exception;
	
	
	void insertProfileImg(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void updateProfileImg(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void deleteProfileImg(String id) throws Exception;
	
	Map<String, Object> selectProfileImg(String saved_nm) throws Exception;
	
	int nickCheck(String str) throws Exception;
	int idCheck(String str) throws Exception;
	
	Map<String, Object> seletUserByEmail(String email) throws Exception;
	
}
