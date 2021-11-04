package charType.member;

import org.springframework.stereotype.Repository;

import charType.member.MemberModel;
import charType.utils.common.dao.AbstractDAO;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Repository("memberDao")
public class MemberDao extends AbstractDAO{
	private final String NAMESPACE = "member.";
	Map param = new HashMap();
	
	public String insertUser(MemberModel mem) {
		insert(NAMESPACE+"insertUser" , mem);
		
		return mem.getId();
	}
	
	public int idChk(String id){
		MemberModel idChk = (MemberModel) selectOne(NAMESPACE+"selectIdMember", id);
		int idExist = 0;
		if(idChk != null){
			idExist = idChk.getId().length();
		}
		
		
		return  idExist;
	}

	public MemberModel selectIdMember(String id) {
		return (MemberModel) selectOne(NAMESPACE+"selectIdMember",id);
	}

	public MemberModel selectFindId(MemberModel mem){
		return (MemberModel) selectOne(NAMESPACE+"selectFindId", mem);
	}

	public MemberModel selectFindPassword(MemberModel mem){
		return (MemberModel) selectOne(NAMESPACE+"selectFindPassword", mem);
	}
	

	public String findNickName(String id){

		param.put("id", id);
		
		return (String) selectOne(NAMESPACE+"findNickName", param);
	}

	public String findProfImg(String id){

		param.put("id", id);
		
		return (String) selectOne(NAMESPACE+"findProfImg", param);
	}
	
	
	public MemberModel getMem(String id) {
		return (MemberModel) selectOne(NAMESPACE+"getMem",id);
	}
	
	public void updatemodify(MemberModel mem) {
		  update(NAMESPACE+"updatemodify", mem);
	}
	
	public void updatepwChange(MemberModel mem) {
		 update(NAMESPACE+"updatepwChange", mem);
	}
	
	public void memberDelete(String id){
		delete(NAMESPACE+"memberDelete", id);
	}
	
	public void insertProfileImg(Map<String, Object> map){
		insert(NAMESPACE+"insertProfileImg", map);
	}
	public void updateProfileImg(Map<String, Object> map){
		update(NAMESPACE+"updateProfileImg", map);
	}
	public void deleteProfileImg(String id){
		delete(NAMESPACE+"deleteProfileImg", id);
	}
	
	public void updateProfileImgAtUser(Map<String, Object> map){
		update(NAMESPACE+"updateProfileImgAtUser", map);
	}
	public void updateBackImgAtUser(Map<String, Object> map){
		update(NAMESPACE+"updateBackImgAtUser", map);
	}
	
	public Map<String, Object> selectProfileImg(String saved_nm) {
		return (Map<String, Object>) selectOne(NAMESPACE+"selectProfileImg", saved_nm);
	}
	
	public Integer nickCheck(String str) {
		return (Integer) selectOne(NAMESPACE+"nickCheck", str);
	}
	public Integer idCheck(String str) {
		return (Integer) selectOne(NAMESPACE+"idCheck", str);
	}
	
	public Map<String, Object> selectUserByEmail (String str) {
		return null;
	}
	public Map<String, Object> selectUserByPhone (String str) {
		return null;
	}
	public Map<String, Object> selectUserByNick (String str) {
		return null;
	}
}
