package charType.comment;

import java.util.Map;
import java.util.List;

public interface CommentService {
	
	void writeComment(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectComment(Map<String, Object> map)
		throws Exception;
	
	void deleteComment(Map<String, Object> map) throws Exception;
	
	

}
