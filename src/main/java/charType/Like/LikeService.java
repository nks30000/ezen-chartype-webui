package charType.Like;

import java.util.List;
import java.util.Map;

public interface LikeService {

	void likeReg(Map<String, Object> map)throws Exception;
	
	void likeDel(Map<String, Object> map)throws Exception;
	
	List<Map<String, Object>> likeCount(Map<String, Object> map)throws Exception;
	
	

	
}
