package charType.like;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface LikeService {

	public List<Map<String, Object>> selectBoardLike(Map<String, Object> map)
			throws Exception;
	
	public Integer selectTimelineLikeCheck(Map<String, Object> map)
			throws Exception;
	
	public void insertTimelineLike(Map<String, Object> map)
			throws Exception;
	
	public void deleteTimelineLike(Map<String, Object> map)
			throws Exception;

	public List<Map<String, Object>> myLikelist(Map<String, Object> map)
			throws Exception;


		
	
}