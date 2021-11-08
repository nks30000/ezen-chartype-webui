package charType.account.follow;

import java.util.List;
import java.util.Map;

public interface FollowService {
	
	List<Map<String, Object>> followerViewData(Map<String, Object> map)
				throws Exception;
	
	List<Map<String, Object>> followingViewData(Map<String, Object> map)
			throws Exception;
	
	Integer followExist(Map<String, Object> map)
			throws Exception;

	Map<String, Object> selectfollowQuan(Map<String, Object> map)
			throws Exception;
	
	Map<String, Object> selectfollowingQuan(Map<String, Object> map)
		throws Exception;
	
	void followReg(Map<String, Object> map) throws Exception;
	
	void followDel(Map<String, Object> map) throws Exception;
	

}
