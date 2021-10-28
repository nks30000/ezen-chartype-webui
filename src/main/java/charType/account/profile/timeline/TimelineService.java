package charType.account.profile.timeline;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TimelineService {

	List<Map<String, Object>> selectAccountTimeline(Map<String, Object> map) throws Exception;
	
	void writeAccountTimeline(Map<String, Object> map, HttpServletRequest request) throws Exception;

	//void delAccountTimeline(Map<String, Object> map) throws Exception;
	
	void delAccountTimeline(int num) throws Exception;
	
	void delTimelineFile(int num) throws Exception;
	
	void delComment(int num) throws Exception;
	


}
