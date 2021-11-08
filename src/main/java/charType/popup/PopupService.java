package charType.popup;

import java.util.Map;
import java.util.List;

public interface PopupService {
	
	 Map<String, Object> selectOneCommunityTimeline(Map<String, Object> map)
			throws Exception;
	 
	 List<Map<String, Object>> selectOneCommunityTimelineImage(Map<String, Object> map)
				throws Exception;
	 
	 void modifyAccountTimeLine(Map<String, Object> map) throws Exception;
	
	void writeComment(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectComment(Map<String, Object> map)
		throws Exception;
	
	Map<String, Object> selectCntComment(Map<String, Object> map)
		throws Exception;
	
	void deleteComment(Map<String, Object> map) throws Exception;
	
	void modifyComment(Map<String, Object> map) throws Exception;
	
	

}
