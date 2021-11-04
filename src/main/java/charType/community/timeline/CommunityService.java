package charType.community.timeline;

import java.util.List;
import java.util.Map;

public interface CommunityService {

	List<Map<String, Object>> selectListCommunityTimeline(Map<String, Object> map) throws Exception;
}
