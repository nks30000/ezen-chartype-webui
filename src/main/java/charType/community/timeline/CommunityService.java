package charType.community.timeline;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface CommunityService {

	List<Map<String, Object>> selectListCommunityTimeline(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectPrivateCommunityTimeline(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> communityStorySearchNick(Map<String, Object> map, HttpServletRequest request) throws Exception;
}