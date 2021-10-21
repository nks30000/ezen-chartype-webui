package charType.account.profile.timeline;

import java.util.List;
import java.util.Map;

public interface TimelineService {

	List<Map<String, Object>> selectAccountTimeline(Map<String, Object> map) throws Exception;
}
