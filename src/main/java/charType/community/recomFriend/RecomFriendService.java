package charType.community.recomFriend;

import java.util.List;
import java.util.Map;

public interface RecomFriendService {
	
	List<Map<String, Object>> recomFriend(Map<String, Object> map) throws Exception;
	List<Map<String, Object>> loveFriend(Map<String, Object> map) throws Exception;
	
	}


