package charType.community.recomFriend;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("recomFriendService")
public class RecomFriendServiceImpl implements RecomFriendService {
	
	@Resource(name="recomDao")
	private RecomFriendDAO recomDao;
	

		@Override
		public List<Map<String, Object>> recomFriend(Map<String, Object> map) throws Exception {
			return recomDao.recomFriend(map);
						
}

		@Override
		public List<Map<String, Object>> loveFriend(Map<String, Object> map) throws Exception {
			return recomDao.loveFriend(map);
}
}
