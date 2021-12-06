package charType.community.recomFriend;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import charType.utils.common.dao.AbstractDAO;

@Repository("recomDao")
public class RecomFriendDAO extends AbstractDAO {
	
	//같은 MBTI 회원 리스트 보기
			@SuppressWarnings("unchecked")
			public List<Map<String, Object>> recomFriend(Map<String, Object> map)
				throws Exception {
				return (List<Map<String,Object>>) selectList("recom.recomFriend", map);
			}
			
	//MBTI 리스트 
			@SuppressWarnings("unchecked")
			public List<Map<String, Object>> loveFriend(Map<String, Object> map)
				throws Exception {
				return (List<Map<String,Object>>) selectList("recom.loveFriend", map);
			}

}
